int x = -50;
int x1 = -50;
void setup() {
  size(400, 400);
  noStroke();
}
void draw () {
  background(0);
  fill(204, 255, 0);
  rect(x, 20, 50, 50);
  if (x>=350) {
    fill(204, 255, 0);
    rect(x1, 20, 50, 50);
    x1++;
  }
  if (x1>=0) {
    x1 = -50;
    x = 0;
  }
  x++;
}
