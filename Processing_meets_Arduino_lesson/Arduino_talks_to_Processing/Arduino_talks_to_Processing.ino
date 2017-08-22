/*
 * Arduino sends data to Processing Example
 * CS5 Extra Credit
 * Harvey Mudd College
 * Maddie Zug
 * June 2017
 */

void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
}

void loop() {
  // Read the sensor input
  int sensorValue = analogRead(A0);
  
  /* 
   * The input range here will need to be modified depending on the sensor you use.
   * Here's what worked for me, but you might get different ranges:
   * Pot: 0-1023
   * Light-dependent resistor: 0-100 
   * Force-sensitive resistor: 0-300
   * The output range should always be 255 since we are writing to a PWM pin
   */
  float convertedSensorValue = convert(sensorValue, 0, 300, 0, 255);

  //Send the converted value to Processing
  Serial.println(int(convertedSensorValue));
  delay(100);
}

// Converts x from the "in" range to the "out" range
float convert(float x, float in_min, float in_max, float out_min, float out_max)
{
  return (x - in_min) * (out_max - out_min) / (in_max - in_min) + out_min;
}


