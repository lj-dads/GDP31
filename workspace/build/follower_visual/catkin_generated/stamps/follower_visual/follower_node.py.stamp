#!/usr/bin/env python

import rospy
import roslib
import tf.transformations
from sensor_msgs.msg import Image
from geometry_msgs.msg import Twist
import time
import numpy as np
import math
import cv2
import cv_bridge



bridge = cv_bridge.CvBridge()
## User-defined parameters: (Update these values to your liking)
# Minimum size for a contour to be considered anything
MIN_AREA = 5 

# Robot's speed when following the line
LINEAR_SPEED = 0.2

# Proportional constant to be applied on speed when turning 
# (Multiplied by the error value)
KP = 1.5/1000
# If the line is completely lost, the error value shall be compensated by:
LOSS_FACTOR = 1.2

# Send msgs every $TIMER_PERIOD seconds
TIMER_PERIOD = 0.05


# The maximum error value for which the robot is still in a straight line
MAX_ERROR = 30
# BGR values to filter only the selected color range
lower_bgr_values = np.array([0,  80,  0])
upper_bgr_values = np.array([60, 255, 60])

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
error = 0
msg = Twist()

def nothing(n):
    pass


def image_callback(msg):
    """
    Function to be called whenever a new Image msg arrives.
    Update the global variable 'image_input'
    """
    global image_input
    image_input = bridge.imgmsg_to_cv2(msg,desired_encoding='bgr8')
    # node.get_logger().info('Received image')

def get_contour_data(img):
    mask = cv2.inRange(img, lower_bgr_values, upper_bgr_values)
    cv2.imshow('windo2qw',mask)

    image ,contours, hierarchy = cv2.findContours(mask, cv2.RETR_TREE, cv2.CHAIN_APPROX_TC89_L1)
    contour_centres = np.empty((0,2), int)       
    for c in contours:
        if (cv2.contourArea(c) > MIN_AREA):
                    # calculate moments for each contour
            M = cv2.moments(c)        
                    # calculate x,y coordinate of center
            cX = int(M["m10"] / M["m00"])
            cY = int(M["m01"] / M["m00"])
            contour_centres= np.append(contour_centres, np.array([[cX, cY]]), axis =0)

    return contour_centres

def turn_body():
    global msg
    msg.linear.x = 0
    msg.angular.z = 2
    cmd_pub.publish(msg)


def timer_callback(boo):
    var = 1
    while var < 2:
        global msg
        global error
        global image_input
        # Wait for the first image to be received
        if type(image_input) != np.ndarray:
            return
        height, width, _ = image_input.shape
        img = image_input.copy()

        #get contour centres from image
        contour_centres = get_contour_data(img)  

        ##need this if statement to get a new image from subscriber to feed back into 
        ##timer_callback


        if contour_centres.size == 0:
            turn_body()
            time.sleep(0.1)
            break

        #convert centres to line path
        [vx,vy,x0,y0] = cv2.fitLine(contour_centres, 2, 0, 0.01, 0.01)
        #draw line on image and find line properties
        m = 600
        cv2.line(img, (int(x0[0]-m*vx[0]), int(y0[0]-m*vy[0])),(int(x0[0]+m*vx[0]), int(y0[0]+m*vy[0])), (50, 255, 50), 4)
        #show image
        cv2.imshow('window',img)
        
        m = vy/vx
        angle_rad = abs(math.atan(m))
        # line equation is y = vy/vx *x + constant
        #height / 2 = vy/vx * x + constant
        #x = height/2 - constant *vx/vy
        #find middle x values
        constant = y0-m*x0
        middle_x = (height/2 - constant)/m
                

        if ((width / 2 - 110 > middle_x) or (middle_x > width / 2 + 110)):
            msg.angular.z = ((width/2)-middle_x) * KP
        else:
            msg.linear.x = 0.1

        # #output velocities
        # if (math.pi/2 - 0.2 < angle_rad < math.pi/2 + 0.2): #for skewed line
        #     if (width / 2 - 110 < middle_x < width / 2 + 110):   #for off centre line
        #         msg.linear.x = 0.2
        #     else:
        #         error = middle_x - width//2
        #         msg.angular.z = float(error) * KP
        #         msg.linear.x = 0.01
        #         print("Error: {} | Angular Z: {}, ".format(error, msg.angular.z)) 
        # else:
        #     error = abs(angle_rad - math.pi/2)
        #     msg.angular.z = float(error) * KP
        #     msg.linear.x = 0.01
        #     print("Error: {} | Angular Z: {}, ".format(error, msg.angular.z)) 

        # Print the image for 5milis, then resume execution
        cv2.waitKey(5)

            # Publish the msg to 'cmd_vel'
        cmd_pub.publish(msg)
        var += 1




if __name__ == '__main__':
       
    try:
        rospy.init_node('Visual_Follower')
        cmd_pub = rospy.Publisher('/cmd_vel',Twist, queue_size=10)
        image_sub = rospy.Subscriber('percy/camera_front/image_raw',Image, image_callback, queue_size=10)
        timer = rospy.Timer(rospy.Duration(TIMER_PERIOD), timer_callback)

        rospy.spin()
    except rospy.ROSInterruptException:
        pass
