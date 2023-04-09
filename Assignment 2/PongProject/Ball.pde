class Ball {
  float x; 
  float y;
  float dx; 
  float dy;
  float speed = 1;
  int radius;
  color ballColor = color(200, 100, 50);
  Ball() {
    x = random(SCREENX/4, SCREENX/2);
    y = random(SCREENY/4, SCREENY/2);
    dx = random(1, 2); 
    dy = random(1, 2);
    radius=5;
  }
  void move() {
    x = x+dx*speed; 
    y = y+dy*speed;
  }
  void draw() {
    fill(ballColor);
    ellipse(int(x), int(y), radius, 
      radius);
  }
  void collide(Player tp) {
    if (x-radius <=0) dx=-dx;
    else if (x+radius>=SCREENX) dx=-dx;
    if (y+radius >= tp.ypos &&
      y-radius<tp.ypos+PADDLEHEIGHT &&
      x >=tp.xpos && x <=
      tp.xpos+PADDLEWIDTH) {
      println("collided!");
      dy=-dy;
    }
  }
  void collide1(Player tp) {
    if (y+radius >= tp.ypos &&
      y-radius<tp.ypos+PADDLEHEIGHT &&
      x >=tp.xpos &&
      x <= tp.xpos+PADDLEWIDTH) {
      println("collided!");
      dy=-dy;
    }
  }
  void reset() {
    if (y>SCREENY) {
      y = 115;
    }
    if (y<0) {
      y = 115;
      dy=-dy;
    }
    if (thePlayer.computerWins>3) {
      thePlayer.computerWins = 0;
      thePlayer.playerWins = 0;
    }
    if (thePlayer.playerWins>3) {
      thePlayer.computerWins = 0;
      thePlayer.playerWins = 0;
    }
    //speed++;
  }
}
