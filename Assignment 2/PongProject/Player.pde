class Player {
  float xpos; 
  float ypos;
  int computerWins = 0;
  int playerWins = 0;
  color paddlecolor = color(255);
  Player(int screen_y)
  {
    xpos=SCREENX/2;
    ypos=screen_y;
  }
  void move(int x) {
    if (x>SCREENX-PADDLEWIDTH) xpos = SCREENX-PADDLEWIDTH;
    else xpos=x;
  }
  void draw()
  {
    fill(paddlecolor);
    rect(xpos, ypos, PADDLEWIDTH, PADDLEHEIGHT);
  }
  void checkWins (float y) {
    if (y>SCREENY) {
      computerWins++;
    } else if (y<0) {
      playerWins++;
    }
  }
  void computerMove () {
    if (xpos < theBall.x) {
      xpos += 1;
    } else if (xpos > theBall.x) {
      xpos-=1;
    }
  }
}
