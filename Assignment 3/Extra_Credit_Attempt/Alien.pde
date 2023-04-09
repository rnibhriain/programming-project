final int A_FORWARD = 0;
final int A_BACKWARD = 1;
final int A_DOWN = 2;

class Alien {
  PImage myimage;
  PImage explodingimage;
  float x;
  float y;
  float dx;
  float dy;
  float y1;
  float speed;
  int count;
  int alienStatus;

  Alien(int xpos, int ypos, PImage alienImage, PImage explosion) {
    myimage = alienImage;
    explodingimage = explosion;
    x = xpos;
    y1 = ypos;
    dx = 1;
    dy = 1;
    speed = 1;
    count = 0;
    alienStatus = 31;
  }

  void move() {
    y = (50*sin(2*(3.14)*x/50)+y1)*speed;
    if (x == SCREENX- 30|| x == 0) {
      if (count < 30) {
        y += dy;
        count++;
      } else {
        count = 0;
        dx = -dx;
        speed ++;
        if (x > 50) {
          x = SCREENX- 31;
        } else {
          x = 1;
        }
      }
    } else {
      x += dx*speed;
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
    alienStatus = 0;
  }
}
