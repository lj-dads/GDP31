#include <ros.h>

// Voltage Monitoring Definitions
#define batVpin A2              // Analogue pin that voltage sensing is connected to
const double VCC = 5.0;          // set the supply voltage
int Vsamples = 15;              // Set number of samples

// Current Monitoring Definitions
#define batIpin A3                  // Analogue pin that current sensor Vout is connected to
double I_sensitivity = 20.0*0.001;    // Set sensitivity of current sensor in V/A  -  Find in datasheet (model currently used in ACS758LCB-100B)
double I_quiescentVoltage = VCC*0.5;    // Set quiescent voltage of sensor (found in datasheet)
int Isamples = 20;                       // Set number of samples

// Kill switch definitions
#define killSwitchPin 8
#define OverCurrentLED 7
#define UnderVoltageLED 6

// General variable definitions
float I;              // Variable to store the measured current
float V;              // Variable to store the measured voltage

// Ros code
ros::NodeHandle  nh;
geometry_msgs::Point point_msg;
ros::Publisher IV_Publisher("battery_status", &point_msg);

void setup() {
  Serial.begin(9600);
  delay(1000);
  pinMode(killSwitchPin, OUTPUT);             // sets the digital kill pin as output
  pinMode(OverCurrentLED, OUTPUT);            // sets the over current LED pin as output
  pinMode(UnderVoltageLED, OUTPUT);           // sets the under voltage LED pin as output
  digitalWrite(killSwitchPin, HIGH);          // Turn MOSFET on
  digitalWrite(OverCurrentLED, LOW);          // Turn over current LED off
  digitalWrite(UnderVoltageLED, LOW);         // Turn under voltage LED off
}

double batteryCurrent(){
  analogRead(batIpin);
  double V_Read=0;
  double current=0;

  for (int i=0; i<Isamples; i++){
    V_Read+=-(((analogRead(batIpin)+5)*(VCC/1023.0))-I_quiescentVoltage);      //4 is a number to make the current zero at 0 current
  }
  V_Read/=Isamples;

  current = V_Read/I_sensitivity;
  
  if(current>55.0){KillRobot(1);}
  
  return current;
}

double batteryVoltage(){
  double batV = 0;
  analogRead(batVpin);
  for (int i=0; i<Vsamples; i++){
    batV+=analogRead(batVpin)*(VCC/1023.0)*4.3054 + 0.105;       // Convert a to d value to measured value then scale analogue voltage to fit potential divider circuit (33k and 10k: (10+33)/10 = 4.3)
                                                                  // Calibration resulted in an adjustment og 4.3 to 4.3054 and a constant shift of 0.105
  }
  batV /= Vsamples;
  
  if(batV<13.6 && batV>5){KillRobot(2);}
                                          
  return batV;
}

void KillRobot(int killcode){
  digitalWrite(killSwitchPin, LOW);                       //Turn off all circuits by switching off MOSFET
  if(killcode == 1){
    //Serial.println("Overcurrent protection activated");
    digitalWrite(OverCurrentLED, HIGH);
  }
  else if(killcode = 2){
    //Serial.println("Undervoltage protection activated");
    digitalWrite(UnderVoltageLED, HIGH);
  }
}


void loop() {
  I=batteryCurrent();
  V=batteryVoltage();
  point_msg.x = I;
  point_msg.y = V;

  IV_Publisher.publish(&point_msg)
  //Now send V and I to Jetson over serial
  
  /*Serial.print("Battery voltage is ");
  Serial.print(V,2);
  Serial.println("V");
  Serial.print("Battery current is ");
  Serial.print(I,2);
  Serial.println("A");*/

  delay(1000);
}
