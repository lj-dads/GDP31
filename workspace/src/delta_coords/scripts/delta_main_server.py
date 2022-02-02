#! /usr/bin/env python
import queue
import roslaunch
import roslib
import rospy
from geometry_msgs.msg import Twist
import actionlib
from geometry_msgs.msg import Point
from SendCoords.msg import SendCoordsAction
#from SendAllCoords.msg import SendAllCoordsAction, SendAllCoordsGoal
from std_msgs.msg import String, Bool
 

""" Idea of this is the server will recieve a coordinate from the front camera for a red plant.
It will then stop the Visual Line Follower node.
The rover will then slowly move in a straight line until the side camera can see the red plant. Maintains axial coord from the front cam.
Both coords will be sent to the delta arm arduino code which will reply with a completed message once it has carried out its service.
Then follower node can be restarted. A delay must be placed on the delta_coords restart to prevent a loop occuring. """

boolean_val = False

class DeltaMainServer:
   def __init__(self):
      self.server = actionlib.SimpleActionServer('send_coords', Action, self.execute, False)
      self.server.start()
 
   def bool_callback(boolean):
      global boolean_val 
      boolean_val = boolean

   def execute(self, goal):
   # Do lots of awesome groundbreaking robot stuff here
      
      #Stop Visual Line Follower
      node = roslaunch.core.Node('follower_visual','Visual Follower')
      launch = roslaunch.scriptapi.ROSLaunch()
      process.launch.launch(node)
      process.stop()

      # Rover moves forward until side camera can see red plant
      msg = Twist()
      while (Point(0) & Point(1) == 0):
         msg.linear.x = 1
         msg.angular.z = 0
         cmd_pub.publish(msg)


      #Message that side camera can see red plant recieved
 
      #stop rover
      msg.linear.x = 0

      #Send coords to Delta Arm module
      """Delta coords send string (Point(x), Point_side(y), Point_side(z))
      """
      rospy.sleep(1)
      point_string = "%d, %d ,%d" % (goal, Point(0), Point(1))
      coord_pub.publish(point_string)
      
      #Recieve reply saying Delta Arm is finished
      """rospy.sleep() until Subscribe receives message confirming Delta done
      maybe find another method for this actually"""
      while(boolean_val == False):
         rospy.sleep(0.5)
      
""" Looks like rosserial doesnt support action servers but I'll leave this as a placeholder in case 
      client = actionlib.SimpleActionClient('send_all_coords', SendAllCoordsAction)
      client.wait_for_server()

      goal = SendAllCoordsGoal(order=point_string)
      client.send_goal(goal)
      client.wait_for_result(rospy.Duration.from_sec(10.0))
 """
      #Restart Visual Node
      launch.start()


      self.server.set_succeeded()
 
 
if __name__ == '__main__':
   rospy.init_node('delta_main_server')
   cmd_pub = rospy.Publisher('/cmd_vel',Twist, queue_size=10)
   coord_pub = rospy.Publisher('coords', String, queue_size=10)
   arduino_sub = rospy.Subscriber('message', Bool, bool_callback, queue_size=5)
   side_sub = rospy.Subscriber('delta_coord_req_side', Point, queue_size = 10)
   server = DeltaMainServer()
   rospy.spin()