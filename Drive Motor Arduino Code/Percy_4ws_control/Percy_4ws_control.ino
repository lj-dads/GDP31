#include <PID_v1.h>

#include <ros.h>
#include <std_msgs/String.h>
#include <std_msgs/Float64MultiArray.h>

#include <AccelStepper.h>


ros::NodeHandle  nh;
uint8_t dirPin1 = 22;
uint8_t dirPin2 = 23;
uint8_t motor1Pin = 2;
uint8_t motor2Pin = 4;



//encoder Pins array
uint8_t encoderAPins[4]; //remember these must be interupt pins
uint8_t encoderBPins[4];  //this can just be digital pins
uint8_t pwmPins[4];
uint8_t dirPins[4];

long prevT_i[4];
volatile float velocity_i[4];

double Kp = 0.1, Ki = 25, Kd = 0.01;

double target, Input, Output;



//Stepper Motor Variables
#define motorInterfaceType 1
#define NUMSTEPPERS 2      //NOTE Change to 4 for rear robot
#define BUFFER 5
uint8_t stepDirPins[]={28,4,0,0}; //Need to add all stepper pins
uint8_t stepPins[]={29,3,0,0};    //Need to add all stepper pins
float stepperAngles[4];
float stepperSteps[4];
float curAngles[4];
int error[4];
int potVals[]={A12,A11};
uint8_t potPins[]={A12,A11};
int oldAngVals[4]; 

AccelStepper frontLeftStepper = AccelStepper(motorInterfaceType, stepPins[0], stepDirPins[0]);
AccelStepper frontRightStepper = AccelStepper(motorInterfaceType, stepPins[2], stepDirPins[2]);

AccelStepper rearLeftStepper = AccelStepper(motorInterfaceType, stepPins[1], stepDirPins[1]);
AccelStepper rearRightStepper = AccelStepper(motorInterfaceType, stepPins[3], stepDirPins[3]);


AccelStepper Steppers[] = {frontLeftStepper,rearLeftStepper}; //Just for testsing 
//AccelStepper Steppers[] = {frontLeftStepper,rearLeftStepper, frontRightStepper, rearRightStepper}; //for real robot

float lookUpTable[28][2]={
{0  ,0},
{10  ,0},
{20 , 0},
{30 , 6},
{40 , 46},
{50 , 87},
{60 , 128},
{70 , 168},
{80 , 208},
{90 , 253},
{100, 295},
{110, 336},
{120, 378},
{130, 422},
{140, 466},
{150, 514},
{160, 561},
{170, 607},
{180, 656},
{190 ,699},
{200 ,742},
{210 ,784},
{220, 825},
{230, 865},
{240, 905},
{250, 946},
{260, 990}, 
{270,1018}

  
  
  };





double motorSpeed[4]; //desired speed
double motorVelocity[4]; //actual speed of motor
double motorCMD[4]; //pwm signal from pid


PID myPID1(&motorVelocity[0], &motorCMD[0], &motorSpeed[0], Kp, Ki, Kd, DIRECT);
PID myPID2(&motorVelocity[1], &motorCMD[1], &motorSpeed[1], Kp, Ki, Kd, DIRECT);
PID myPID3(&motorVelocity[2], &motorCMD[2], &motorSpeed[2], Kp, Ki, Kd, DIRECT);
PID myPID4(&motorVelocity[3], &motorCMD[3], &motorSpeed[3], Kp, Ki, Kd, DIRECT);

float v2Filt = 0;
float v2Prev[4];


double vel1;
double vel2;
double ang1;
double ang2;

void wheelCommands( const std_msgs::Float64MultiArray& WheelCommand){
//  Serial.println("Recieved Data");  
 // Serial.println("Joint2: ");  
//  Serial.println(VelCommand.data[0]); 
    vel2=WheelCommand.data[1];
  vel1=WheelCommand.data[0];

  ang1 = WheelCommand.data[4];
  ang2 = WheelCommand.data[5];

//  Serial.println("Joint2: ");  // blink the led
//    Serial.println(VelCommand.data[1]);   // blink the led
//Serial.println("Joint3: ");  
//  Serial.println(VelCommand.data[2]);   // blink the led
//Serial.println("Joint4: ");  
//  Serial.println(VelCommand.data[3]);   // blink the led


}
ros::Subscriber<std_msgs::Float64MultiArray> sub("WheelCommands", wheelCommands );








//#################################### Drive motor Control ###################################

void driveMotorSetup(){
  encoderAPins[1] = 18;
  encoderBPins[1] = 23;
  pwmPins[1] = 8;
  //  dirPins[1] = ;

    encoderAPins[3] = 19;
    encoderBPins[3] = 22;
    pwmPins[3] = 10;
   ///  [0] = 24;

      encoderAPins[2] = 2;
    encoderBPins[2] = 27;
    pwmPins[2] = 7;
//    dirPins[2] = 25;

    encoderAPins[0] = 3;
    encoderBPins[0] = 26 ;
    pwmPins[0] = 9;
  //  dirPins[3] = ;

  for (int i = 0; i < 4; i++) {
    pinMode(encoderAPins[i], INPUT);
    pinMode(encoderAPins[i], INPUT);
    pinMode(pwmPins[i], OUTPUT);
    pinMode(dirPins[i], OUTPUT);
    pinMode(stepDirPins[i],OUTPUT);
    pinMode(stepPins[i],OUTPUT);
    
  }




  myPID1.SetMode(AUTOMATIC);
  myPID2.SetMode(AUTOMATIC);
  myPID3.SetMode(AUTOMATIC);
  myPID4.SetMode(AUTOMATIC);

  attachInterrupt(digitalPinToInterrupt(encoderAPins[0]),
                  encoderPin1, RISING);
  attachInterrupt(digitalPinToInterrupt(encoderAPins[1]),
                  encoderPin2, RISING);
  attachInterrupt(digitalPinToInterrupt(encoderAPins[2]),
                  encoderPin3, RISING);
  attachInterrupt(digitalPinToInterrupt(encoderAPins[3]),
                  encoderPin4, RISING);
  
}


//function in attach interupt do not allow for parameters
void encoderPin1() {
  readEncoder(0);
}
void encoderPin2() {
  readEncoder(1);
}
void encoderPin3() {
  readEncoder(2);
}
void encoderPin4() {
  readEncoder(3);
}


void readEncoder(int motorNum) {
  // Read encoder B when ENCA rises
  int b = digitalRead(encoderBPins[motorNum]);
  int increment = 0;
  if (b > 0) {
    // If B is high, increment forward
    increment = 1;
  }
  else {
    // Otherwise, increment backward
    increment = -1;
  }

  // Compute velocity with method 2
  long currT = micros();
  float deltaT = ((float) (currT - prevT_i[motorNum])) / 1.0e6;
  velocity_i[motorNum] = increment / deltaT;
  prevT_i[motorNum] = currT;
}



void driveMainMotors(){

  
}




//################################### End of Drive Motor Control ################################


// ##################################### Stepper Control #####################################


//Setup function for stepper motors

void stepperSetup(){
  for(int i=0; i<NUMSTEPPERS; i++){
    Steppers[i].setMaxSpeed(1000);
    Steppers[i].moveTo(0);
    Steppers[i].runSpeedToPosition();
  }
}


//finds the angle in the lookup table
int calcAng(int potVal){
  int i = 0;
  float ang = 0;
  if(potVal>992){
    return 270;
    
  }else if(potVal<6){
        Serial.println("Zero!");
    return 0;
  }
  
  while(lookUpTable[i][1]<potVal){
    i++;
  }
  if(lookUpTable[i-1][1]!= potVal){
    //interpolation formula: y = y1 + (x-x1)*((y2-y1)/(x2-x1))
    ang = lookUpTable[i-1][0] + (potVal - lookUpTable[i-1][1])*((lookUpTable[i][0]-lookUpTable[i-1][0])/(lookUpTable[i][1]-lookUpTable[i-1][1]));
    Serial.print("inter ang:  ");
    Serial.println(ang);
//    Serial.println(i);
    return (int)ang;
  }
  else{
    return lookUpTable[i-1][0];
  }
}

bool steppersFinished(){
  for(int i=0; i<4; i++){
  if(Steppers[i].isRunning() == true)
  {
        Serial.println("running ");
  return false;
  }
  }
          Serial.println("not ");

  return true;
  
  }
  
  
 




 
void driveSteppers(){


 
  
  //Calculate angles in degrees
    stepperAngles[0]=ang1*180/PI;
    stepperAngles[1]=ang2*180/PI;

//    stepperAngles[0]=ang1;
//    stepperAngles[1]=ang2;

    

    //Calculate Angles in steps
    stepperSteps[0]=stepperAngles[0]/1.8*2;  //NOTE THESE SHOULD BE /1.8*2 TO ACCOUNT FOR GEAR RATIO
    stepperSteps[1]=stepperAngles[1]/1.8*2;

//    Serial.print("front stepper Steps");
//    Serial.println(stepperSteps[0]);
//    
//    Serial.print("rear stepper Steps");
//    Serial.println(stepperSteps[1]);



//Drive Steppers
  for(int i=0; i<NUMSTEPPERS; i++){ 
    if(stepperAngles[i] != oldAngVals[i]){
      //initial move command
  Steppers[i].moveTo(stepperSteps[i]);
       Steppers[i].setSpeed(100);

       oldAngVals[i]=stepperAngles[i];

    }
//
//      Serial.print("Current angle:  ");
//  Serial.println(curAngle);
    Serial.print("Desireed angle:  ");
  Serial.println(stepperAngles[i]);
//  Steppers[i].runSpeedToPosition();
    //  Serial.print("potVal:  ");
//  Serial.println(potVal);
  }
//  while(steppersFinished()) //if you want to stop all the drive motors until the steppers are finished
//  {
//     
    for(int i=0; i<NUMSTEPPERS;i++){

      if(stepperAngles[i] <30){
        
        Steppers[i].moveTo(stepperSteps[i]);
        Steppers[i].setSpeed(500);
        Steppers[i].runSpeedToPosition();
      }else{
    
    error[i] = stepperAngles[i] - curAngles[i];
    if(abs(error[i])>BUFFER){
    if(Steppers[i].runSpeedToPosition() == false){
      //move the distance between current position and desired position
    Steppers[i].move(error[i]);
        Steppers[i].setSpeed(500);
    }

    }
      }    
    potVals[i] = analogRead(potPins[i]);
//    delay(100);
//      Serial.print("potVal:  ");
//  Serial.println(potVals[i]);
//  //get current angle from potentiometer value
    curAngles[i] = calcAng(potVals[i]);   //NOTE POTENTIOMETER VALUES ARE FROM 0 TO 260 LOOK UP TABLE SHOULD BE MODIFIED TO GO FROM -X TO +X I.E. -130 TO 130
//     Serial.print("Current angle f0r stepper ");
//     Serial.print(i);
//     Serial.print(":  ");
//  Serial.println(curAngles[i]);
//    
    
//  }

  //  //Serial.print("Current angle:  ");
//  //Serial.println(curAngle);
//    Serial.print("Desireed angle:  ");
//  Serial.println(newAngle);
//      Serial.print("potVal:  ");
//  Serial.println(potVal);
  
  }
  

    

}


// ################################ stepper Control Finished ###########################################




void setup() {
  // put your setup code here, to run once:

  Serial.begin(57600);
//  pinMode(13, OUTPUT);
//  pinMode(dirPin1, OUTPUT);
//  pinMode(motor1Pin, OUTPUT);
//    pinMode(dirPin2, OUTPUT);
//  pinMode(motor2Pin, OUTPUT);
  nh.initNode();
  //nh.advertise(chatter);
  nh.subscribe(sub);

driveMotorSetup();
stepperSetup();




}


void loop() {
  // put your main code here, to run repeatedly:
  driveSteppers();
Serial.println("func finished");
  float velocity2[4];
  noInterrupts();
  //loop that sets all velcoity2 elements to velocity_i elements
  for (int i = 0; i < 4; i++) {
    velocity2[i] = velocity_i[i];
  }
  interrupts(); // turn interrupts back on


  //function that runs low pass filter on all elements in velocity2 array
  float v2;
  for (int i = 0; i < 4; i++) {
//    motorSpeed[i] = 90 * (sin(micros() / 1e6) > 0); //NOTE FOR TESTING TO SET THE SAME SPEED

    v2 = velocity2[i] / 420.0 * 60.0;
    motorVelocity[i] = 0.854 * motorVelocity[i] + 0.0728 * v2 + 0.0728 * v2Prev[i];
    v2Prev[i] = v2;
  }

//   motorSpeed[0] = 90*(sin(micros()/1e6)>0); //NOTE FOR TESTING TO SET THE SAME SPEED
//    motorSpeed[1] = 45*(sin(micros()/1e6)>0); //NOTE FOR TESTING TO SET THE SAME SPEED
//   motorSpeed[2] = 90*(sin(micros()/1e6)>0); //NOTE FOR TESTING TO SET THE SAME SPEED
//    motorSpeed[3] = 45*(sin(micros()/1e6)>0); //NOTE FOR TESTING TO SET THE SAME SPEED

   motorSpeed[0] = vel1*(60/(2*PI)); //NOTE FOR TESTING TO SET THE SAME SPEED
    motorSpeed[1] = vel1*(60/(2*PI)); //NOTE FOR TESTING TO SET THE SAME SPEED
   motorSpeed[2] = vel2*(60/(2*PI)); //NOTE FOR TESTING TO SET THE SAME SPEED
    motorSpeed[3] = vel2*(60/(2*PI)); //NOTE FOR TESTING TO SET THE SAME SPEED


//  Serial.print("motorSpeed[0]: ");
// Serial.println(motorSpeed[0]);
//
//   Serial.print("motorCMD[0]: ");
// Serial.println(motorCMD[0]);
    

  myPID1.Compute();
  myPID2.Compute();
  myPID3.Compute();
  myPID4.Compute();




  for (int i = 0; i < 4; i++) {
    digitalWrite(dirPins[i], HIGH);
    analogWrite(pwmPins[i], motorCMD[i]);
  }
//  Serial.print(motorSpeed[1]);
//  Serial.print(" ");
//  Serial.print(motorVelocity[1]);
//  Serial.print(" ");
//  Serial.print(motorSpeed[0]);
////  Serial.print(" ");
////  Serial.print(motorVelocity[2]);
////  Serial.print(" ");
////  Serial.print(motorVelocity[3]);
//  Serial.print(" ");
//  Serial.print(motorVelocity[0]);
//  Serial.println();
  
  nh.spinOnce();
}
