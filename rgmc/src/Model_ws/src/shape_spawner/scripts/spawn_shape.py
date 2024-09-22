#!/usr/bin/env python3

import rospy
from visualization_msgs.msg import Marker

def publish_marker():
    rospy.init_node('shape_spawner', anonymous=True)
    marker_pub = rospy.Publisher('visualization_marker', Marker, queue_size=10)
    rate = rospy.Rate(1)  # 1 Hz

    while not rospy.is_shutdown():
        marker = Marker()
        marker.header.frame_id = "base_link"
        marker.header.stamp = rospy.Time.now()

        marker.ns = "shape_spawner"
        marker.id = 0

        marker.type = Marker.CYLINDER

        marker.action = Marker.ADD

        marker.pose.position.x = 0.5
        marker.pose.position.y = 0.5
        marker.pose.position.z = 0.15
        marker.pose.orientation.x = 0.0
        marker.pose.orientation.y = 0.0
        marker.pose.orientation.z = 0.0
        marker.pose.orientation.w = 0.0

        marker.scale.x = 0.2
        marker.scale.y = 0.2
        marker.scale.z = 0.3

        marker.color.r = 0.0
        marker.color.g = 1.0
        marker.color.b = 0.0
        marker.color.a = 1.0

        marker.lifetime = rospy.Duration()

        while marker_pub.get_num_connections() < 1:
            if rospy.is_shutdown():
                return
            rospy.logwarn("Please create a subscriber to the marker")
            rospy.sleep(1)
        
        marker_pub.publish(marker)
        rate.sleep()

if __name__ == '__main__':
    try:
        publish_marker()
    except rospy.ROSInterruptException:
        pass
