#!/usr/bin/env python3

import rospy
from sensor_msgs.msg import PointCloud2
import sensor_msgs.point_cloud2 as pc2

def pointcloud_callback(msg):
    # Convert the ROS PointCloud2 message to a generator of point tuples
    points = pc2.read_points(msg, field_names=None, skip_nans=True)
    
    rospy.

def main():
    rospy.init_node('realsense_pointcloud_node')
    rospy.Subscriber('/camera/depth/color/imgage_raw', PointCloud2, pointcloud_callback)
    rospy.spin()

if __name__ == '__main__':
    main()
