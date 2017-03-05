float mag = 200;
float k = 5;
float theta;
float aniFacAng;
float r;
float x;
float y;
float n;
float d;
float c;

import controlP5.*;
ControlP5 cp5;

void setup() {
  size(800, 800);
  cp5 = new ControlP5(this);
  cp5.addSlider("mag").setPosition(20, 20).setRange(0, 400);
}

void draw() {
  background(0);
  
  aniFacAng = sin(millis()* 0.001) * 150;
  c = aniFacAng;
  if(c>10){
  n = int (random(40, 50));
  d = int (random(1, 10));
  }
  if(c<10){
  n = int (random(1, 10));
  d = int (random(40, 50));
  }
  k = n / d;
  
  pushMatrix();
  translate(width*0.5, height*0.5);
  noFill();
  beginShape();
  for (int i=0; i < 360 * d; i = i+1) {
    theta = map(i, 0, 360, 0, TWO_PI);
    r = mag * cos(k*theta) + c;
    x = cos(theta) * r;
    y = sin(theta) * r;
    stroke(255);
    vertex(x, y);
  }
  endShape(CLOSE);
  popMatrix();
}