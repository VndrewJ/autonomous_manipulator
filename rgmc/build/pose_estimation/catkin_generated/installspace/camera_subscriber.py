#!/usr/bin/env python3

import rospy
from sensor_msgs.msg import Image
from cv_bridge import CvBridge
import cv2
import threading
import queue

class ImageSubscriber:
    def __init__(self, image_queue):
        self.bridge = CvBridge()
        self.image_queue = image_queue
        rospy.Subscriber('/camera/color/image_raw', Image, self.color_callback)
        rospy.Subscriber('/camera/depth/image_raw', Image, self.depth_callback)

    def color_callback(self, msg):
        cv_image = self.bridge.imgmsg_to_cv2(msg, "bgr8")
        self.image_queue.put(('color', cv_image))

    def depth_callback(self, msg):
        cv_image = self.bridge.imgmsg_to_cv2(msg, "16UC1")
        normalized_depth_image = cv2.normalize(cv_image, None, 0, 255, cv2.NORM_MINMAX)
        normalized_depth_image = cv2.convertScaleAbs(normalized_depth_image)
        self.image_queue.put(('depth', normalized_depth_image))


def display_images(image_queue):
    while not rospy.is_shutdown():
        try:
            image_type, cv_image = image_queue.get(timeout=1)
            if image_type == 'color':
                cv2.imshow("Color Image", cv_image)
            elif image_type == 'depth':
                cv2.imshow("Depth Image", cv_image)
            cv2.waitKey(1)
        except queue.Empty:
            continue

def main():
    rospy.init_node('d435i_subscriber', anonymous=True)
    image_queue = queue.Queue()
    
    img_sub = ImageSubscriber(image_queue)
    rospy.loginfo(f"ImageSubscriber initialized: {img_sub}")
    
    display_thread = threading.Thread(target=display_images, args=(image_queue,))
    display_thread.start()

    rospy.spin()

    display_thread.join()
    cv2.destroyAllWindows()

if __name__ == '__main__':
    main()

