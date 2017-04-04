#include <RCSwitch.h>
RCSwitch SWCH = RCSwitch();

int XPOSITION = 0 ;
int YPOSITION = 0 ;
int POSITION = 0;
int VAL1 = 0;
int VAL2 = 0;

void setup() {
  Serial.begin(9600);
  pinMode(4, OUTPUT); //Motor Controller In 1 Pin Assigned to MCU pin 4
  pinMode(5, OUTPUT); //Motor Controller In 2 Pin Assigned to MCU pin 5
  //pinMode(8, OUTPUT); //Motor Controller In 3 Pin Assigned to MCU pin 8
  //pinMode(9, OUTPUT); //Motor Controller In 4 Pin Assigned to MCU pin 9
}

void loop() {

  VAL1 = analogRead(0);
  VAL2 = analogRead(1);

  if (VAL1 > YPOSITION + 1000) {
    POSITION = 1;  //Forward
    digitalWrite(4, HIGH);
    Serial.println(POSITION);
  }
  if (VAL1 < YPOSITION + 400) {
    POSITION = 2;  //Backward
    digitalWrite(5, HIGH);
    Serial.println(POSITION);
  }
  if (VAL1 > YPOSITION + 390 && VAL1 < YPOSITION + 990)
  {
    POSITION = 5;
    digitalWrite(4, LOW);
    digitalWrite(5, LOW);
    //digitalWrite(8, LOW);
    //digitalWrite(9, LOW);
    Serial.println(POSITION);
  }
}
