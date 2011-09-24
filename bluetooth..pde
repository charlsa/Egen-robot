/*Terminalkommandon
För att hitta sökväg till ansluten BT: root$ ls /dev/tty.*
För att ansluta till den: screen [sökväg] [baudrate]

screen /dev/tty.linvor-DevB 9600
*/

//

#include <Wire.h>
#include <Servo.h>

unsigned int lastReceived = 0;
unsigned int lastSent = 0;

char inByte[7] = {"DZ#SZ#"}; //Z = 90°
char utByte[] = {"N0#A0#L0#"};
char fel[] = {"E0#T00#"};

Servo servo;
Servo motor;

void setup()
{
	Serial.begin(9600);
	
	unsigned int adress = 2; //adress på I2C-bussen
	unsigned int servoPin = 2;
	unsigned int motorPin = 3;
	
	pinMode(servoPin, OUTPUT); //för servot
	pinMode(motorPin, OUTPUT); //för fartreglage
	
	servo.attach(servoPin); 
	motor.attach(motorPin);
	
}
void loop()
{
	unsigned int i=0;
	while(1 <= Serial.available()) // loopar igenom hela input, även enterslaget
		  {
			if(i==0);
		    inByte[i] = Serial.read(); // receive byte as a character
		    Serial.println(inByte);         // print the character
			i++;
			if(inByte[3]!='S' && inByte[0]!='D')
				Serial.println("fel!");
		  }
     if(inByte[3]=='S' && inByte[0]=='D')
     		run(inByte[1],inByte[4]);
                
}
void run(int degree, int speed)
{
	//För att undvika att servot kör för långt
	if (degree > 140)
		degree = 140;
	if (degree < 60)
		degree = 60;	
	servo.write(degree);

	//För att undvika kaos
	unsigned int topspeed = 180; //Då jag inte vet maxhastighet
	if (speed > topspeed)
		speed = topspeed;
	motor.write(speed);
	}