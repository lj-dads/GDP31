#! /usr/bin/env python

import rospy
from geometry_msgs.msg import Point
from std_msgs.msg import  Bool, Int32

def callback(data):
    rospy.loginfo("Point: %s, %s, %s", data.x, data.y, data.z)
    msg = Bool()
    msg = True
    pub = rospy.Publisher('exit_status', Bool, queue_size=10) 
    pub.publish(msg)


def listener():
    rospy.init_node('arduino_delta')
    rospy.Subscriber('coords', Point, callback)
    rospy.spin()


if __name__ == '__main__':
    listener()