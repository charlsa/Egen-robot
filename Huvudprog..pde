/* Eventuell kod för kommunikation med GIS-modul. 
Atmegan ska agera master på I2C, så den kan skicka kommandon
till huvudprogrammet samt servo/brygga då i slave mode.  */

#include <Wire.h>

unsigned int incomingByte = 0;

void setup()
{
//Ställ in I2C samt bluetooth
unsigned int rxPin = ;
unsigned int txPin = ;

Wire.begin(/*adress för atmegan*/);
Wire.onReceive(receiveEvent);
Serial.begin(9600);	
}
void loop()
{
	//Om något skickat över BT
	if (Serial.available() > 0) {
			incomingByte = Serial.read();	
}
void send(string data)
{
	
}
void GetSensorData()
{
	//Be sensorer (och atmega med sensorer) om data, om tillsagd
}
void receiveEvent(int howMany/*???*/)
{
	//Om atmegan får data skickad till sig, skickar den vidare via BT
	char data[];
	unsigned int i=0;
  	while(1 < Wire.available()) // loop through all but the last
	{
		char data[i] = Wire.receive(); // receive byte as a character
		i++;
	}
	send(data);
}