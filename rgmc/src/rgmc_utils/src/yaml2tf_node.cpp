#include <geometry_msgs/TransformStamped.h>
#include <ros/ros.h>
#include <tf/tf.h>
#include <tf2_ros/static_transform_broadcaster.h>
#include <tf2_ros/transform_broadcaster.h>
#include <yaml-cpp/yaml.h>
// #include <yaml.h>

#include <eigen3/Eigen/Dense>
#include <fstream>
#include <iostream>

Eigen::Matrix4d gen_rot_mat(const YAML::Node& axis_equivalence_dict) {
    Eigen::Matrix4d output = Eigen::Matrix4d::Identity();
    std::string x_equivalence = axis_equivalence_dict["cad_X_axis_is_ros"].as<std::string>();
    std::string z_equivalence = axis_equivalence_dict["cad_Z_axis_is_ros"].as<std::string>();
    double x_axis_v, z_axis_v;
    std::map<std::string, int> axis_name2index{{"X", 0}, {"Y", 1}, {"Z", 2}};

    if (x_equivalence[0] == '-') {
        x_axis_v = -1.0;
        x_equivalence.erase(0, 1);
    } else {
        x_axis_v = 1.0;
    }

    if (z_equivalence[0] == '-') {
        z_axis_v = -1.0;
        z_equivalence.erase(0, 1);
    } else {
        z_axis_v = 1.0;
    }

    int v_index = axis_name2index[x_equivalence];
    Eigen::Vector3d x_axis = Eigen::Vector3d::Zero();
    x_axis[v_index] = x_axis_v;
    output.block(0, 0, 3, 3).row(0) = x_axis;

    Eigen::Vector3d z_axis = Eigen::Vector3d::Zero();
    v_index = axis_name2index[z_equivalence];
    z_axis[v_index] = z_axis_v;
    output.block(0, 0, 3, 3).row(2) = z_axis;

    output.block(0, 0, 3, 3).row(1) = z_axis.cross(x_axis);

    return output;
}

Eigen::Matrix4d gen_trans_mat(const YAML::Node& axis_equivalence_dict) {
    Eigen::Matrix4d output = Eigen::Matrix4d::Identity();

    output(0, 3) = axis_equivalence_dict["shift_origin_x_by"].as<double>();
    output(1, 3) = axis_equivalence_dict["shift_origin_y_by"].as<double>();
    output(2, 3) = axis_equivalence_dict["shift_origin_z_by"].as<double>();

    return output;
}

Eigen::Matrix4d yamlnode2mat(const YAML::Node& pose_node) {
    Eigen::Matrix4d m;
    Eigen::Quaterniond q(pose_node["q_w"].as<double>(), pose_node["q_x"].as<double>(),
                         pose_node["q_y"].as<double>(), pose_node["q_z"].as<double>());

    m << Eigen::Matrix4d::Identity(4, 4);

    m(0, 3) = pose_node["x"].as<double>();
    m(1, 3) = pose_node["y"].as<double>();
    m(2, 3) = pose_node["z"].as<double>();

    m.block(0, 0, 3, 3) = q.normalized().toRotationMatrix();
    return m;
}

int main(int argc, char** argv) {
    ros::init(argc, argv, "yaml2tf_node");

    ros::NodeHandle nh();
    ros::NodeHandle p_nh("~");

    std::string positions_file;
    std::string transforms_file;

    std::vector<geometry_msgs::TransformStamped> ts_list;
    int output_rate;
    bool publish_static;

    if (!p_nh.getParam("positions_file", positions_file)) {
        ROS_ERROR_STREAM("Required parameter " << p_nh.resolveName("positions_file")
                                               << " not given.");
        return -1;
    }

    if (!p_nh.getParam("transforms_file", transforms_file)) {
        ROS_ERROR_STREAM("Required parameter " << p_nh.resolveName("transforms_file")
                                               << " not given.");
        return -1;
    }

    if (!p_nh.getParam("output_rate", output_rate)) {
        ROS_ERROR_STREAM("Required parameter " << p_nh.resolveName("output_rate") << " not given.");
        return -1;
    }

    tf2_ros::TransformBroadcaster br;
    tf2_ros::StaticTransformBroadcaster static_br;

    publish_static = output_rate == 0;

    if (output_rate == 0) {
        // We ajust because the rate can't be equal to 0
        output_rate = 1;
    }
    ros::Rate pub_rate(output_rate);

    std::ifstream cad_pos_fstream(positions_file);
    YAML::Node cad_pos_yml = YAML::Load(cad_pos_fstream);
    std::ifstream transf_fstream(transforms_file);
    YAML::Node transf_yaml = YAML::Load(transf_fstream);

    for (auto component : cad_pos_yml) {
        std::string component_name = component.first.as<std::string>();
        YAML::Node pose = component.second;

        // Getting the matrix of the object in cad's ref frame
        Eigen::Matrix4d cad_pose_mat = yamlnode2mat(pose);
        // Getting the transform as a matrix from the yaml file
        YAML::Node transf_node = transf_yaml[component_name];
        Eigen::Matrix4d rot_transf = gen_rot_mat(transf_node["desired_transformation"]);
        Eigen::Matrix4d trans_transf = gen_trans_mat(transf_node["desired_transformation"]);
        // We apply the transforms to the pos matrix calculated before:
        cad_pose_mat = cad_pose_mat * rot_transf;    // We first do rotation
        cad_pose_mat = cad_pose_mat * trans_transf;  // Then translation

        // We now create the TransformStamped that will hold the object's data:
        Eigen::Matrix3d rot_mat = cad_pose_mat.block(0, 0, 3, 3);
        Eigen::Quaterniond q(rot_mat);
        geometry_msgs::TransformStamped ts;

        ts.header.frame_id = transf_node["tf_parent"].as<std::string>();
        ts.child_frame_id = transf_node["output_tf_name"].as<std::string>();

        ts.transform.rotation.w = q.w();
        ts.transform.rotation.x = q.x();
        ts.transform.rotation.y = q.y();
        ts.transform.rotation.z = q.z();

        ts.transform.translation.x = cad_pose_mat(0, 3);
        ts.transform.translation.y = cad_pose_mat(1, 3);
        ts.transform.translation.z = cad_pose_mat(2, 3);

        ts_list.push_back(ts);
    }

    while (ros::ok()) {
        ros::Time tstamp = ros::Time::now();
        for (int i = 0; i < ts_list.size(); i++) {
            ts_list[i].header.stamp = tstamp;
            // component_ts.header.stamp = tstamp;
        }
        if (publish_static) {
            static_br.sendTransform(ts_list);
            break;
        } else {
            br.sendTransform(ts_list);
            pub_rate.sleep();
        }
    }
    if (publish_static) {
        ros::spin();
    }

    return 0;
}