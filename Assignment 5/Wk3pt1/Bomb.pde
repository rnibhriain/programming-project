class Bomb {

  float xBomb;
  float yBomb;

  Bomb (int xplace, int yplace) {
    xBomb = xplace+15;
    yBomb = yplace+15;
  }

  void move () {
    yBomb+=2;
  }

  void draw () {
    fill (255, 0, 255);
    ellipse(xBomb, yBomb, 15, 15);
  }

  boolean offScreen () {
    if (yBomb > SCREENY) {
      return true;
    }
    return false;
  }

  boolean collide (Player thePlayer) {
    if ((xBomb >= thePlayer.xpos && xBomb <= (thePlayer.xpos +PADDLEWIDTH)) && yBomb >= thePlayer.ypos && yBomb <= (thePlayer.ypos+PADDLEHEIGHT)) {
      return true;
    }
    return false;
  }
}
