String[] Reihenfolge = {"A", "B", "C", "D", "E"};
String[] Reihenfolge2 = {"A", "B", "C", "D", "E"};
String[] Reihenfolge_Sensor = {"A", "B", "C", "D", "E"};
float[] Position = {0, 0, 0, 0, 0};
float[] Position2 = {0, 0, 0, 0, 0};

void MenschSensor() {
  onlyOneProbe();
  fill(0);
  textSize(20);
  textFont(bold);
  text("Station 2.2 - Ich rieche was, was du nicht riechst", 20, 50);
  textFont(normal);
  Station2_Aufgabentext_a.show();
  //text("Nimm dir die 5 Proben des verdünnten Ethanols und rieche daran. Ordne sie der Konzentration nach und notiere dir dir Reihen-\nfolge.\n\nKlicke anschließend auf 'Sensormessung' und lasse den Sensor an den Proben 'riechen'.", 20, 100);
  stroke(0);
  line(0, 200, 1280, 200);


  noStroke();
  textSize(25);
  textFont(bold);
  text("hohe Konzentration", 295, 250);
  text("niedrige Konzentration", 770, 250);
  text("  Riechen\nVersuch 1", 120, 360);
  text("  Riechen\nVersuch 2", 120, 490);
  // text("Sicherheit in %", 20, 565);
  textFont(normal);

  fill(0);
  textSize(40);
  for (int i = 0; i < 4; i++) {
    text(">", 415 + 150*i, 380);
    text(">", 415 + 150*i, 510);
  }
  fill(255);
  stroke(0);
  for (int i = 0; i < 5; i++) {
    // rect(300 + 150*i, 215, 110, 110);
    //  rect(300 + 150*i, 345, 110, 110);
  }



  a.show(myText[0]);
  b.show(myText[1]);
  c.show(myText[2]);
  d.show(myText[3]);
  e.show(myText[4]);

  a2.show(myText2[0]);
  b2.show(myText2[1]);
  c2.show(myText2[2]);
  d2.show(myText2[3]);
  e2.show(myText2[4]);



  for (int i = 0; i < 5; i++) {
    if (!A.active) {
      if (A.x > (255 + 150*i)*scale_factor && A.x < (455+ 150*i)*scale_factor && A.y > 170*scale_factor && A.y  < 370*scale_factor ) {
        A.x = (355 + 150*i)*scale_factor; 
        A.y = 270*scale_factor;
      }
      if (!B.active) {
        if (B.x > (255 + 150*i)*scale_factor && B.x < (455+ 150*i)*scale_factor && B.y > 170*scale_factor && B.y  < 370*scale_factor ) {
          B.x = (355 + 150*i)*scale_factor; 
          B.y = 270*scale_factor;
        }
      }
      if (!C.active) {
        if (C.x > (255 + 150*i)*scale_factor && C.x < (455+ 150*i)*scale_factor && C.y > 170*scale_factor && C.y  < 370*scale_factor ) {
          C.x = (355 + 150*i)*scale_factor; 
          C.y = 270*scale_factor;
        }
      }
      if (!D.active) {
        if (D.x > (255 + 150*i)*scale_factor && D.x < (455+ 150*i)*scale_factor && D.y > 170*scale_factor && D.y  < 370*scale_factor ) {
          D.x = (355 + 150*i)*scale_factor; 
          D.y = 270*scale_factor;
        }
      }
      if (!E.active) {
        if (E.x > (255 + 150*i)*scale_factor && E.x < (455+ 150*i)*scale_factor && E.y > 170*scale_factor && E.y  < 370*scale_factor ) {
          E.x = (355 + 150*i)*scale_factor; 
          E.y = 270*scale_factor;
        }
      }
    }
  }
  for (int i = 0; i < 5; i++) {
    if (!A2.active) {
      if (A2.x > (255 + 150*i)*scale_factor && A2.x < (455+ 150*i)*scale_factor && A2.y > 300*scale_factor && A2.y  < 500*scale_factor ) {
        A2.x = (355 + 150*i)*scale_factor; 
        A2.y = 400*scale_factor;
      }
      if (!B2.active) {
        if (B2.x > (255 + 150*i)*scale_factor && B2.x < (455+ 150*i)*scale_factor && B2.y > 300*scale_factor && B2.y  < 500*scale_factor ) {
          B2.x = (355 + 150*i)*scale_factor; 
          B2.y = 400*scale_factor;
        }
      }
      if (!C2.active) {
        if (C2.x > (255 + 150*i)*scale_factor && C2.x < (455+ 150*i)*scale_factor && C2.y > 300*scale_factor && C2.y  < 500*scale_factor ) {
          C2.x = (355 + 150*i)*scale_factor; 
          C2.y = 400*scale_factor;
        }
      }
      if (!D2.active) {
        if (D2.x > (255 + 150*i)*scale_factor && D2.x < (455+ 150*i)*scale_factor && D2.y > 300*scale_factor && D2.y  < 500*scale_factor ) {
          D2.x = (355 + 150*i)*scale_factor; 
          D2.y = 400*scale_factor;
        }
      }
      if (!E2.active) {
        if (E.x > (255 + 150*i)*scale_factor && E2.x < (455+ 150*i)*scale_factor && E2.y > 300*scale_factor && E2.y  < 500*scale_factor ) {
          E2.x = (355 + 150*i)*scale_factor; 
          E2.y = 400*scale_factor;
        }
      }
    }
  }


  stroke(0);
  for (float i = 0; i < 100; i++) {
    line(20*i, 570, 20*i + 15, 570);
  }


  if (myText2[0].length() > 0 && myText2[1].length() > 0 && myText2[2].length() > 0 && myText2[3].length() > 0 && myText2[4].length() > 0 && myText[0].length() > 0 && myText[1].length() > 0 && myText[2].length() > 0 && myText[3].length() > 0  && myText[4].length() > 0) {
    Sensormessung.show();
  } else {
    Sensormessung.hide();
  }
}

void Station2_Riechen2() {
  onlyOneProbe();
  fill(0);
  textSize(20);
  textFont(bold);
  text("Station 2 - Mensch vs. Sensor", 20, 50);
  textFont(normal);
  Station2_Aufgabentext_a2.show();
  //text("Nimm dir die 5 Proben des verdünnten Ethanols und rieche daran. Ordne sie der Konzentration nach und notiere dir dir Reihen-\nfolge.\n\nKlicke anschließend auf 'Sensormessung' und lasse den Sensor an den Proben 'riechen'.", 20, 100);
  stroke(0);
  line(0, 200, 1280, 200);


  noStroke();
  textSize(25);
  text("Konzentration", 20, 405);
  // text("Sicherheit in %", 20, 565);

  fill(0);
  textSize(40);
  for (int i = 0; i < 4; i++) {
    text(">", 415 + 150*i, 410);
  }
  fill(255);
  stroke(0);
  for (int i = 0; i < 5; i++) {
    rect(300 + 150*i, 345, 110, 110);
  }
  A2.show();
  B2.show();
  C2.show();
  D2.show();
  E2.show();


  if (A2.inPlace && B2.inPlace && C2.inPlace && D2.inPlace && E2.inPlace) {
    Sensormessung.show();
  } else {
    Sensormessung.hide();
  }
}






class Probe {
  float x;
  float y;
  String text;
  boolean active;
  boolean inPlace;
  Probe(float x_, float y_, String text_, boolean active_, boolean inPlace_) {
    x = x_;
    y = y_;
    text = text_;
    active = active_;
    inPlace = inPlace_;
  }

  void show() {
    if (x > (width - 50*scale_factor)) {
      x = (width - 50*scale_factor);
    }
    if (x < 50*scale_factor) {
      x = 50*scale_factor;
    }
    if (y < 50*scale_factor) {
      y = 50*scale_factor;
    }
    if (y > (height - 50*scale_factor)) {
      y = (height - 50*scale_factor);
    }
    if (text == "A" || text == "A2") {
      fill(255, 200, 200);
    } else if (text == "B"|| text == "B2") {
      fill(200, 200, 255);
    } else if (text == "C"|| text == "C2") {
      fill(255, 255, 100);
    } else if (text == "D"|| text == "D2") {
      fill(200, 255, 200);
    } else if (text == "E"|| text == "E2") {
      fill(200);
    }

    stroke(0);
    rect((x)/scale_factor-50, (y)/scale_factor-50, 100, 100);
    fill(0);
    text(text, x/scale_factor-15, y/scale_factor+15);
    if (text == "A" || text == "B" || text == "C" || text == "D" || text == "E") {
      if (this.y > 220*scale_factor && this.y < 320*scale_factor && this.x > 300*scale_factor && this.x < 1000*scale_factor) {
        this.inPlace = true;
      } else {
        this.inPlace = false;
      }
    }
    if (text == "A2" || text == "B2" || text == "C2" || text == "D2" || text == "E2") {
      if (this.y > 350*scale_factor && this.y < 450*scale_factor && this.x > 300*scale_factor && this.x < 1000*scale_factor) {
        this.inPlace = true;
      } else {
        this.inPlace = false;
      }
    }
    if (this.isOver() && mousePressed && this.active) {
      x = mouseX;
      y = (mouseY - scroll);
    }
  }

  void hide() {
    this.active = false;
    this.inPlace = true;
  }
  boolean isOver() {
    if (mouseX > (x - 50*scale_factor) && mouseX  < (x + 50*scale_factor) && (mouseY - scroll) > (y - 50*scale_factor) && (mouseY - scroll)< (y + 50*scale_factor)) {
      this.active = true;
      onlyOneProbe();
      return true;
    } else {
      this.active = false;
      onlyOneProbe();
      return false;
    }
  }
  float compareTo(Object o) {
    Probe e = (Probe)o;
    if (x*scale_factor < e.x) {
      return -1;
    } else {
      return 1;
    }
  }

  void overlaps(Object o) {
    Probe e = (Probe)o;
    //von links

    //if (x/scale_factor + 50 > e.x/scale_factor -50 && x/scale_factor - 50 < e.x/scale_factor && y > e.y/scale_factor - 50 && y/scale_factor < e.y/scale_factor+50) {
    //  e.x = x + 100*scale_factor;
    //}
    ////von rechts
    //if (x -50 < e.x + 50 && x - 50 > e.x && y > e.y - 50 && y < e.y+50) {
    //  e.x = x - 100*scale_factor;
    //}
    ////von oben
    //if (y + 50 > e.y - 50 && y + 50 < e.y && x - 50 < e.x + 50 && x  + 50> e.x - 50) {
    //  e.y = y + 100*scale_factor;
    //}
    //if (y - 50 < e.y + 50 && y - 50 > e.y && x - 50 < e.x + 50 && x  + 50> e.x - 50) {
    //  e.y = y - 100*scale_factor;
    //}

    if (x/scale_factor + 50 > e.x/scale_factor -50 && x/scale_factor - 50 < e.x/scale_factor && y > e.y/scale_factor - 50 && y/scale_factor < e.y/scale_factor+50) {
      e.x = x + 100*scale_factor;
    }
    //von rechts
    if (x -50 < e.x + 50 && x - 50 > e.x && y > e.y - 50 && y < e.y+50) {
      e.x = x - 100*scale_factor;
    }
    //von oben
    if (y + 50 > e.y - 50 && y + 50 < e.y && x - 50 < e.x + 50 && x  + 50> e.x - 50) {
      e.y = y + 100*scale_factor;
    }
    if (y - 50 < e.y + 50 && y - 50 > e.y && x - 50 < e.x + 50 && x  + 50> e.x - 50) {
      e.y = y - 100*scale_factor;
    }
  }
}


void onlyOneProbe() {
  if (A.active) {
    B.active = false; 
    C.active = false; 
    D.active = false; 
    E.active = false;
  }
  if (B.active) {
    A.active = false;
    C.active = false; 
    D.active = false; 
    E.active = false;
  }
  if (C.active) {
    A.active = false;
    B.active = false;
    D.active = false; 
    E.active = false;
  } 

  if (D.active) {
    A.active = false;
    B.active = false;
    C.active = false; 
    E.active = false;
  }
  if (E.active) {
    A.active = false;
    B.active = false;
    C.active = false; 
    D.active = false;
  }

  if (A2.active) {
    B2.active = false; 
    C2.active = false; 
    D2.active = false; 
    E2.active = false;
  }
  if (B2.active) {
    A2.active = false;
    C2.active = false; 
    D2.active = false; 
    E2.active = false;
  }
  if (C2.active) {
    A2.active = false;
    B2.active = false;
    D2.active = false; 
    E2.active = false;
  } 

  if (D2.active) {
    A2.active = false;
    B2.active = false;
    C2.active = false; 
    E2.active = false;
  }
  if (E2.active) {
    A2.active = false;
    B2.active = false;
    C2.active = false; 
    D2.active = false;
  }
}





float[] MesswertSensor = {0, 0, 0, 0, 0};
float[] MesswertSensor2 = {0, 0, 0, 0, 0};
float currentTime = -100000;
int prob = 0;

float[][] MenschSensorMesswerte = new float[10][500];
int indexMenschSensorMax = 0;

int indexMenschSensor = 0;
boolean MenschSensorMessen = false;

int scale_MenschSensor = 0;

void Station2_Sensor() {
  reset_Station2.show();
  up2.show();
  down2.show();

  if (up2.isClicked()) {
    scale_MenschSensor += 1;
    if (scale_MenschSensor > 7) {
      scale_MenschSensor = 0;
    }
  }

  if (down2.isClicked()) {
    scale_MenschSensor -= 1;
    if (scale_MenschSensor < 0) {
      scale_MenschSensor = 7;
    }
  }

  textFont(normal);
  String temp = "A";
  if (prob == 1) {
    temp = "B";
  } else if (prob == 2) {
    temp = "C";
  } else if (prob == 3) {
    temp = "D";
  } else if (prob == 4) {
    temp = "E";
  }
  textSize(20);
  // if (MenschSensorMesswerte[prob+5][indexMenschSensor] > 60 || MenschSensorMesswerte[prob+5][indexMenschSensor] == 0) {
  if (indexMenschSensor > 0) {
    //println(MenschSensorMessen, (MenschSensorMesswerte[5+prob-1][indexMenschSensor-1] - MenschSensorMesswerte[5+prob-1][0]));
  }

  if (indexMenschSensor > 1) {
    if ((MenschSensorMesswerte[5+prob-1][indexMenschSensor-1] - MenschSensorMesswerte[5+prob-1][0]) > 60) {
      MenschSensorMessen = false;
    }
  }

  if ((millis() - currentTime)/1000 > 60) {

    // MenschSensorMessen = false;
    if (prob != 5) {
      if (temp == "A") {
        Station2_Aufgabentext_b1.show();
        messen.text = "Messung A";
      } else if (temp == "B") {
        Station2_Aufgabentext_b2.show();
        messen.text = "Messung B";
      } else if (temp == "C") {
        Station2_Aufgabentext_b3.show();
        messen.text = "Messung C";
      } else if (temp == "D") {
        Station2_Aufgabentext_b4.show();
        messen.text = "Messung D";
      } else if (temp == "E") {
        Station2_Aufgabentext_b5.show();
        messen.text = "Messung E";
      }
      //text("Schraube Probe " + temp + " an die Platine und klicke anschließend auf 'Messen'. Eine Messung\ndauert 60 Sekunden.", 20, 120);
      messen.show();
    }
    letzteWiederholen.show();
  } else {
    textSize(20);
    textFont(bold);
    text("Deine Reihenfolge 1. Versuch: " + myText[0] + " > " + myText[1] + " > " + myText[2] + " > " + myText[3] + " > " + myText[4], 20, 75);
    text("\nDeine Reihenfolge 2. Versuch: " + myText2[0] + " > " + myText2[1] + " > " + myText2[2] + " > " +myText2[3] + " > " +myText2[4], 20, 75);
    messen.hide();
    letzteWiederholen.hide();
    textFont(normal);
  }

  if (messen.isClicked()) {
    currentTime = millis();
    indexMenschSensor = 0;
    MenschSensorMessen = true;
    if (prob < 5) {
      prob += 1;
    }
  }



  float t1 = 60*(slider_Mensch_Sensor.x1-500)/700;
  float t2 = 60*(slider_Mensch_Sensor.x2-500)/700;
//  println(t1, t2, MesswertSensor[0]);
  float indexMWProbe0 = 0;
  float indexMWProbe1 = 0;
  float indexMWProbe2 = 0;
  float indexMWProbe3 = 0;
  float indexMWProbe4 = 0;
  /// DURCHSCHNITTSBERECHNUNG

  //  if (prob == 1) {
  MesswertSensor[0] = 0;
  MesswertSensor[1] = 0;
  MesswertSensor[2] = 0;
  MesswertSensor[3] = 0;
  MesswertSensor[4] = 0;

  for (int i = 0; i < 500; i++) {
    if ((MenschSensorMesswerte[5][i] - MenschSensorMesswerte[5][0]) >= t1 && (MenschSensorMesswerte[5][i] - MenschSensorMesswerte[5][0]) <= t2) { 
      indexMWProbe0 += 1;
      MesswertSensor[0] += MenschSensorMesswerte[0][i];
    }
    if ((MenschSensorMesswerte[6][i] - MenschSensorMesswerte[6][0])  >= t1 && (MenschSensorMesswerte[6][i] - MenschSensorMesswerte[6][0])  <= t2) { 
      indexMWProbe1 += 1;
      MesswertSensor[1] += MenschSensorMesswerte[1][i];
    }
    if ((MenschSensorMesswerte[7][i] - MenschSensorMesswerte[7][0])  >= t1 && (MenschSensorMesswerte[7][i] - MenschSensorMesswerte[7][0])  <= t2) { 
      indexMWProbe2 += 1;
      MesswertSensor[2] += MenschSensorMesswerte[2][i];
    }
    if ((MenschSensorMesswerte[8][i] - MenschSensorMesswerte[8][0])  >= t1 && (MenschSensorMesswerte[8][i] - MenschSensorMesswerte[8][0])  <= t2) { 
      indexMWProbe3 += 1;
      MesswertSensor[3] += MenschSensorMesswerte[3][i];
    }
    if ((MenschSensorMesswerte[9][i] - MenschSensorMesswerte[9][0])  >= t1 && (MenschSensorMesswerte[9][i] - MenschSensorMesswerte[9][0])  <= t2) { 
      indexMWProbe4 += 1;
      MesswertSensor[4] += MenschSensorMesswerte[4][i];
    }
  }
  MesswertSensor[0] = MesswertSensor[0]/indexMWProbe0;
  MesswertSensor[1] = MesswertSensor[1]/indexMWProbe1;
  MesswertSensor[2] = MesswertSensor[2]/indexMWProbe2;
  MesswertSensor[3] = MesswertSensor[3]/indexMWProbe3;
  MesswertSensor[4] = MesswertSensor[4]/indexMWProbe4;


  if (letzteWiederholen.isClicked()) {

    if (prob > 0) {
      MenschSensorMessen = true;

      indexMenschSensorMax = 0;
      indexMenschSensor = 0;
      currentTime = millis();
    }
  }
  if (prob == 5) {
    messen.hide();
    if ((MenschSensorMesswerte[5+prob-1][indexMenschSensor-1] - MenschSensorMesswerte[5+prob-1][0]) > 60) {
      text("Bist du mit der Messung zufrieden?", 20, 120);
      ja_zufrieden.show();
      messen.hide();
    }
  } else {
    ja_zufrieden.hide();
  }
  textSize(25);

  fill(255);
  stroke(0);
  rect(10, 240, 350, 310);
  rect(500, 190, 700, 400);

  fill(255, 200, 200);
  rect(10, 310, 350, 50);
  fill(200, 200, 255);
  rect(10, 360, 350, 50);
  fill(255, 255, 100);
  rect(10, 410, 350, 50);
  fill(200, 255, 200);
  rect(10, 460, 350, 50);
  fill(200);
  rect(10, 510, 350, 50);



  fill(0);
  textAlign(CENTER);
  for (int i = 0; i < 5; i++) {
    if (MesswertSensor[i] != 0.0) {
      text(nf(MesswertSensor[i], 0, 1), 240, 345 + 50*i);
    } else {
      textSize(16);
      text("noch nicht gemessen", 240, 340 + 50*i);
    }
  }
  textAlign(CORNER);
  textSize(20);
  text("A", 60, 342);
  text("B", 60, 392);
  text("C", 60, 442);
  text("D", 60, 492);
  text("E", 60, 542);
  textAlign(CENTER);
  text("Gemessen im Zeitintervall\n[" + round(t1) + " s, " + round(t2) + " s]", 180, 592);
  textAlign(CORNER);
  text("Probe", 40, 280); 
  text("   Durchschnittliche\nKonzentration in ppb", 140, 265);
  text("Zeit in Sekunden", 750, 660);
  if (prob == 1) {
    strokeWeight(1);
    text("60", 1200, 630);
    for (int i = 5; i < 60; i+= 5) {
      strokeWeight(2);
      if (i % 10 == 0) {
        stroke(0);
      } else {
        stroke(200);
      }
      line(500 + i*11.66667, 190, 500 + i*11.66667, 590);
    }
  } else {
    strokeWeight(1);
    text("60", 1200, 630);
    if (prob != 0) {
      for (int i = 5; i < 60; i+= 5) {
        strokeWeight(2);
        if (i % 10 == 0) {
          stroke(0);
        } else {
          stroke(200);
        }
        line(500 + i*11.66667, 190, 500 + i*11.66667, 590);
        strokeWeight(1);
        if (490 + i*11.66667 < 1200 && i%10 == 0) {
          text(i, 490 + i*11.66667, 620);
        }
      }
    }
  }
  stroke(0);
  line(130, 240, 130, 560);


  float max = 0;
  if (scale_MenschSensor == 0) {
    for (int i = 0; i < 500; i++) {
      for (int j = 0; j < 5; j++) {
        if ( MenschSensorMesswerte[j][i] > max) {
          max = MenschSensorMesswerte[j][i];
        }
      }
    }
  } else if (scale_MenschSensor == 1) {
    max = 100;
  } else if (scale_MenschSensor == 2) {
    max = 500;
  } else if (scale_MenschSensor == 3) {
    max = 1000;
  } else if (scale_MenschSensor == 4) {
    max = 5000;
  } else if (scale_MenschSensor == 5) {
    max = 10000;
  } else if (scale_MenschSensor == 6) {
    max = 50000;
  } else {
    max = 60000;
  }
  noStroke();
  fill(0);
  textAlign(RIGHT);
  if (max == 100 || max == 500 || max == 1000 || max == 5000 || max == 10000 || max == 50000 || max == 60000) {
    for (int i = 4; i > 0; i--) {
      text(round(max - i*max/5), 470, 195 + 80*i);
    }
  }


  text(nf(round(max), 0, 0), 470, 200);
  text("0", 470, 590);
  text("0", 500, 630);

  //for (int i = 0; i < 5; i++) {
  //  for (int j = 0; j < 500; j++) {
  //    if (MenschSensorMesswerte[i][j] != 0 && j > indexMenschSensorMax) {
  //      indexMenschSensorMax = j + 1;
  //    }
  //  }
  //}

  slider_Mensch_Sensor.show();
  slider_Mensch_Sensor.move();
  fill(0);


  if (scale_MenschSensor > 0) {
    for (int i = 0; i < 4; i++) {
      stroke(200);
      line(500, 270 + 80*i, 1200, 270 + 80*i);
    }
  }
  strokeWeight(4);

  for (int j = 0; j < prob; j++) {
    for (int i = 1; i < 500; i++) {
      float x1, x2, y1, y2;

      x1 = 500 + (MenschSensorMesswerte[j+5][i]-MenschSensorMesswerte[j+5][0])*700/60; 
      x2 = 500 + (MenschSensorMesswerte[j+5][i-1]-MenschSensorMesswerte[j+5][0])*700/60;
      y1 = 590 - MenschSensorMesswerte[j][i]*400/max;
      y2 = 590 - MenschSensorMesswerte[j][i-1]*400/max;
      if (x1 > 1200) {
        x1 = 1200;
      }
      if (x2 <= 1200 && x1>=500) {
        noFill();
        if (j == 0) {
          stroke(255, 0, 0);
        } else if (j == 1) {
          stroke(0, 0, 255);
        } else if (j == 2) {
          stroke(255, 215, 0);
        } else if (j == 3) {
          stroke(0, 155, 0);
        } else if (j == 4) {
          stroke(0);
        }
        float m = ((y2 - y1)/(x2 - x1));
        if (x1 <= 500) {
          y2 = m*175 + y1 - m*x1;
        }
        if (y2 <= 190) {
          y2 = 190;
          x2 = (190 + m*x1 - y1)/m;
        }
        if (y1 <= 190) {
          y1 = 190;
          x1 = (190 + m*x2 - y2)/m;
        }


        //  if (y1 >= 190 && y2 >= 190 && x2 >= 500 && x1 <= 1200 && x2 <= 1200 && MenschSensorMesswerte[j][i] != 0) {
        if (y1 >= 190 && y2 >= 190 && x2 >= 500 && x1 <= 1200 && x2 <= 1200 && x1>=500) {
          strokeWeight(3);
          line(x1, y1, x2, y2);
        }
        if (MenschSensorMesswerte[j][i] <= max && MenschSensorMesswerte[j][i-1] <= max) {
          dottedLine(500, 590 - MesswertSensor[j]*400/max, 1200, 190);
          strokeWeight(1);
        }
        stroke(0);
        fill(0);
      }
    }
  }

  if (ja_zufrieden.isClicked()) {
    page = 2.3;
  }
  strokeWeight(1);

  pushMatrix();
  translate(width/2, height/2);
  rotate(3*PI/2);
  if (max <= 1000) {
    text("TVOC in ppb", height/2 -320, -width/2 + 410);
  } else {
    text("TVOC in ppb", height/2 -320, -width/2 + 390);
  }
  popMatrix();
}






void dottedLine(float x1, float y1, float x2, float yMax) {
  float dx = (x2 - x1)/60;
  if (y1 >= yMax) {
    for (int i = 0; i < 61; i++) {
      point(x1 + i*dx, y1);
    }
  }
}



void Station2_Vergleich() {
  ja_zufrieden.hide();
  messen.hide();
  letzteWiederholen.hide();

  //MesswertSensor2[0] = MesswertSensor[4];
  //MesswertSensor2[1] = MesswertSensor[3];
  //MesswertSensor2[2] = MesswertSensor[2];
  //MesswertSensor2[3] = MesswertSensor[1];
  //MesswertSensor2[4] = MesswertSensor[0];
  MesswertSensor2 = sort(MesswertSensor2);
  for (int i = 0; i < 5; i++) {
    if (MesswertSensor2[i] == MesswertSensor[0]) {
      Reihenfolge_Sensor[i] = "A";
    }
    if (MesswertSensor2[i] == MesswertSensor[1]) {
      Reihenfolge_Sensor[i] = "B";
    }
    if (MesswertSensor2[i] == MesswertSensor[2]) {
      Reihenfolge_Sensor[i] = "C";
    }
    if (MesswertSensor2[i] == MesswertSensor[3]) {
      Reihenfolge_Sensor[i] = "D";
    }
    if (MesswertSensor2[i] == MesswertSensor[4]) {
      Reihenfolge_Sensor[i] = "E";
    }
  }

  textSize(20);

  // text("Hier siehst du die Vorhersage deiner Nase und des Sensors. Vergleiche die Ergebnisse nun mit den wahren Werten. Konntest du\ngegen den Sensor gewinnen?", 20, 100);
  Station2_Aufgabentext_c.show();

  //stroke(0);
  //line(100, 300, 1180, 300);
  //line(100, 400, 1180, 400);
  //line(100, 500, 1180, 500);

  //for (int i = -1; i < 6; i++) {
  //  line(280 + 180*i, 300, 280 + 180*i, 500);
  //}
  stroke(0);
  for (int i = 0; i < 5; i++) {
    fill(255);
    rect(350 + 175*i, 250, 100, 100); 
    rect(350 + 175*i, 385, 100, 100); 
    rect(350 + 175*i, 520, 100, 100);
  }
  fill(0);
  textSize(25);
  text("hohe Konzentration                                           niedrige Konzentration", 300, 200);
  textSize(30);
  textAlign(CENTER);
  text("Riechen\nVersuch 1", 120, 283);
  text("Riechen\nVersuch 2", 120, 420);
  text("Sensor", 120, 580);
  textSize(50);
  textAlign(LEFT);
  text(Reihenfolge[0] + "         " + Reihenfolge[1] + "         " + Reihenfolge[2] + "         " +Reihenfolge[3] + "         " +Reihenfolge[4], 385, 315);
  text(Reihenfolge2[0] + "         " + Reihenfolge2[1] + "         " + Reihenfolge2[2] + "         " +Reihenfolge2[3] + "         " +Reihenfolge2[4], 385, 450);
  text(Reihenfolge_Sensor[0] + "         " + Reihenfolge_Sensor[1] + "          " + Reihenfolge_Sensor[2] + "         " +Reihenfolge_Sensor[3] + "         " +Reihenfolge_Sensor[4], 385, 580);
  zumObermenu.x = 940;
  zumObermenu.y = 660;
  zumObermenu.show();
}
