#! /usr/bin/env python
import roslaunch
import roslib
import rospy
from geometry_msgs.msg import Twist
import actionlib

from SendCoords.msg import SendCoordsAction
 
class DeltaMainServer:
   def __init__(self):
      self.server = actionlib.SimpleActionServer('send_coords', Action, self.execute, False)
      self.server.start()
 
   def execute(self, goal):
   # Do lots of awesome groundbreaking robot stuff here
      
      #Stop Visual Line Follower
      node = roslaunch.core.Node('follower_visual','Visual Follower')
      launch = roslaunch.scriptapi.ROSLaunch()
      process.launch.launch(node)
      process.stop()

      #Stop Rover moving
      msg = Twist()
      msg.linear.x = 0
      msg.angular.z = 0
      cmd_pub.publish(msg)

      #Send coords to Delta Arm module

      #Recieve reply saying Delta Arm is finished

      #Restart Visual Node
      launch.start()


      self.server.set_succeeded()
 
 
 if __name__ == '__main__':
   rospy.init_node('delta_main_server')
   cmd_pub = rospy.Publisher('/cmd_vel',Twist, queue_size=10)
   server = DeltaMainServer()
   rospy.spin()