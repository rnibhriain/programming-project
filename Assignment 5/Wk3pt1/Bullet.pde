float x;
float y;
float speed;
float bulletWidth;
float bulletLength;
color ballColor = color(200, 100, 50);

class Bullet {

  Bullet (Player thePlayer) {
    x = thePlayer.xpos + 25;
    y = thePlayer.ypos;
    speed = 4;
  }
  
  Bullet () {
    x = -50;
    y = -50;
    speed = 0;
  }
  void move () {
    y-=speed;
  }

  void draw() {
    fill(ballColor);
    rect(int(x), int(y), 5, 10);
  }

  void collide (Alien aliens []) {
    for (int count = 0; count < aliens.length; count++) {
      if (y >= aliens[count].y &&
        y<aliens[count].y+25 &&
        x >=aliens[count].x &&
        x <= aliens[count].x + aliens[count].myimage.width) {
        aliens[count].explode();
      }
    }
  }
  
  void doubleSpeed () {
    speed *= 2;
  }
  
  void maximize () {
    bulletWidth *= 2;
    bulletLength *= 2;
  }
}
