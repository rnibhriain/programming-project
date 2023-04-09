int x1 = 30;
int x2 = 70;
int y = 40;
void setup () {
  size(400, 400);
  noStroke();
}
void draw() {
  background(0);
  fill(255, 204, 0);
  rect(x1, 20, 50, 50);
  fill(204, 255, 0);
  rect(x2, 30, 50, 50);
  fill(0, 204, 255);
  rect(90, y, 50, 50);
  x1++;
  x2--;
  y++;
}
