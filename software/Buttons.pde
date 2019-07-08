class button {
  float x, y, dx, dy, textOffset;
  String text;
  boolean visible;
  int size;
  button(float x_, float y_, float dx_, float dy_, String text_, float textOffset_, boolean visible_, int size_) {
    x = x_;
    y = y_;
    dx = dx_;
    dy = dy_;
    text = text_;
    textOffset = textOffset_;
    visible = visible_;
    size = size_;
  }
  void show() {
    visible = true;
    pushMatrix();
    if (mouseX > x && mouseX < (x+dx) && mouseY > y && mouseY < (y + dy)) {
      for (int i = 0; i<dy; i++) {
        stroke(210 + i*50/dy);
        line(x, y+i, x + dx, y+i);
      }
      fill(255);
    } else {
      fill(200);
      for (int i = 0; i<dy; i++) {
        stroke(190 + i*50/dy);
        line(x, y+i, x + dx, y+i);
      }
    }
    rectMode(CORNER);
    stroke(0);
    strokeWeight(1);
    noFill();
    rect(x, y, dx, dy); 
    fill(0);
    textSize(20);
    textAlign(CENTER);
    noStroke();
    if (text == "up_arrow") {
      stroke(0);
      strokeWeight(2);
      line(x + dx/2, y + dy/4, x + dx/2, y + 3*dy/4);
      line(x + dx/2, y + dy/4, x + dx/4, y + 0.5*dy);
      line(x + dx/2, y + dy/4, x + 3*dx/4, y + 0.5*dy);
    } else if (text == "down_arrow") {
      stroke(0);
      strokeWeight(2);
      line(x + dx/2, y + dy/4, x + dx/2, y + 3*dy/4);
      line(x + dx/2, y + 3*dy/4, x + dx/4, y + 0.5*dy);
      line(x + dx/2, y + 3*dy/4, x + 3*dx/4, y + 0.5*dy);
    } else if (text == "left_arrow") {
      stroke(0);
      strokeWeight(2);
      line(x + dx/4, y + dy/2, x + 3*dx/4, y + dy/2);
      line(x + dx/4, y + dy/2, x + dx/2, y + dy/4);
      line(x + dx/4, y + dy/2, x + dx/2, y + 3*dy/4);
    } else if (text == "right_arrow") {
      stroke(0);
      strokeWeight(2);
      line(x + dx/4, y + dy/2, x + 3*dx/4, y + dy/2);
      line(x + 3*dx/4, y + dy/2, x + dx/2, y + dy/4);
      line(x + 3*dx/4, y + dy/2, x + dx/2, y + 3*dy/4);
    } else {
      textSize(size);
      text(text, x + dx/2, y + dy/2 + textOffset);
    }
    strokeWeight(1);
    popMatrix();
    textAlign(CORNER);
  }

  void hide() {
    visible = false;
  }
  boolean isClicked() {
    if (mousePressed && mouseX > x && mouseX < (x+dx) && mouseY > y && mouseY < (y + dy) && visible) {
      delay(100);
      visible = false;
      return true;
    } else {
      return false;
    }
  }
}
