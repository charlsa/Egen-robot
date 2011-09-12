/* Eventuell kod för kommunikation med GIS-modul. 
Atmegan ska agera master på I2C, så den kan skicka kommandon
till huvudprogrammet samt servo/brygga då i slave mode.  */

#include <Wire.h>

void setup()
{
//Ställ in I2C samt bluetooth
//BT på seriell-pinnarna

Wire.begin(/*adress för atmegan*/);
Wire.onReceive(receiveEvent);
Serial.begin(9600);	
}
void loop()
{
	//lyssna på bluetooth. Om något skickas, skicka vidare till huvudprog.
}
void send(string data)
{
	//skicka de erhållna värdena från huvudprogrammet i recieve event-
}
void GetSensorData()
{
	//Be sensorer (och atmega med sensorer) om data, om tillsagd
	//Detta bör bara användas i zombie-mode	
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