/*Eventuell kod till atmega för att sytra hbrygga samt servo, atmegan
agerar slave på I2C och lyssnar på anrop*/

#include <Servo.h>
#include <Wire.h> //is needed for I2C

Servo servo;
Servo motor;

void setup()
{
	pinMode(2, OUTPUT); //för servot
	pinMode(3, OUTPUT); //för fartreglage
	servo.attach(2); 
	motor.attach(3)
	
	// analogpin 4 och 5 går åt till I2C
	
	Wire.begin(2/*adress för atmegan*/);
	
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
	if (speed > 500000000)
		speed = 500000000;
	
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
	
	//Tolka om datan i hastighet och vinkel
}