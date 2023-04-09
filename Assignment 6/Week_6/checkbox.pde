class checkbox extends Widget {
  
  int checked;
  
  checkbox (int x, int y, PFont myFont, color colour) {
    super(x, y, 80, 80, "check", colour, myFont, EVENT_BUTTON4);
    checked = 0;
  }
  
  void checkTheBox (int check) {
    checked = check;

  }
  
  
}
