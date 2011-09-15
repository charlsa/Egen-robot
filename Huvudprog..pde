/* Eventuell kod för kommunikation med GIS-modul. 
Atmegan ska agera master på I2C, så den kan skicka kommandon
till huvudprogrammet samt servo/brygga då i slave mode.  */

#include <Wire.h>

constant unsigned int incomingByte = 0;

void setup()
{
//Ställ in I2C samt bluetooth
unsigned int rxPin = ;
unsigned int txPin = ;

Wire.begin(/*adress för atmegan*/);

Serial.begin(9600);	
}
void loop()
{
	//Om något skickat över BT
	if (Serial.available() > 0) 
	{
			char data[] = Serial.read();
	}
	Serial.println("Inläst data: ")
	Serial.println(data);
	Serial.println(" ");
	run(data);
}
void run(char data)
{
	//skickar till arduino som sköter drivningen
	Wire.beginTransmission(4);
	Wire.send(data);
	Wire.endTransmission();
}
void GetSensorData()
{
	//Be sensorer (och atmega med sensorer) om data.
}