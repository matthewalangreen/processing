// trying to copy: https://twitter.com/beesandbombs/status/1019924265540431872

// Globals
// *************************************************************************************************
int $gridWidth = 20;
boolean grid = false;
boolean debug = false;
boolean looping = false;
Segment s1;
Segment s2;
Segment s3;
int cols, rows;
ArrayList<Segment> segments = new ArrayList<Segment>();
// *************************************************************************************************


float getLength(float angle) { // in radians
  //https://www.desmos.com/calculator/mu1snong2u
  return 0.6714*angle*angle-1.0548*angle+sqrt(2);
}

void segment(float length) {
  float p = length/2;
  line(-p, -p, p, p);
}

void drawRotated(float angle, float length) {
  float l = length*($gridWidth/sqrt(2));
  pushMatrix();
  translate(height/2, width/2);
  rotate(angle);
  segment(l);
  popMatrix();
}

void example() {
  float angle = map(mouseX, 0, width, 0, PI/2);
  if(debug) { println("Angle: " + angle); }
  drawRotated(angle, getLength(angle));
}

// *************************************************************************************************
void setup() {
  size(600, 600);
  background(255);
  smooth(8);
  rectMode(CORNER);
  stroke(0);
  strokeWeight(2);
  noLoop();

  cols = width/$gridWidth;
  rows = height/$gridWidth;
  
  // fill up ArrayList first row
  //for (int i = 0; i<cols; i++) {
  //  segments.add(new Segment(0+$gridWidth*i, 0));  
  //}
  
  //for (int i = 0; i<cols; i++) {
  //  segments.add(new Segment(0+$gridWidth*i, 0+$gridWidth));
  //}
  
  for (int i = 0; i<cols; i++) {
   for (int j = 0; j<rows; j++){
    segments.add(new Segment(0+$gridWidth*j,0+$gridWidth*i)); 
   }
  }
  
}

void drawRandom() {
   //show first row of ArrayList
  for (int i = 0; i<cols*rows; i++) {
    float angle;
    //angle = map(mouseX, 0, width, 0, PI/2);
    float r = random(0,1);
    if(r < 0.5) {
     angle = PI/2; 
    } else {
      angle = 0;
    }
    segments.get(i).show(angle);  
  }
}

void draw() {
  background(255);
  if(grid) { drawGrid($gridWidth); } // toggle with 'g' key

  drawRandom();
  
  //Segment s = segments.get(0);
  //Segment s2 = segments.get(1);
  //s.show();
  //float angle = map(mouseX, 0, width, 0, PI/2);
  //s2.show(angle);

  
  
 // example();
}
