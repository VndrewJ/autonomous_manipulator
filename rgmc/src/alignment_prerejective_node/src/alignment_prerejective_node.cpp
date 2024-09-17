#include <ros/ros.h>
#include <sensor_msgs/PointCloud2.h>
#include <pcl_conversions/pcl_conversions.h>
#include <librealsense2/rs.hpp>
#include <pcl/point_types.h>
#include <pcl/point_cloud.h>
#include <pcl/io/pcd_io.h>
#include <pcl/filters/voxel_grid.h>
#include <pcl/registration/sample_consensus_prerejective.h>
#include <tf/transform_broadcaster.h>

// Convert RealSense point cloud to PCL point cloud
pcl::PointCloud<pcl::PointXYZ>::Ptr points_to_pcl(const rs2::points& points) {
    auto pcl_points = pcl::make_shared<pcl::PointCloud<pcl::PointXYZ>>();
    pcl_points->width = points.size();  // Set width to the size of the points
    pcl_points->height = 1;             // Unorganized point cloud, set height to 1
    pcl_points->is_dense = false;       // RealSense point clouds might have NaN values
    pcl_points->points.resize(points.size());

    const rs2::vertex* vertices = points.get_vertices();
    for (size_t i = 0; i < points.size(); ++i) {
        pcl_points->points[i].x = vertices[i].x;
        pcl_points->points[i].y = vertices[i].y;
        pcl_points->points[i].z = vertices[i].z;
    }

    return pcl_points;
}

int main(int argc, char** argv) {
    // Initialize ROS node
    ros::init(argc, argv, "alignment_prerejective_node");
    ros::NodeHandle nh;

    // ROS publishers for the object and scene point clouds
    ros::Publisher object_pub = nh.advertise<sensor_msgs::PointCloud2>("object_cloud", 1);
    ros::Publisher scene_pub = nh.advertise<sensor_msgs::PointCloud2>("scene_cloud", 1);
    ros::Publisher aligned_pub = nh.advertise<sensor_msgs::PointCloud2>("aligned_cloud", 1);

    // Initialize RealSense pipeline
    rs2::pipeline pipe;
    pipe.start();

    // Point clouds
    pcl::PointCloud<pcl::PointXYZ>::Ptr object(new pcl::PointCloud<pcl::PointXYZ>);
    pcl::PointCloud<pcl::PointXYZ>::Ptr scene(new pcl::PointCloud<pcl::PointXYZ>);
    pcl::PointCloud<pcl::PointXYZ>::Ptr aligned_object(new pcl::PointCloud<pcl::PointXYZ>);

    // Load object model from PCD file
    if (pcl::io::loadPCDFile<pcl::PointXYZ>("/home/mechp4p/Desktop/Catkin/src/alignment_prerejective_node/data/object_converted.pcd", *object) < 0) {
        ROS_ERROR("Error loading object file!");
        return -1;
    }

    // Create a sensor_msgs::PointCloud2 message for RViz
    sensor_msgs::PointCloud2 object_msg;
    pcl::toROSMsg(*object, object_msg);
    object_msg.header.frame_id = "object_frame";

    ros::Rate loop_rate(10);  // 10 Hz loop rate for publishing

    tf::TransformBroadcaster broadcaster;

    while (ros::ok()) {
        // Define the transform between camera_frame and object_frame
        tf::Transform transform;
        transform.setOrigin(tf::Vector3(0.0, 0.0, 0.0));  // Set the translation
        tf::Quaternion q;
        q.setRPY(0, 0, 0);  // Set rotation (roll, pitch, yaw)
        transform.setRotation(q);

        // Broadcast the transform
        broadcaster.sendTransform(
            tf::StampedTransform(transform, ros::Time::now(), "camera_frame", "object_frame"));

        // Capture frames from the RealSense camera
        rs2::frameset frames = pipe.wait_for_frames();
        rs2::frame depth = frames.get_depth_frame();

        // Convert RealSense frame to PCL point cloud
        rs2::pointcloud rs_pc;
        rs2::points points = rs_pc.calculate(depth);
        scene = points_to_pcl(points);

        // Convert scene to ROS message
        sensor_msgs::PointCloud2 scene_msg;
        pcl::toROSMsg(*scene, scene_msg);
        scene_msg.header.frame_id = "camera_frame";

        // Publish object and scene point clouds
        object_pub.publish(object_msg);
        scene_pub.publish(scene_msg);

        // For now, publish the object cloud as the aligned cloud (replace with real alignment later)
        aligned_pub.publish(object_msg);  // Placeholder, replace with actual aligned cloud

        ros::spinOnce();
        loop_rate.sleep();
    }

    return 0;
}

