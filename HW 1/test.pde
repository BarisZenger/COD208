class Bot {
  float x;
  float y;
  float px;
  float py;

  Bot() {
    x = width/2;
    y = height/2;
    px = x;
    py = y;
  }

  void display() {
    stroke(0);
    arc(px, py, x, y, PI, TWO_PI);
    px = x;
    py = y;
    if (x>width) {
      x=random(0,width);
      y=random(0,height);
    }
    if (x<0) {
      x=random(0,width);
      y=random(0,height);
    }
    if (y>height) {
      x=random(0,width);
      y=random(0,height);
    }
    if (y<0) {
      x=random(0,width);
      y=random(0,height);
    }
  }

  void step() {
    int choice = int(random(4));

    if (choice == 0) {
      x += 8;
    } else if (choice == 1) {
      x -= 8;
    } else if (choice == 2) {
      y += 8;
    } else {
      y -= 8;
    }
  }
}