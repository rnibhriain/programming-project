final int SCREENX = 400;
final int SCREENY = 400;
PImage alienImage;
PImage explosion;
PImage extraAlien;
int count;

Alien aliens [];

void settings() {
  size(SCREENX, SCREENY);
}

void setup() {
  alienImage= loadImage("spacer.gif");
  explosion = loadImage("exploding.gif");
  extraAlien = loadImage("extraAlien.jpg");
  aliens = new Alien[10];
  noStroke();
  init_array(aliens, alienImage);
  count = 0;
}

void draw() {
  background(0);
  move_array(aliens);
  draw_array(aliens); 
  count++;
  if (count == 200) {
    int randomAlien = (int) random(0, 10);
    if (aliens[randomAlien].alienStatus!=30) {
      aliens[randomAlien].explode();
    }
    count = 0;
  }
}

void init_array(Alien aliens[], PImage alienimage) {
  for (int count=0; count<aliens.length; count++) {
    if (count < 5) {
      aliens[count] = new Alien(((count+1)*30)+(count*10), 50, alienimage, explosion);
    } else {
      aliens[count] = new Alien(((count-4)*30)+((count-5)*10), 100, extraAlien, explosion);
    }
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
