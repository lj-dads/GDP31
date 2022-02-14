#! /usr/bin/env python
import queue
import roslaunch
import roslib; roslib.load_manifest("rosserial_arduino")
import rospy
from geometry_msgs.msg import Twist, Point
import actionlib
#from SendCoords.msg import SendCoordsAction
from delta_coords.srv import *
from std_msgs.msg import  Bool, Int32

 

""" Idea of this is the server will recieve a coordinate from the front camera for a red plant.
It will then stop the Visual Line Follower node.
The rover will then slowly move in a straight line until the side camera can see the red plant. Maintains axial coord from the front cam.
Both coords will be sent to the delta arm arduino code which will reply with a completed message once it has carried out its service.
Then follower node can be restarted. A delay must be placed on the delta_coords restart to prevent a loop occuring. """


class DeltaMainServer:
   def __init__(self):
      self.server = actionlib.SimpleActionServer('send_coords', Action, self.execute, False)
      self.server.start()
 
   def bool_callback(self, boolean): 
      self.boolean_val = boolean
   
   def int_callback(self, intx): 
      self.int_x = intx

   def execute(self, goal):
   # Do lots of awesome groundbreaking robot stuff here
      
      #Stop Visual Line Follower and Rover
      self.node = roslaunch.core.Node('follower_visual','Visual Follower')
      self.launch = roslaunch.scriptapi.ROSLaunch()
      process = self.launch.launch(self.node)
      process.stop()

      self.msg = Twist()
      self.msg.linear.x = 0

      #Send coords to Delta Arm module
      """Delta coords send string (Point(x), Point_side(y), Point_side(z))
      """
      rospy.sleep(1)
      self.coord_point = Point()
      self.coord_point.x = self.int_x
      self.coord_point.y = goal(0)
      self.coord_point.z = goal(1)
      #self.exit_status = DeltaClient.delta_client(self.point_array)
      coord_pub.publish(self.coord_point)
      
      #Recieve reply saying Delta Arm is finished
      """ rospy.sleep() until Subscribe receives message confirming Delta done
      maybe find another method for this actually """
      while(self.boolean_val == False):
         rospy.sleep(0.5)

      #Restart Visual Node
      self.launch.start()
      self.server.set_succeeded()
 

""" class DeltaClient:
   def delta_client(self,point_array):
      rospy.wait_for_service('delta_arduino')
      try:
         self.actuate = rospy.ServiceProxy('delta_arduino', Test)
         self.exit_status = self.actuate(point_array)
         return self.exit_status.output
      except rospy.ServiceException as e:
         print("Service call failed: %s"%e) """

if __name__ == '__main__':
   rospy.init_node('delta_main_server')
   server = DeltaMainServer()
   cmd_pub = rospy.Publisher('/cmd_vel',Twist, queue_size=10)
   coord_pub = rospy.Publisher('coords', Point, queue_size=10)
   arduino_sub = rospy.Subscriber('exit_status', Bool, server.bool_callback, queue_size=5)
   under_sub = rospy.Subscriber('delta_coord_req', Int32, server.int_callback,  queue_size = 10)
   
   rospy.spin()