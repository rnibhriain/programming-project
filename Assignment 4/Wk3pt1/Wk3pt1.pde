final int SCREENX = 600;
final int SCREENY = 600;
final int PADDLEHEIGHT = 15;
final int PADDLEWIDTH = 50;
final int MARGIN = 10;
PImage alienImage;
PImage explosion;
Player thePlayer;
Bullet bullet;
Bullet bullet1;
PowerUps currentPowerUp;
int count;

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
  bullet1 = new Bullet();
  currentPowerUp = new PowerUps();
  count = 0;
}

void draw() {
  background(255);
  thePlayer.move(mouseX);
  move_array(aliens);
  draw_array(aliens);  
  bullet.draw();
  bullet.move();
  bullet1.draw();
  bullet1.move();
  currentPowerUp.move();
  currentPowerUp.draw();
  thePlayer.draw();
  bullet.collide(aliens);
  bullet1.collide(aliens);
  count++;
  int pickAlien = (int) random (0, aliens.length-1);
  if (count == 200) {
    if (aliens[pickAlien].alienStatus != 30) {
      currentPowerUp = new PowerUps(aliens[pickAlien], thePlayer);
    }
    count = 0;
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
void mousePressed () {
  if (currentPowerUp.type == 1) {
    bullet = new Bullet(thePlayer.xpos, thePlayer.ypos);
    bullet1 = new Bullet(thePlayer.xpos+PADDLEWIDTH-4, thePlayer.ypos);
  }
  else {
    bullet = new Bullet(thePlayer);
  }
}
