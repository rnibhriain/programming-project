int x = -50;
int x1 = -50;
int x2 = 400;
int x3 = 400;
int y1 = 50;
int y2 = 300;
void setup() {
  size(400, 400);
  noStroke();
}
void draw () {
  background(0);
  fill(y1, 255, y2);
  rect(x, 50*sin(2*(3.14)*x/50), 50, 50);
  fill(255, y2, y1);
  rect(x2, 50*(sin((2*(3.14)*x2)/50))+150, 50, 50);
  if (x>=350) {
    fill(y1, 255, y2);
    rect(x1, 50*sin(2*(3.14)*x/50), 50, 50);
    x1++;
    fill(255, y2, y1);
    rect(x3, 50*(sin((2*(3.14)*x2)/50))+150, 50, 50);
    x3--;
  }
  if (x1>=0) {
    x1 = -50;
    x = 0;
    x2 = 350;
    x3 = 400;
  }
  if (x < 200) {
    y1++;
    y2--;
  }
  else {
    y1--;
    y2++;
  }
  x++;
  x2--;
}
