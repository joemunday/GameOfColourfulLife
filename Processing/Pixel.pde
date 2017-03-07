/*
09/05/14
Joe Munday Generative Creativity Programming Assignment
Colour Dependant Cellular Automata based on John Conway's Game of Life
Cell Class
*/

class Pixel {
  PVector location;
  float size;
  color col;
  boolean moved = false;
  int xCoord;
  int yCoord;
  int xPixels;
  int yPixels;
  int movedNeighbours = 0;
  int startRow, endRow, startColumn, endColumn;
  ArrayList<int[]> neighColours;
  boolean overShape = false;
  boolean moving = false;
  int red;
  int green;
  int blue;


  Pixel(float posx, float posy, float s, int xCo, int yCo, int xP, int yP) {
    //the cell is initialised with a location vector as well as integers to hold colour and coordinate data
    location = new PVector(posx, posy);
    neighColours = new ArrayList<int[]>();
    size = s;
    red = 0;
    green = 0;
    blue = 0;
    xCoord = xCo;
    yCoord = yCo;
    xPixels = xP;
    yPixels = yP;
    calculateBorders();
  }

  void calculateBorders() {
    //the position of the cell in relation to the borders of the CA is calculated
    //this is to ensure the algorithm doesn't go out of bounds when cycling through cells
    if (xCoord == 0) {
      startRow = 0;
    } 
    else {
      startRow = xCoord -1;
    }

    if (yCoord == 0) {
      startColumn = 0;
    } 
    else {
      startColumn = yCoord -1;
    }

    if (xCoord == xPixels-1) {
      endRow = xCoord;
    } 
    else {
      endRow = xCoord+1;
    }

    if (yCoord == yPixels-1) {
      endColumn = yCoord;
    } 
    else {
      endColumn = yCoord+1;
    }
  }

  void mouseUpdate() { 
    //mouse location is updated to check if it's over the cell
    //Adapted from code for my Final Year Project in JMGen Shape classes
    if (pmouseX > location.x-(size/2) && pmouseX < location.x+(size/2) && 
      pmouseY > location.y-(size/2) && pmouseY < location.y+(size/2)) {
      overShape = true;
    } 
    else {
      overShape = false;
    }
  }

  void update() {
    //the update method implements Conway's original rules for 'The Game of Life'(1970)
    if (moving) {
      if (movedNeighbours < 2) {
        moved = false;
      }
      if (movedNeighbours>=4) {
        moved = false;
      }
    }
    if (movedNeighbours==3) {
      moved = true;
    }
  }


  void display() {
    //the cell is drawn and the colour updated depending on whether it is active or not
    if (moved) {
      fill(col);
    }
    if (!moved) {
      fill(color(210));
    }
    ellipse(location.x, location.y, size, size);
  }

  int xCo() {
    return xCoord;
  }
  int yCo() {
    return yCoord;
  }

  void moved() {
    moved = true;
  }


  boolean isMoved() {
    return moved;
  }

  void setNeighbours(int n) {
    movedNeighbours = n;
  }

  int getMovedNeighbours() {
    return movedNeighbours;
  }

  int startRow() {
    return startRow;
  }
  int endRow() {
    return endRow;
  }
  int startColumn() {
    return startColumn;
  } 
  int endColumn() {
    return endColumn;
  }


  int[] getColour() {
    int[] colourArray = new int[3];
    colourArray[0] = red;
    colourArray[1] = green;
    colourArray[2] = blue;
    return colourArray;
  }
  void setColour(int r, int g, int b) {
    red = r;
    green = g;
    blue = b;
    col = color(red, green, blue);
  }

  int red() {
    return red;
  }
  int green() {
    return green;
  }
  int blue() {
    return blue;
  }
  boolean overShape() {
    return overShape;
  }

  void moving() {
    moving = true;
  }
}

