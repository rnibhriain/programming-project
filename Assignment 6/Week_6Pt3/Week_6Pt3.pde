ArrayList screenList;
PFont stdFont;
final int EVENT_BUTTON1=1;
final int EVENT_BUTTON2=2;
final int EVENT_NULL=0;
color currentColour = 0;
int currentScreen = 0;
void setup() {
  Screen screen1, screen2;
  size(400, 400);
  stdFont=loadFont("Chiller-Regular-36.vlw"); 
  textFont(stdFont);
  screen1 = new Screen(255);
  screen2 = new Screen(#6F6E6E);
  screenList = new ArrayList();
  screen1.addWidget(100, #FF0000, stdFont, EVENT_BUTTON1, "Button1");
  screen1.addWidget(200, #26CD12, stdFont, EVENT_BUTTON2, "Forward");
  screen2.addWidget(100, #092FF9, stdFont, EVENT_BUTTON1, "Button2");
  screen2.addWidget(200, #09F9E7, stdFont, EVENT_BUTTON2, "Backward");
  screenList.add(screen1);
  screenList.add(screen2);
}
void draw() {
  Screen screenA = (Screen) screenList.get(currentScreen);
  screenA.draw();
}
void mousePressed() {
  int event;
  Screen screenA = (Screen) screenList.get(currentScreen);
  for (int i = 0; i<screenA.widgetList.size(); i++) {
    event = screenA.getEvent(mouseX, mouseY, i);
    switch(event) {
    case EVENT_BUTTON1:
      if (currentScreen == 0) {
        println("Button1 pressed!");
      } else {
        println("Button2 pressed!");
      }
      break;
    case EVENT_BUTTON2:
      if (currentScreen == 0) {
        currentScreen = 1;
      } else {
        currentScreen = 0;
      }
      break;
    }
  }
}
