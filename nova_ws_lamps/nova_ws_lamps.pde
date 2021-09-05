import oscP5.*;
import netP5.*;

OscP5 oscP5;
NetAddress myRemoteLocation;

boolean animation1Flag = true;

void setup() {
  size(800, 500);
  background(255);
  frameRate(25);
  oscP5 = new OscP5(this, 7110);
  
  myRemoteLocation = new NetAddress("192.168.1.103", 7110);
}


// ----- MAIN METHOD ------
/*
* create a program that reacts to keyboard typing.

* you can use the following helper functions 
*   random(0, 100); --> generates a random value between 0 and 99.
*   delay(1000); --> halt program for a specified amount of time.
*   sendOsc(lampNumber, isOn); --> sends signal to lamp number specified int he first parameter. Turns the lamp on or off based on the second parameter.
*/
void draw() {
  background(255); // accepted values 0 -> 255.
  if (keyPressed) {
    if (key == 'a') {
      sendOsc(1, true);
    } else {
      sendOsc(1, false);
    }
  }
}
// -----------------------



void sendOsc(int point, boolean on) {
  OscMessage myMessage = new OscMessage("/pi3/band");
  int command = point * 10;
  if (on) {
    command += 1;
  }
  myMessage.add(command); /* add an int to the osc message */
  oscP5.send(myMessage, myRemoteLocation); 
}