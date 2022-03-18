#include <hardware_interface/joint_command_interface.h>
#include <hardware_interface/joint_state_interface.h>
#include <hardware_interface/robot_hw.h>
#include "ros/ros.h"
#include <boost/assign/list_of.hpp>
#include <controller_manager/controller_manager.h>
#include <ros/console.h>
#include <boost/chrono.hpp>
#include <ros/callback_queue.h>
#include "std_msgs/Float64MultiArray.h"
class Percy : public hardware_interface::RobotHW
{
public:
  std_msgs::Float64MultiArray wheelControlMsg;

  Percy() 
 { 

  std_msgs::Float64MultiArray wheelControlMsg;
    
    ros::V_string wheel_joint_names = boost::assign::list_of("joint_front_left_wheel")
      ("joint_front_right_wheel")("joint_rear_left_wheel")("joint_rear_right_wheel");
    ros::V_string steering_joint_names = boost::assign::list_of("steering_joint_front_left")("steering_joint_front_right")("steering_joint_rear_left")
    ("steering_joint_rear_right");

for (unsigned int i = 0; i < wheel_joint_names.size(); i++)
    {
    hardware_interface::JointStateHandle joint_state_handle(wheel_joint_names[i],&joints_[i].position, &joints_[i].velocity,&joints_[i].effort);
    joint_state_interface_.registerHandle(joint_state_handle);
    
     hardware_interface::JointHandle joint_handle(
        joint_state_handle, &joints_[i].velocity_command);
      velocity_joint_interface_.registerHandle(joint_handle);
    registerInterface(&joint_state_interface_);
    registerInterface(&velocity_joint_interface_);


        hardware_interface::JointStateHandle steering_joint_state_handle(steering_joint_names[i],&steering_joints_[i].position, &steering_joints_[i].velocity,&steering_joints_[i].effort);
    joint_state_interface_.registerHandle(steering_joint_state_handle);
    
     hardware_interface::JointHandle steering_joint_handle(
        steering_joint_state_handle, &steering_joints_[i].position_command);
      position_joint_interface_.registerHandle(steering_joint_handle);
    registerInterface(&joint_state_interface_);
    registerInterface(&position_joint_interface_);
    }


  }

void read(){
  //ROS_INFO("READ");
  // for(int i=0; i<4; i++){
  //   joints_[i].position = 1;
  //   joints_[i].effort =1;
  //   joints_[i].velocity=1;
  //   joints_[i].position_offset=0;
  // }
}

void write(){
  //ROS_INFO("WRITE");
  ROS_INFO_STREAM("Velocity of f left wheel is: " << joints_[0].velocity_command );
    ROS_INFO_STREAM("Velocity of f Right wheel is: " << joints_[1].velocity_command );
      ROS_INFO_STREAM("Velocity of R left wheel is: " << joints_[2].velocity_command );
    ROS_INFO_STREAM("Velocity of R Right wheel is: " << joints_[3].velocity_command );

    ROS_INFO_STREAM("Position of F left wheel is: " << steering_joints_[0].position_command );

    ROS_INFO_STREAM("Position of R left wheel is: " << steering_joints_[1].position_command );

  wheelControlMsg.data.clear(); 
  wheelControlMsg.data = {joints_[0].velocity_command,joints_[1].velocity_command,joints_[2].velocity_command,joints_[3].velocity_command, steering_joints_[0].position_command,steering_joints_[1].position_command,steering_joints_[2].position_command,steering_joints_[3].position_command};


}
void sendWheelCommands(){
    //ROS_INFO("writing");
    //ROS_INFO_STREAM("Velocity of left wheel is: " << joints_[0].velocity );
    // ROS_INFO_STREAM_NAMED(name_."Test");
}
ros::Time getTime(){

ros::Time curTime = ros::Time::now();
oldTime = curTime;
return curTime;
}
ros::Duration getPeriod(){
    ros::Duration period = ros::Time::now() - oldTime;
    return period;
}
private:
  hardware_interface::JointStateInterface joint_state_interface_;
  hardware_interface::VelocityJointInterface velocity_joint_interface_;
hardware_interface::PositionJointInterface position_joint_interface_;
  double cmd[2];
  double pos[2];
  double vel[2];
  double eff[2];
ros::Time oldTime;
    struct Joint
  {
    double position;
    double position_offset;
    double velocity;
    double effort;
    double velocity_command;
    double position_command;

    Joint() :
      position(0), velocity(0), effort(0), velocity_command(0), position_command(0)
    { }
  }
  joints_[4];

  Joint steering_joints_[4];
};

int main(int argc, char **argv){
    //      


  ros::init(argc, argv, "hwi");
   //  robot.sendWheelCommands();
 ros::NodeHandle n;
  ros::Publisher wheelCommand = n.advertise<std_msgs::Float64MultiArray>("WheelCommands",1000);
  ros::CallbackQueue queue;
  n.setCallbackQueue(&queue);
  ros::AsyncSpinner spinner(8,&queue);
  spinner.start();

    Percy robot;
    controller_manager::ControllerManager cm(&robot,n);

    
    // Control loop
    ros::Rate rate(10.0); // 10 Hz rate
    
    while (ros::ok())
    {

      // ROS_INFO("TEST");
        
       // robot.sendWheelCommands();
        robot.read();
     cm.update(robot.getTime(), robot.getPeriod());
     robot.write();
     wheelCommand.publish(robot.wheelControlMsg);
        //cm.update(time, period);
        
        
 
    //  ros::spinOnce();
        rate.sleep();
    }
      spinner.stop();
    return 0;
}