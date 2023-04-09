int x = 0;
void setup() {
  size(400, 400);
  noStroke();
}
void draw () {
  background(0);
  fill(204, 255, 0);
  rect(x, 20, 50, 50);
  x++;
  if(x==399) {
    x = 0;
  }
}
