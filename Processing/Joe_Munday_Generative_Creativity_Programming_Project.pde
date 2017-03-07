/*
09/05/14
Joe Munday Generative Creativity Programming Assignment
Colour Dependant Cellular Automata based on John Conway's Game of Life
Main Class
*/

//this project requires the G4P library of GUI elements, created by Peter Lager, which is available from http://www.lagers.org.uk/g4p/
import g4p_controls.*;

int xPixels = 45;
int yPixels = 40;
int pixelSize =15;
Pixel[][] pixelArray2;
boolean moving = false;
GSlider red1;
GSlider red2;
GSlider green1;
GSlider green2;
GSlider blue1;
GSlider blue2;
float r1;
float r2;
float g1;
float g2;
float b1;
float b2;
boolean randomSelect = false;
DoubleButton doubleBut;


void setup() {
  size(1280, 720);
  colorMode(RGB);

  //Intialise the GUI elements
  doubleBut = new DoubleButton(800, 400, 200, 50);
  red1 = new GSlider (this, 800, 50, 200, 30, 15);
  red1.setValue(1);
  green1 = new GSlider (this, 800, 50, 200, 80, 15);
  green1.setValue(0);
  blue1 = new GSlider (this, 800, 50, 200, 130, 15);
  blue1.setValue(0);
  red2 = new GSlider (this, 800, 160, 200, 30, 15);
  red2.setValue(0);
  green2 = new GSlider (this, 800, 160, 200, 80, 15);
  green2.setValue(0);
  blue2 = new GSlider (this, 800, 160, 200, 130, 15);
  blue2.setValue(1);

  //Initialise the left and right click colour values
  r1 = 255;
  r2 = 0;
  g1 = 0;
  g2 = 0;
  b1 = 0;
  b2 = 255;

  //Initialise the grid in a two dimensional array
  pixelArray2 = new Pixel[xPixels][yPixels];
  for (int i = 0; i<xPixels;i++) {
    for (int j = 0; j<yPixels;j++) {
      pixelArray2[i][j] = new Pixel(10+(i*(pixelSize+1)), 10+(j*(pixelSize+1)), pixelSize, i, j, xPixels, yPixels);
    }
  }

  
  patternInit();
}

void patternInit(){
  //Intialise the sample pattern displayed when the application starts up. Consists of a glider gun in blue, with small elements in red and yellow.
  pixelArray2[1][8].moved();
  pixelArray2[1][8].setColour(0, 0, 255);
  pixelArray2[2][8].moved();
  pixelArray2[2][8].setColour(0, 0, 255);
  pixelArray2[1][9].moved();
  pixelArray2[1][9].setColour(0, 0, 255);
  pixelArray2[2][9].moved();
  pixelArray2[2][9].setColour(0, 0, 255);

  pixelArray2[21][6].moved();
  pixelArray2[21][6].setColour(0, 0, 255);
  pixelArray2[22][6].moved();
  pixelArray2[22][6].setColour(0, 0, 255);
  pixelArray2[21][7].moved();
  pixelArray2[21][7].setColour(0, 0, 255);
  pixelArray2[22][7].moved();
  pixelArray2[22][7].setColour(0, 0, 255);
  pixelArray2[21][8].moved();
  pixelArray2[21][8].setColour(0, 0, 255);
  pixelArray2[22][8].moved();
  pixelArray2[22][8].setColour(0, 0, 255);

  pixelArray2[14][6].moved();
  pixelArray2[14][6].setColour(0, 0, 255);
  pixelArray2[13][6].moved();
  pixelArray2[13][6].setColour(0, 0, 255);
  pixelArray2[12][7].moved();
  pixelArray2[12][7].setColour(0, 0, 255);
  pixelArray2[11][8].moved();
  pixelArray2[11][8].setColour(0, 0, 255);
  pixelArray2[11][9].moved();
  pixelArray2[11][9].setColour(0, 0, 255);
  pixelArray2[11][10].moved();
  pixelArray2[11][10].setColour(0, 0, 255);
  pixelArray2[12][11].moved();
  pixelArray2[12][11].setColour(0, 0, 255);
  pixelArray2[13][12].moved();
  pixelArray2[13][12].setColour(0, 0, 255);
  pixelArray2[14][12].moved();
  pixelArray2[14][12].setColour(0, 0, 255);

  pixelArray2[15][9].moved();
  pixelArray2[15][9].setColour(0, 0, 255);

  pixelArray2[16][7].moved();
  pixelArray2[16][7].setColour(0, 0, 255);
  pixelArray2[16][11].moved();
  pixelArray2[16][11].setColour(0, 0, 255);
  pixelArray2[17][10].moved();
  pixelArray2[17][10].setColour(0, 0, 255);
  pixelArray2[17][9].moved();
  pixelArray2[17][9].setColour(0, 0, 255);
  pixelArray2[17][8].moved();
  pixelArray2[17][8].setColour(0, 0, 255);
  pixelArray2[18][9].moved();
  pixelArray2[18][9].setColour(0, 0, 255);

  pixelArray2[23][5].moved();
  pixelArray2[23][5].setColour(0, 0, 255);
  pixelArray2[23][9].moved();
  pixelArray2[23][9].setColour(0, 0, 255);

  pixelArray2[25][5].moved();
  pixelArray2[25][5].setColour(0, 0, 255);
  pixelArray2[25][9].moved();
  pixelArray2[25][9].setColour(0, 0, 255);
  pixelArray2[25][4].moved();
  pixelArray2[25][4].setColour(0, 0, 255);
  pixelArray2[25][10].moved();
  pixelArray2[25][10].setColour(0, 0, 255);

  pixelArray2[35][6].moved();
  pixelArray2[35][6].setColour(0, 0, 255);
  pixelArray2[35][7].moved();
  pixelArray2[35][7].setColour(0, 0, 255);
  pixelArray2[36][6].moved();
  pixelArray2[36][6].setColour(0, 0, 255);
  pixelArray2[36][7].moved();
  pixelArray2[36][7].setColour(0, 0, 255);

  pixelArray2[32][22].moved();
  pixelArray2[32][22].setColour(255, 0, 0);
  pixelArray2[33][21].moved();
  pixelArray2[33][21].setColour(255, 0, 0);
  pixelArray2[33][22].moved();
  pixelArray2[33][22].setColour(255, 0, 0);
  pixelArray2[33][23].moved();
  pixelArray2[33][23].setColour(255, 0, 0);
  pixelArray2[34][20].moved();
  pixelArray2[34][20].setColour(255, 0, 0);
  pixelArray2[34][24].moved();
  pixelArray2[34][24].setColour(255, 0, 0);
  pixelArray2[34][21].moved();
  pixelArray2[34][21].setColour(255, 0, 0);
  pixelArray2[34][22].moved();
  pixelArray2[34][22].setColour(255, 0, 0);
  pixelArray2[34][23].moved();
  pixelArray2[34][23].setColour(255, 0, 0);
  pixelArray2[35][21].moved();
  pixelArray2[35][21].setColour(255, 0, 0);
  pixelArray2[35][22].moved();
  pixelArray2[35][22].setColour(255, 0, 0);
  pixelArray2[36][22].moved();
  pixelArray2[36][22].setColour(255, 0, 0);
  pixelArray2[35][23].moved();
  pixelArray2[35][23].setColour(255, 0, 0);

  pixelArray2[19][23].moved();
  pixelArray2[19][23].setColour(255, 255, 0);
  pixelArray2[20][22].moved();
  pixelArray2[20][22].setColour(255, 255, 0);
  pixelArray2[20][23].moved();
  pixelArray2[20][23].setColour(255, 255, 0);
  pixelArray2[20][24].moved();
  pixelArray2[20][24].setColour(255, 255, 0);
  pixelArray2[21][21].moved();
  pixelArray2[21][21].setColour(255, 255, 0);
  pixelArray2[21][25].moved();
  pixelArray2[21][25].setColour(255, 255, 0);
  pixelArray2[21][22].moved();
  pixelArray2[21][22].setColour(255, 255, 0);
  pixelArray2[21][23].moved();
  pixelArray2[21][23].setColour(255, 255, 0);
  pixelArray2[21][24].moved();
  pixelArray2[21][24].setColour(255, 255, 0);
  pixelArray2[22][22].moved();
  pixelArray2[22][22].setColour(255, 255, 0);
  pixelArray2[22][23].moved();
  pixelArray2[22][23].setColour(255, 255, 0);
  pixelArray2[23][23].moved();
  pixelArray2[23][23].setColour(255, 255, 0);
  pixelArray2[22][24].moved();
  pixelArray2[22][24].setColour(255, 255, 0);
}

void draw() {
  //draw the background, and the text to explain the GUI.
  background(80);
  fill(255);
  textAlign(LEFT, BOTTOM);
  textSize(32);
  text("Left Click", 800, 40);
  text("Right Click", 800, 160);
  textSize(18);
  text("Drag the mouse accross the grid to create patterns", 800, 500);
  text("To start and stop press space bar", 800, 550);
  text("To move ahead one frame press right", 800, 600);
  text("To clear the screen press enter", 800, 650);
  
  
  //if statements to check which side the button is toggled on 
  if (doubleBut.leftSelected()) {
    randomSelect = false;
  }
  if (!doubleBut.leftSelected()) {
    randomSelect = true;
  }
  //the button's draw method is called, and the boolean controlling whether the mouse is over it is updated.
  doubleBut.display();
  doubleBut.update();
  
  strokeWeight(0);
  if (!moving) {
    //The frame rate is increased to 25 when the CA is not in motion to ensure that drawing the patterns is smooth.
    frameRate(25);
  }
  //Squares to preview the colours for the left and right click are drawn
  fill(color(r1, g1, b1));
  rect(1025, 55, 60, 60);
  fill(color(r2, g2, b2));
  rect(1025, 165, 60, 60);


  if (moving) {
    //the frame rate is dropped when the CA is in motion to ensure that the movements and colour transitions are not too fast
    frameRate(5);
    //The colour of each cell is updated to take into account the cells around it
    updateColours();
  }
  //the number of neighbours that are live for each cell are calculated
  updateNeighbours();

  //each pixel is cycled through, drawn and updated (if the CA is in motion)
  for (int i = 0; i<xPixels;i++) {
    for (int j = 0; j<yPixels;j++) {

      if (moving) {
        pixelArray2[i][j].moving();
        pixelArray2[i][j].update();
      }
      pixelArray2[i][j].mouseUpdate();
      pixelArray2[i][j].display();
    }
  }
}

void updateNeighbours() {
  //update neighbours method cycles through the cells surrounding a particylar cell and counts how many are live.
  for (int i = 0; i<xPixels;i++) {
    for (int j = 0; j<yPixels;j++) {
      int neighbourCount = 0;
      for (int w = pixelArray2[i][j].startRow();w<=pixelArray2[i][j].endRow();w++) {
        for (int r = pixelArray2[i][j].startColumn(); r<=pixelArray2[i][j].endColumn();r++) {
          if (!pixelArray2[w][r].equals(pixelArray2[i][j])) {
            if (pixelArray2[w][r].isMoved()) {
              neighbourCount++;
            }
          }
        }
      }
      pixelArray2[i][j].setNeighbours(neighbourCount);
    }
  }
}


void updateColours() {
  //The colours are updated for each cell in the grid that is live
  for (int i = 0; i<xPixels;i++) {
    for (int j = 0; j<yPixels;j++) {
      ArrayList<int[]> neighColours = new ArrayList<int[]>();
      neighColours.clear();
      for (int w = pixelArray2[i][j].startRow();w<=pixelArray2[i][j].endRow();w++) {
        for (int r = pixelArray2[i][j].startColumn(); r<=pixelArray2[i][j].endColumn();r++) {
          if (!pixelArray2[w][r].equals(pixelArray2[i][j])) {
            if (pixelArray2[w][r].isMoved()) {
              neighColours.add(pixelArray2[w][r].getColour());
            }
          }
        }
      }
      //the colour is determind as an average of the RGB values of the surrounding cells that are live
      int avR = 0;
      int avG = 0;
      int avB = 0;
      for (int[] e: neighColours) {
        avR += e[0];
        avG += e[1];
        avB += e[2];
      }
      if (neighColours.size() !=0) {
        //if the random selection algorithm is enabled, a random colour is selected from the colours of the surrounding cells
        if (randomSelect) {
          int index = (int)random(neighColours.size());
          pixelArray2[i][j].setColour(neighColours.get(index)[0], neighColours.get(index)[1], neighColours.get(index)[2]);
        }
        if (!randomSelect) {
          pixelArray2[i][j].setColour((avR/neighColours.size()), (avG/neighColours.size()), (avB/neighColours.size()));
        }
      }
    }
  }
}

void mouseClicked() {
  //when the mouse is clicked, this code cycles through the cells to check if have been clicked on, and sets them the appropriate colour
  for (int i = 0; i<xPixels;i++) {
    for (int j = 0; j<yPixels;j++) {
      if (pixelArray2[i][j].overShape) {
        if (mouseButton==37) {
          pixelArray2[i][j].setColour((int)r1, (int)g1, (int)b1);
        }
        if (mouseButton==39) {
          pixelArray2[i][j].setColour((int)r2, (int)g2, (int)b2);
        }
        pixelArray2[i][j].moved();
      }
    }
  }
  //the button is checked to see if it has been clicked
  if (doubleBut.overButton()) {
    doubleBut.flip();
  }
}

void reset() {
  //this method initialises the grid to a blank set of cells
  pixelArray2 = new Pixel[xPixels][yPixels];
  for (int i = 0; i<xPixels;i++) {
    for (int j = 0; j<yPixels;j++) {
      pixelArray2[i][j] = new Pixel(10+(i*(pixelSize+1)), 10+(j*(pixelSize+1)), pixelSize, i, j, xPixels, yPixels);
    }
  }
}

void mouseDragged() {
  //this method changes the colour of any cells that the mouse has passed over while pressed
  for (int i = 0; i<xPixels;i++) {
    for (int j = 0; j<yPixels;j++) {
      if (pixelArray2[i][j].overShape) {
        if (mouseButton==37) {
          pixelArray2[i][j].setColour((int)r1, (int)g1, (int)b1);
        }
        if (mouseButton==39) {
          pixelArray2[i][j].setColour((int)r2, (int)g2, (int)b2);
        }
        pixelArray2[i][j].moved();
      }
    }
  }
}


void keyPressed() {
  //controls for the UI are triggered when certain keys are pressed.
  //return key initialises the grid
  if (keyCode==10) {
    reset();
  }
  //right arrow key moves the pattern on one frame
  if (keyCode==39) {
    moving = true;
    draw();
    moving = false;
  }
  //space bar toggles whether the CA is in motion or not
  if (keyCode ==32) {
    boolean state = moving;
    if (state) {
      moving = false;
    }
    if (!state) {
      moving = true;
    }
  }
}


public void handleSliderEvents(GValueControl slider, GEvent event) { 
  //this method handles and updates the colour vales taken from the sliders
  r1 = map(red1.getValueF(), 0.0, 1.0, 0.0, 255.0);
  r2 = map(red2.getValueF(), 0.0, 1.0, 0.0, 255.0);
  g1 = map(green1.getValueF(), 0.0, 1.0, 0.0, 255.0);
  g2 = map(green2.getValueF(), 0.0, 1.0, 0.0, 255.0);
  b1 = map(blue1.getValueF(), 0.0, 1.0, 0.0, 255.0);
  b2 = map(blue2.getValueF(), 0.0, 1.0, 0.0, 255.0);
}

