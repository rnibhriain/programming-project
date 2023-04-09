class Alien {
  PImage myimage;
  PImage explodingimage;
  float x;
  float y;
  float dx;
  float dy;
  int count;
  int alienStatus;

  Alien(int xpos, int ypos, PImage alienImage, PImage explosion) {
    myimage = alienImage;
    explodingimage = explosion;
    x = xpos;
    y = ypos;
    dx = 1;
    dy = 1;
    count = 0;
    alienStatus = 31;
  }

  void move() {
    if (x == SCREENX- 30|| x == 0) {
      if (count < 30) {
        y += dy;
        count++;
      } else {
        count = 0;
        dx = -dx;
        if (x > 50) {
          x = SCREENX- 31;
        } else {
          x = 1;
        }
      }
    } else {
      x += dx;
      dy = 1;
    }
  }

  void draw() {
    if (alienStatus < 30) {
      alienStatus++;
      image(explodingimage, x, y );
    } else if (alienStatus == 31) {
      image(myimage, x, y);
    }
  }

  void explode () {
    if (alienStatus != 30) {
      alienStatus = 0;
    }
  }
}
