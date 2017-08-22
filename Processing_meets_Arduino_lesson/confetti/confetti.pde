/*
* Confetti Processing Example
* CS5 Extra Credit
* Harvey Mudd College
* Maddie Zug
* June 2017
*/

// This code is run once when your program starts
void setup(){
  size(600,600);
  background(0); 
}

// This code loops indefinitely
void draw(){
  //When mouse is pressed, clear screen of all confetti
  if(mousePressed){
   background(0); 
  }
  
  //Generate a random color. Transparency depends on mouse position within window.
  color c = color(random(255), random(255), random(255), map(mouseX, 0, width, 80, 255));
  stroke(c);
  fill(c);
  polygon(mouseX, random(height), map(mouseX, 0, width, 5, 35), int(map(mouseY, 0, height, 4, 15)));            
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