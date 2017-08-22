/*
* Processing receives Arduino data Example
* CS5 Extra Credit
* Harvey Mudd College
* Maddie Zug
* June 2017
*/

//The serial library that lets us talk to Arduino through a serial port
import processing.serial.*;

//Set up variables
Serial serialPort;
String arduinoInputAsString;
int arduinoInputAsInt;
color c;

void setup(){
  // Create square, black window
  size(200,200);
  background(0);
  
  // Initialize our color to black
  c = color(0, 0, 0);
  
  /*
  * IMPORTANT! this line will print a list of the serial ports on your computer.
  * You want to find the location in the list of the port that matches your Arduino port.
  * My Arduino usb port came up as the second item printed, so I chose Serial.list()[1] as my portName.
  * Indexing for the list starts at 0.
  */
  for(String port: Serial.list()){
     println(port);
  }
  String portName = Serial.list()[1];
  
  //Create a new serial port with the correct port name and Baud rate of 9600 (matches the Arduino code)
  serialPort = new Serial(this, portName, 9600);
}

void draw(){
  // Only read values from the serial port if it is ready, to avoid errors
  if(serialPort.available() > 0){
    
    //Read input until newline character
    arduinoInputAsString = serialPort.readStringUntil('\n');
    //Only use input if it is valid
    if(arduinoInputAsString != null){
      arduinoInputAsString = arduinoInputAsString.trim();
      //Make sure the number is formatted correctly
      try{
        arduinoInputAsInt = Integer.parseInt(arduinoInputAsString);
        // Uncomment this line to check that we're getting reasonable values in the console
        //println(mappedValue);
    
        // Create a color using our analog input from the Arduino
        c = color(arduinoInputAsInt, arduinoInputAsInt, arduinoInputAsInt);
      } catch(NumberFormatException e){
        //Move on
        println("Number format exception");
      }
    }  
 }
   // Draw a circle with that color.
   stroke(c);
   fill(c);
   ellipse(100,100,50,50);
  
}