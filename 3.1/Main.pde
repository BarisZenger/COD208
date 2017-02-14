float angle = 45;
float angle2 = 60;

float aniFacAng;
float opacityFac;

float range = 5;

import controlP5.*;
ControlP5 cp5;

void setup() {
  size(400, 400);
  cp5 = new ControlP5(this);
  cp5.addSlider("angle").setPosition(20,20).setRange(0,180);
  cp5.addSlider("range").setPosition(260,20).setRange(5,50);
}

void draw() {
  background(#27AE60);
  
  pushMatrix();
  translate(width*0.5, height);
  branch(100 + aniFacAng);
  popMatrix();
  
  aniFacAng = sin(millis()* 0.001) * range;
}

void branch(float len) {
  stroke(255, 255, 255);
  line(0, 0, 0, -len);
  translate(0, -len);
  
  if (len>2) {
    pushMatrix();
    rotate(radians(angle + aniFacAng));
    branch(len*0.67);
    popMatrix();
    
    pushMatrix();
    rotate(radians(-angle + aniFacAng));
    branch(len*0.67);
    popMatrix();
    if(len<10){
    noStroke();
    opacityFac = map(aniFacAng,-5,5,0,255);
    fill(0,0,0,opacityFac);
    ellipse(0,0,3+aniFacAng,3+aniFacAng);
    }
  }
}