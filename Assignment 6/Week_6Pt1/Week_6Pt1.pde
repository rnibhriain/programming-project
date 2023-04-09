ArrayList widgetList;
PFont stdFont;
final int EVENT_BUTTON1=1;
final int EVENT_BUTTON2=2;
final int EVENT_BUTTON3=3;
final int EVENT_NULL=0;
color currentColour = 0;
void setup() {
  Widget widget1, widget2, widget3;
  size(400, 400);
  stdFont=loadFont("Chiller-Regular-36.vlw"); 
  textFont(stdFont);
  widget1=new Widget(100, 100, 100, 40, 
    "red", color(#FF0000), stdFont, 
    EVENT_BUTTON1);
  widget2=new Widget(100, 200, 100, 40, 
    "green", color(#00FF00), stdFont, EVENT_BUTTON2);
  widget3= new Widget(100, 300, 100, 40, 
    "blue", color(#0000FF), stdFont, EVENT_BUTTON3);
  widgetList = new ArrayList();
  widgetList.add(widget1); 
  widgetList.add(widget2);
  widgetList.add(widget3);
  
}
void draw() {
  for (int i = 0; i<widgetList.size(); i++) {
    Widget aWidget = (Widget) widgetList.get(i);
    aWidget.draw();
  }
  fill(currentColour);
  rect(250, 200, 50, 50);
}
void mousePressed() {
  int event;
  for (int i = 0; i<widgetList.size(); i++) {
    Widget aWidget = (Widget) widgetList.get(i);
    event = aWidget.getEvent(mouseX, mouseY);
    switch(event) {
    case EVENT_BUTTON1:
      println("button 1!");
      currentColour = #FF0000;
      break;
    case EVENT_BUTTON2:
      println("button 2!");
      currentColour = #00FF00;
      break;
    case EVENT_BUTTON3:
      println("button 3!");
      currentColour = #0000FF;
      break;
    }
  }
}
