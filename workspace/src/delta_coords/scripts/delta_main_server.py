#! /usr/bin/env python
import roslaunch
import roslib
import rospy
from geometry_msgs.msg import Twist
import actionlib
from geometry_msgs.msg import Point
from SendCoords.msg import SendCoordsAction
 

""" Idea of this is the server will recieve a coordinate from the front camera for a red plant.
It will then stop the Visual Line Follower node.
The rover will then slowly move in a straight line until the side camera can see the red plant. Maintains axial coord from the front cam.
Both coords will be sent to the delta arm arduino code which will reply with a completed message once it has carried out its service.
Then follower node can be restarted. A delay must be placed on the delta_coords restart to prevent a loop occuring. """


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

      # Rover moves forward until side camera can see red plant
      msg = Twist()
      msg.linear.x = 1
      msg.angular.z = 0
      cmd_pub.publish(msg)

      #Message that side camera can see red plant recieved
      """ rospy.spin()   
         if Point != 0{
            break break
         } """

      #stop rover
      msg.linear.x = 0

      #Send coords to Delta Arm module


      #Recieve reply saying Delta Arm is finished


      #Restart Visual Node
      launch.start()


      self.server.set_succeeded()
 
 
 if __name__ == '__main__':
   rospy.init_node('delta_main_server')
   cmd_pub = rospy.Publisher('/cmd_vel',Twist, queue_size=10)
   side_sub = rospy.Subscriber('delta_coord_req', Point, queue_size = 10)
   server = DeltaMainServer()
   rospy.spin()