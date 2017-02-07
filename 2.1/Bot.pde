class Bot {
  int x;
  int y;
  int px;
  int py;
  int r;
  int g;
  int b;

  Bot(int _x,int _y, int _r, int _g, int _b) {
    x = _x;
    y = _y;
    px = x;
    py = y;
    r=_r;
    g=_g;
    b=_b;
  }

  void display() {
    stroke(r,g,b);
    line(px, py, x, y);
    
    px = x;
    py = y;
  }

  void step() {
    

    int choice = int(random(4));

    if (choice == 0 && x<width) {
      x += 4;
    } else if (choice == 1 && x>0) {
      x -= 4;
    } else if (choice == 2 && y<width) {
      y += 4;
    } else if (choice == 3 && y>0) {
      y -= 4;
    }
  }
}