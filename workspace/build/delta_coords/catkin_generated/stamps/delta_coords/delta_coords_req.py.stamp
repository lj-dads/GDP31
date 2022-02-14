#!/usr/bin/env python

import rospy
import roslib
from sensor_msgs.msg import Image
from std_msgs.msg import String
from geometry_msgs.msg import Point
import time
import numpy as np
import math
import cv2
import cv_bridge


# BGR values to filter only the selected color range
lower_bgr_values = np.array([0,  0,  0])
upper_bgr_values = np.array([50, 50, 255])
bridge = cv_bridge.CvBridge()
def crop_size(height, width):
    """
    Get the measures to crop the image
    Output:
    (Height_upper_boundary, Height_lower_boundary,
     Width_left_boundary, Width_right_boundary)
    """
    ## Update these values to your liking.

    return (1*height//3, height, width//4, 3*width//4)

# Global vars. initial values
image_input = 0
msg = Point()
# Send msgs every $TIMER_PERIOD seconds
TIMER_PERIOD = 1


def image_callback(msg):
    """
    Function to be called whenever a new Image msg arrives.
    Update the global variable 'image_input'
    """
    global image_input
    image_input = bridge.imgmsg_to_cv2(msg,desired_encoding='bgr8')
    # node.get_logger().info('Received image')

def publish_coords(contours):
    global msg 
    c = max(contours, key = cv2.contourArea)
    contour_centre = np.empty((0,2), int)       
    if (cv2.contourArea(c) > 150):
        # calculate moments for each contour
        M = cv2.moments(c)        
        # calculate x coordinate of center
        cX = int(M["m10"] / M["m00"])
        #cY = int(M["m01"] / M["m00"])  
        msg = Point(x = cX)
        coord_pub.publish(msg)



def timer_callback(boo):
    var = 1
    while var < 2:
        global image_input
        # Wait for the first image to be received
        if type(image_input) != np.ndarray:
            return
        height, width, _ = image_input.shape
        img = image_input.copy()
        img_hsv = cv2.cvtColor(img, cv2.COLOR_BGR2HSV)
        ## Gen lower mask (0-5) and upper mask (175-180) of RED
        mask1 = cv2.inRange(img_hsv, (0,50,20), (5,255,255))
        mask2 = cv2.inRange(img_hsv, (175,50,20), (180,255,255))
        mask = cv2.bitwise_or(mask1, mask2 )
        #mask = cv2.inRange(img, lower_bgr_values, upper_bgr_values)
        cv2.imshow('mask', mask)
        cv2.waitKey(5)
        image ,contours, hierarchy = cv2.findContours(mask, cv2.RETR_TREE, cv2.CHAIN_APPROX_TC89_L1)
        if len(contours) < 1:
            break
        else:
            publish_coords(contours)


if __name__ == '__main__':
       
    try:
        rospy.init_node('Red_Searcher')
        coord_pub = rospy.Publisher('delta_coord_req', Point, queue_size = 10)
        image_sub = rospy.Subscriber('percy/camera_rear/image_raw',Image, image_callback, queue_size=10)
        #permission_sub = rospy.wait_for_message('/permission', String, timer_callback)
        timer = rospy.Timer(rospy.Duration(TIMER_PERIOD), timer_callback)

        rospy.spin()
    except rospy.ROSInterruptException:
        pass
