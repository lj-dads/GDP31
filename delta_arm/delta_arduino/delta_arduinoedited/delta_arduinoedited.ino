#include <Arduino.h>
#include "ServoEasing.hpp"
#include <ros.h>
#include <std_msgs/Bool.h>
#include <geometry_msgs/Point.h>

//Servo setup
ServoEasing Servo1;
ServoEasing Servo2;
ServoEasing Servo3;

#define START_DEGREE_VALUE 0 // The degree value written to the servo at time of attach.

#define SERVO1_PIN 9
#define SERVO2_PIN 10
#define SERVO3_PIN 11
#define SPEED_IN_PIN A0
#define MODE_ANALOG_INPUT_PIN A1



// robot geometry
const float f = 25.0; // base
const float e = 7.0;  // end effector
const float rf = 20.0;
const float re = 35.0;

// trigonometric constants
const float sqrt3 = sqrt(3.0);
const float pi = 3.141592653; // PI
const float sin120 = sqrt3 / 2.0;
const float cos120 = -0.5;
const float tan60 = sqrt3;
const float sin30 = 0.5;
const float tan30 = 1 / sqrt3;

float theta1 = 0;
float theta2 = 0;
float theta3 = 0;


void pointdata( const geometry_msgs::Point& points){
  // put your main code here, to run repeatedly:

  if (Serial.available() > 0)
  {
    float x = points.x;
    float y = points.y;
    float z = points.z;
    //double x = Double.parseDouble(first);

    delta_calcInverse(x, y, z, theta1, theta2, theta3);

    theta1 = -theta1 + 50;
    theta2 = -theta2 + 50;
    theta3 = -theta3 + 50;

    Serial.println(theta1);
    Serial.println(theta2);
    Serial.println(theta3);

    move_servos(theta1, theta2, theta3);
  }

  delay(1000);
  str_msg.data = True;
  exit_status.publish( &bool_msg );
}
ros::NodeHandle  nh;
std_msgs::Bool bool_msg;
ros::Publisher exit_status("exit_status", &bool_msg);
ros::Subscriber <geometry_msgs::Point> sub("points", &pointdata);
void setup()
{
  // put your setup code here, to run once:

  //initialise publisher and subscriber nodes
  nh.initNode();
  nh.advertise(exit_status);
  nh.subscribe(sub);

  //servo.attach(servoPin);
  Serial.begin(115200);

  Servo1.attach(SERVO1_PIN, START_DEGREE_VALUE);
  Servo2.attach(SERVO2_PIN, START_DEGREE_VALUE);

  if (Servo3.attach(SERVO3_PIN, START_DEGREE_VALUE) == INVALID_SERVO)
  {
    Serial.println(
        F("Error attaching servo - maybe MAX_EASING_SERVOS=" STR(MAX_EASING_SERVOS) " is to small to hold all servos"));
  }

  Serial.println(F("Setup complete"));
  delay(500);
}

void loop()
{
  nh.spinOnce();
  delay(1);
}

// inverse kinematics
// helper functions, calculates angle theta1 (for YZ-pane)
int delta_calcAngleYZ(float x0, float y0, float z0, float &theta)
{
  float y1 = -0.5 * 0.57735 * f; // f/2 * tg 30
  y0 -= 0.5 * 0.57735 * e;       // shift center to edge

  // z = a + b*y
  float a = (x0 * x0 + y0 * y0 + z0 * z0 + rf * rf - re * re - y1 * y1) / (2 * z0);
  float b = (y1 - y0) / z0;

  // discriminant
  float d = -(a + b * y1) * (a + b * y1) + rf * (b * b * rf + rf);
  if (d < 0)
    return -1;                                     // non-existing point
  float yj = (y1 - a * b - sqrt(d)) / (b * b + 1); // choosing outer point
  float zj = a + b * yj;
  theta = 180.0 * atan(-zj / (y1 - yj)) / pi + ((yj > y1) ? 180.0 : 0.0);
  return 0;
}

// inverse kinematics: (x0, y0, z0) -> (theta1, theta2, theta3)
// returned status: 0=OK, -1=non-existing position

int delta_calcInverse(float x0, float y0, float z0, float &theta1, float &theta2, float &theta3)
{
  theta1 = theta2 = theta3 = 0;
  int status = delta_calcAngleYZ(x0, y0, z0, theta1);
  if (status == 0)
    status = delta_calcAngleYZ(x0 * cos120 + y0 * sin120, y0 * cos120 - x0 * sin120, z0, theta2); // rotate coords to +120 deg
  if (status == 0)
    status = delta_calcAngleYZ(x0 * cos120 - y0 * sin120, y0 * cos120 + x0 * sin120, z0, theta3); // rotate coords to -120 deg
  return status;
}

void move_servos(float t1, float t2, float t3)
{
  // Move three servos synchronously without interrupt handler
  // this speed is changed for the first 2 servos below by synchronizing to the longest duration
  setSpeedForAllServos(20);

  ServoEasing::ServoEasingArray[0]->setEaseTo(t1); // This servo uses effectively 10 degrees per second, since it is synchronized to Servo3
  ServoEasing::ServoEasingArray[1]->setEaseTo(t2); // "ServoEasing::ServoEasingArray[1]->" can be used instead of "Servo2."
  Servo3.setEaseTo(t3);                            // This servo has the longest distance -> it uses 20 degrees per second
  synchronizeAllServosAndStartInterrupt(false);    // Do not start interrupt

  do
  {
    // here you can call your own program
    delay(REFRESH_INTERVAL_MILLIS); // optional 20ms delay
  } while (!updateAllServos());
}
