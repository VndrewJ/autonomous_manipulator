#!/usr/bin/env python3

import rospy
from sensor_msgs.msg import Image
from cv_bridge import CvBridge
import numpy as np
import pyrealsense2 as rs

def main():
    rospy.init_node('camera_publisher', anonymous=True)
    color_pub = rospy.Publisher('/camera/color/image_raw', Image, queue_size=10)
    depth_pub = rospy.Publisher('/camera/depth/image_raw', Image, queue_size=10)
    bridge = CvBridge()
    
    pipeline = rs.pipeline()
    config = rs.config()
    config.enable_stream(rs.stream.color, 640, 480, rs.format.bgr8, 30)
    config.enable_stream(rs.stream.depth, 640, 480, rs.format.z16, 30)
    pipeline.start(config)

    rate = rospy.Rate(30) # 30Hz
    try:
        while not rospy.is_shutdown():
            frames = pipeline.wait_for_frames()
            color_frame = frames.get_color_frame()
            depth_frame = frames.get_depth_frame()

            if not color_frame or not depth_frame:
                continue

            color_image = np.asanyarray(color_frame.get_data())
            depth_image = np.asanyarray(depth_frame.get_data())

            color_msg = bridge.cv2_to_imgmsg(color_image, "bgr8")
            depth_msg = bridge.cv2_to_imgmsg(depth_image, "16UC1")

            rospy.loginfo("sending images")

            color_pub.publish(color_msg)
            depth_pub.publish(depth_msg)

            rate.sleep()
    except rospy.ROSInterruptException:
        pass
    finally:
        pipeline.stop()

if __name__ == '__main__':
    main()


