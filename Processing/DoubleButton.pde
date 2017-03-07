/*
09/05/14
Joe Munday Generative Creativity Programming Assignment
Colour Dependant Cellular Automata based on John Conway's Game of Life
Button Class
*/

class DoubleButton {
  PVector location;
  int wid;
  int hei;
  String button1;
  String button2;
  boolean leftSelected = true;
  boolean overButton = false;

  DoubleButton(int x, int y, int w, int h) {
    //button is initialised with location, width and height
    location = new PVector(x, y);
    wid = w;
    hei = h;
  }

  void update() {
    //mouse location is updated to check if it's over the button
    //Adapted from code for my Final Year Project in JMGen Shape classes
    if (pmouseX > location.x && pmouseX < location.x+wid && 
      pmouseY > location.y && pmouseY < location.y+hei) {
      overButton = true;
    } 
    else {
      overButton = false;
    }
  }

  boolean overButton() {
    return overButton;
  }

  boolean leftSelected() {
    return leftSelected;
  }

  void flip() {
    //flips the side of the button currently selected
    boolean state = leftSelected;
    if (state) {
      leftSelected = false;
    }
    if (!state) {
      leftSelected = true;
    }
  }

  void display() {
    //draws the buttons with the text centred on each side
    stroke(0);
    textSize(25);
    textAlign(LEFT, TOP);
    if (leftSelected) {
      fill(200);
      rect(location.x, location.y, wid/2, hei);
      fill(150);
      rect(location.x+(wid/2), location.y, wid/2, hei);
      fill(255);
      text("Blend", location.x+(((wid/2)-textWidth("Blend"))/2), location.y+((hei-(textAscent()+textDescent()))/2));
      fill(0);
      text("Random", location.x+(wid/2)+(((wid/2)-textWidth("Random"))/2), location.y+((hei-(textAscent()+textDescent()))/2));
    }
    if (!leftSelected) {
      fill(150);
      rect(location.x, location.y, wid/2, hei);
      fill(200);
      rect(location.x+(wid/2), location.y, wid/2, hei);
      fill(0);
      text("Blend", location.x+(((wid/2)-textWidth("Blend"))/2), location.y+((hei-(textAscent()+textDescent()))/2));
      fill(255);
      text("Random", location.x+(wid/2)+(((wid/2)-textWidth("Random"))/2), location.y+((hei-(textAscent()+textDescent()))/2));
    }
  }
}

