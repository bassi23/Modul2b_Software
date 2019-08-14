class station {
  float x;
  float y;
  boolean active;

  station(float x_, float y_, boolean active_) {
    x = x_;
    y = y_;
    active = active_;
  }


    void show() {
      if (mouseX > x && mouseX < (x + 400) && (mouseY - scroll) > y && (mouseY - scroll) < (y + 300)) {
        fill(150, 255, 150);
      } else {
        fill(0, 200, 00);
      }
      rect(x, y, 400, 300);
    }

    boolean isOver() {
      if (mouseX > x && mouseX < (x + 400) && (mouseY - scroll) > y && (mouseY - scroll) < (y + 300) && active) {
        return true;
      } else {
        return false;
      }
      
    }


    boolean isClicked() {
      if (this.isOver() && mousePressed && active) {
        return true;
      } else {
        return false;
      }
    }
  
}
