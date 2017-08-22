/*
* Confetti Processing Example
* CS5 Extra Credit
* Harvey Mudd College
* Maddie Zug
* June 2017
*/
import processing.serial.*;

Serial serialPort;
String arduinoInputAsString;
int arduinoInputAsInt;
color c;

// This code is run once when your program starts
void setup(){
  size(600,600);
  // set the background color to black
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

// This code loops indefinitely
void draw(){
  // If I click the mouse, redraw black background to clear confetti
  if(mousePressed){
    background(0);
  }
  
  if(serialPort.available() > 0){
    arduinoInputAsString = serialPort.readStringUntil('\n').trim();
    arduinoInputAsInt = Integer.parseInt(arduinoInputAsString);
    
    //Generate a random color. Transparency depends on Arduino input
    color c = color(random(255), random(255), random(255), map(arduinoInputAsInt, 0, 255, 80, 255));
    //The outline of a shape
    stroke(c);
    //The inside of a shape
    fill(c);
    
    //Draw the shape
    polygon(map(arduinoInputAsInt, 0, 255, 0, width), random(height), map(arduinoInputAsInt, 5, 255, 0, 50), int(map(arduinoInputAsInt, 0, 255, 4,15))); 
  }
}

// Helper function to draw a polygon, found in the examples
// More examples available at File -> Examples
void polygon(float x, float y, float radius, int npoints) {
  float angle = TWO_PI / npoints;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius;
    float sy = y + sin(a) * radius;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}