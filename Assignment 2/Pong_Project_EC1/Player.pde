class Player {
  int xpos; 
  int ypos;
  int computerWins = 0;
  int playerWins = 0;
  color paddlecolor = color(50);
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
    if (computerWins==3) {
      System.out.println("Game over!");
      computerWins = 0;
    } else if (playerWins==3) {
      System.out.println("You win! Fuck the machines!");
      playerWins = 0;
    }
  }
}
