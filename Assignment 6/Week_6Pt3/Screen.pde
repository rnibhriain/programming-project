class Screen {
  ArrayList widgetList;
  color backgroundColour, borderColour;

  Screen ( color back) {
    widgetList = new ArrayList();
    backgroundColour = back;
  }

  void draw () {
    background(backgroundColour);
    for (int i = 0; i<widgetList.size(); i++) {
      Widget aWidget = (Widget) widgetList.get(i);
      borderColour = aWidget.getBorderColour(mouseX, mouseY);
      stroke(borderColour);
      aWidget.draw();
    }
  }

  int getEvent (int mousx, int mousy, int currentWidget) {
    Widget aWidget = (Widget) widgetList.get(currentWidget);
    return aWidget.getEvent(mousx, mousy);
  }

  void addWidget (int yLocation, color widgetColour, PFont font, int buttonEvent, String label) {
    Widget widgeta = new Widget(100, yLocation, 110, 40, label, widgetColour, font, buttonEvent);
    widgetList.add(widgeta);
  }
}
