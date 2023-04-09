int x = -50;
int x1 = -50;
int x2 = 400;
int x3 = 400;
void setup() {
  size(400, 400);
  noStroke();
}
void draw () {
  background(0);
  fill(204, 255, 0);
  rect(x, 20, 50, 50);
  fill(250, 0, 0);
  rect(x2, 150, 50, 50);
  if (x>=350) {
    fill(204, 255, 0);
    rect(x1, 20, 50, 50);
    fill(250, 0, 0);
    rect(x3, 150, 50, 50);
    x1++;
    x3--;
  }
  if (x1>=0) {
    x1 = -50;
    x = 0;
    x2 = 350;
    x3 = 400;
  }
  x++;
  x2--;
}
