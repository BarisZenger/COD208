Bot user;
Bot user2;
Bot user3;
Bot user4;

void setup() {
  size(400, 400);
  background(255);
  user = new Bot(0, 400, 255, 0, 0);
  user2 = new Bot(400, 400, 0, 255, 0);
  user3 = new Bot(400, 0, 0, 0, 255);
  user4 = new Bot(0, 0, 255, 155, 0);
}

void draw() {
  user.display();
  user.step();
  user2.display();
  user2.step();
  user3.display();
  user3.step();
  user4.display();
  user4.step();
}

void keyPressed() {
  if (key == 's') {
    saveFrame();
  }
}