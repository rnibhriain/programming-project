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
  
  Widget getWidget (int currentWidget) {
    return (Widget) widgetList.get(currentWidget);
  }

  void addWidget (Widget widgeta) {
    widgetList.add(widgeta);
  }
  
  void removeWidget (int i) {
    widgetList.remove(i);
  }
  
}
