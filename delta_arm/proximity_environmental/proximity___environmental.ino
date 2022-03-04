#include <ros.h>
#include <Arduino.h>
#include <std_msgs/Bool.h>
#include <geometry_msgs/Twist.h>
#define echoPin 2 // attach pin D2 Arduino to pin Echo of HC-SR04
#define trigPin 3 //attach pin D3 Arduino to pin Trig of HC-SR04

long duration; // variable for the duration of sound wave travel
int distance; // variable for the distance measurement
int i = 0;

ros::NodeHandle  nh;
std_msgs::Bool bool_msg;
geometry_msgs::Twist twist_msg;
ros::Publisher block("block", &bool_msg);
ros::Publisher cmd("cmd_vel", &twist_msg);

void setup() {
  pinMode(trigPin, OUTPUT); // Sets the trigPin as an OUTPUT
  pinMode(echoPin, INPUT); // Sets the echoPin as an INPUT
  nh.initNode();
  nh.advertise(block);
  Serial.begin(9600); // // Serial Communication is starting with 9600 of baudrate speed
  Serial.println("Ultrasonic Sensor HC-SR04 Test"); // print some text in Serial Monitor
  Serial.println("with Arduino UNO R3");
}
void loop() {
  // Clears the trigPin condition
  digitalWrite(trigPin, LOW);
  delayMicroseconds(2);
  // Sets the trigPin HIGH (ACTIVE) for 10 microseconds
  digitalWrite(trigPin, HIGH);
  delayMicroseconds(10);
  digitalWrite(trigPin, LOW);
  // Reads the echoPin, returns the sound wave travel time in microseconds
  duration = pulseIn(echoPin, HIGH);
  // Calculating the distance
  distance = duration * 0.034 / 2; // Speed of sound wave divided by 2 (go and back)

  // if distance is greater than 20cm then "i" will +1. When the "i" reaches 3 then it will give "OBSTACLE" signal. 
  if (distance<=20)
  {
    i += 1;
  }
  if (i >= 3)
  {
    //Pause movements and visual follower for 10 seconds
    twist_msg.linear.x = 0;
    twist_msg.angular.z = 0;
    str_msg.data = True;
    starttime = millis();
    endtime = starttime;
    while((endtime - starttime) < 10000){
      cmd.publish(&twist_msg);
      block.publish(&bool_msg);
      endtime = millis();
    }
    //Pause visual follower and reverse for 1 second
    twist_msg.linear.x = -1;
    str_msg.data = True;
    starttime = millis();
    endtime = starttime;
    while((endtime - starttime) < 1000){
      cmd.publish(&twist_msg);
      block.publish(&bool_msg);
      endtime = millis();
    }
    //Pause visual follower and drive forward for 0.5 second
    twist_msg.linear.x = 1;
    str_msg.data = True;
    starttime = millis();
    endtime = starttime;
    while((endtime - starttime) < 5000){
      cmd.publish(&twist_msg);
      block.publish(&bool_msg);
      endtime = millis();
    }
    if (distance<=20){
      twist_msg.linear.x = 0;
      while(True){
        cmd.publish(&twist_msg);
        rospy.loginfo("HELP ME AAHHHH!!!!")
      }
    }
    i = 0;

  }
  if (distance > 20)
  {
    i = 0;
  }
  //Serial.println(i);
  delay (800);
}
