class PowerUps {

  float xPosition;
  float yPosition;
  float type;
  float currentSpeed;
  float radius;

  PowerUps () {
    xPosition = -50;
    type = 1;
    yPosition = -30;
    currentSpeed = 4;
    radius = 5;
  }

  PowerUps (Alien theAlien, Player thePlayer) {
    xPosition = theAlien.x+10;
    yPosition = theAlien.y;
    if (collide(thePlayer)) {
      type = random (0, 2);
    }
  }

  void move () {
    yPosition += currentSpeed;
  }

  void draw () {
    if (type == 0) {
      fill(0, 0, 255);
    } else if (type == 1) {
      fill(0, 255, 0);
    } else if (type ==2) {
      fill(255, 0, 0);
    } else {
      fill(0);
    }
    ellipse((int) xPosition, (int) yPosition, radius, radius);
  }
  
  boolean collide (Player tp) {
    if (y+radius >= tp.ypos &&
      y-radius<tp.ypos+PADDLEHEIGHT &&
      x >=tp.xpos &&
      x <= tp.xpos+PADDLEWIDTH) {
      return true;
    }
    return false;
  }
}
