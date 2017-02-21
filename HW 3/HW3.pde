Tree user;
Tree user2;
Tree user3;
Tree user4;

float angle = 45;
float range = 5;

import controlP5.*;
ControlP5 cp5;

void setup() {
  size(400, 400);
  cp5 = new ControlP5(this);
  user = new Tree();
  user2 = new Tree();
  user3 = new Tree();
  user4 = new Tree();

  cp5.addSlider("angle").setPosition(20, 20).setRange(0, 180);
  cp5.addSlider("range").setPosition(260, 20).setRange(5, 50);
}

void draw() {
  background(#27AE60);
  user.display(range, angle, 60, 0);
  user2.display(range, angle, -60, 0);
  user3.display(range, angle, 0, 60);
  user4.display(range, angle, 0, -60);
}