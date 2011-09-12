/*Eventuell kod till atmega för att sytra hbrygga samt servo, atmegan
agerar slave på I2C och lyssnar på anrop*/

#include <Servo.h>
#include <Wire.h> //is needed for I2C

Servo servo;
Servo motor;

void setup()
{
	unsigned int adress = 2;
	
	unsigned int servoPin = 2;
	unsigned int motorPin = 3;
	
	pinMode(servoPin, OUTPUT); //för servot
	pinMode(motorPin, OUTPUT); //för fartreglage
	
	servo.attach(servoPin); 
	motor.attach(motorPin)
	
	// analogpin 4 och 5 går åt till I2C
	
	Wire.begin(adress/*adress för atmegan*/);
	Wire.onReceive(receiveEvent);
	//Serial.begin(9600);
}
void loop()
{
 //Gör inget
	delay(1);
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
	unsigned int topspeed = 20; //Då jag inte vet maxhastighet
	if (speed > topspeed)
		speed = topspeed;
	
	motor.write(speed);
}
void receiveEvent(int howMany/*längd på paket*/)
{
  	char data[];
	unsigned int i=0;
  	while(1 < Wire.available()) // loop through all but the last
	{
		char data[i] = Wire.receive(); // receive byte as a character
		i++;
	}
	
	//Tolka om datan i hastighet och vinkel, ev räkna om i procent
}