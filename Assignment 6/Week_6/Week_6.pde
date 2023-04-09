ArrayList screenList;
PFont stdFont;
final int EVENT_BUTTON1=1;
final int EVENT_BUTTON2=2;
final int EVENT_BUTTON3=3;
final int EVENT_BUTTON4=4;
final int EVENT_BUTTON5=5;
final int EVENT_NULL=0;
int currentScreen = 0;
int boxChecked = 0;
int radioOn = 0;
PImage sunflower;
void setup() {
  Screen screen1, screen2, screen3;
  size(400, 400);
  stdFont=loadFont("Scheherazade-Regular-36.vlw"); 
  textFont(stdFont);
  sunflower = loadImage("sunflower.jpg");
  screen1 = new Screen(#C6F3EF);
  screen2 = new Screen(#FF5733);
  screen3 = new Screen(#D8365C);
  screenList = new ArrayList();
  Widget widget1 = new Widget (0, 100, 130, 40, "Slider", #DAF7A6, stdFont, EVENT_BUTTON1);
  screen1.addWidget(widget1);
  Widget widget2 = new Widget(100, 200, 130, 40, "Forward", #E46C6C, stdFont, EVENT_BUTTON2);
  screen1.addWidget(widget2);
  Widget widget3 = new Widget(100, 300, 130, 40, "Surprise!", #FFEFA4, stdFont, EVENT_BUTTON3);
  screen1.addWidget(widget3);
  Widget widget4 =  new Widget(100, 100, 130, 40, "Button 2", #F0DE5E, stdFont, EVENT_BUTTON1);
  screen2.addWidget(widget4);
  Widget widget5 = new Widget(100, 200, 130, 40, "Backward", #4CC7DF, stdFont, EVENT_BUTTON2);
  screen2.addWidget(widget5);
  Widget widget6 = new Widget(100, 250, 130, 40, "Go back", #DAF7A6, stdFont, EVENT_BUTTON2);
  screen3.addWidget(widget6);
  checkbox check = new checkbox (0, 0, stdFont, #FFC300);
  screen1.addWidget(check);
  screenList.add(screen1);
  screenList.add(screen2);
  screenList.add(screen3);
}
void draw() {
  Screen screenA = (Screen) screenList.get(currentScreen);
  screenA.draw();
  if (currentScreen == 2) {
    image(sunflower, 100, 20);
  }
  if (currentScreen == 0 && boxChecked == 1) {
    line(0, 0, 80, 80);
    line(0, 80, 80, 0);
  }
  Widget widgetA = screenA.getWidget(0);
  fill(0);
  text("number: " + widgetA.x , 150, 150);
}
void mousePressed() {
  int event;
  Screen screenA = (Screen) screenList.get(currentScreen);
  for (int i = 0; i<screenA.widgetList.size(); i++) {
    event = screenA.getEvent(mouseX, mouseY, i);
    switch(event) {
    case EVENT_BUTTON1:
      if (currentScreen == 0) {
        println("Button 1 pressed!");
      } else {
        println("Button 2 pressed!");
      }
      break;
    case EVENT_BUTTON2:
      if (currentScreen == 0) {
        currentScreen = 1;
      } else {
        currentScreen = 0;
      }
      break;
    case EVENT_BUTTON3:
      if (currentScreen == 0) {
        currentScreen = 2;
      }
      break;
    case EVENT_BUTTON4:
      checkbox check = (checkbox) screenA.getWidget(i);
      if (check.checked == 0) {
        check.checkTheBox(1);
        boxChecked = 1;
      } else {
        check.checkTheBox(0);
        boxChecked = 0;
      }
      break;
    }
  }
}

void mouseDragged () {
  int event;
  Screen screenA = (Screen) screenList.get(currentScreen);
  for (int i = 0; i<screenA.widgetList.size(); i++) {
    event = screenA.getEvent(mouseX, mouseY, i);
    switch(event) {
    case EVENT_BUTTON1:
      if (currentScreen == 0) {
        Widget widgetA = screenA.getWidget(i);
        widgetA.x=mouseX;
      } else {
        println("Button 2 pressed!");
      }
      break;
    }
  }
}
