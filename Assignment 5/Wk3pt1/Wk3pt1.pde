final int SCREENX = 600;
final int SCREENY = 600;
final int PADDLEHEIGHT = 15;
final int PADDLEWIDTH = 50;
final int MARGIN = 10;
PImage alienImage;
PImage explosion;
Player thePlayer;
Bullet bullet;
PFont myFont;
int bombCount;

Alien aliens [];

void settings() {
  size(SCREENX, SCREENY);
}

void setup() {
  alienImage= loadImage("spacer.gif");
  explosion = loadImage("exploding.gif");
  aliens = new Alien[10];
  noStroke();
  init_array(aliens, alienImage);
  thePlayer = new Player(SCREENY-MARGIN-PADDLEHEIGHT);
  bullet = new Bullet();
  bombCount = 0;
  myFont = loadFont("Serif.plain-18.vlw");
  textFont(myFont);
}

void draw() {
  background(255);
  if (aliens[bombCount].getBomb().collide(thePlayer)) {
    fill(0);
    text("Game Over!!", SCREENX/2-50, SCREENY/2-30);
  } else {
    if (checkWins(aliens)) {
      fill(0);
      text("YAY! YOU WIN!", SCREENX/2-50, SCREENY/2-30);
    } else {
      if (aliens[bombCount].getBomb().offScreen()) {
        aliens[bombCount].theBomb = null;
      }
      if (aliens[bombCount].getBomb()!=null&&aliens[bombCount].alienStatus==31) {
        aliens[bombCount].getBomb().move();
        aliens[bombCount].getBomb().draw();
      }

      if (aliens[bombCount].getBomb().offScreen()||aliens[bombCount].alienStatus!=31) {
        bombCount++;
        if (bombCount == 10) {
          bombCount = 0;
        }
        aliens[bombCount].init_bomb();
      }
      thePlayer.move(mouseX);
      move_array(aliens);
      draw_array(aliens);  
      bullet.draw();
      bullet.move();
      thePlayer.draw();
      bullet.collide(aliens);
    }
  }
}

void init_array(Alien aliens[], PImage alienimage) {
  for (int count=0; count<aliens.length; count++) {
    aliens[count] = new Alien(((count+1)*30)+(count*10), 20, alienimage, explosion);
  }
}

void draw_array (Alien aliens []) {
  for (int i=0; i<aliens.length; i++) {
    aliens[i].draw();
  }
}

void move_array(Alien aliens []) {
  for (int count=0; count<aliens.length; count++) {
    aliens[count].move();
  }
}

boolean checkWins (Alien aliens []) {
  int aliensCount = 0;
  for (int count = 0; count < aliens.length; count++) {
    if (aliens[count].alienStatus == 30) {
      aliensCount++;
    }
  }
  if (aliensCount == aliens.length) {
    return true;
  }
  return false;
}


void mousePressed () {
  bullet = new Bullet(thePlayer);
}
