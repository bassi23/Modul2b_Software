String[] Reihenfolge = {"A", "B", "C", "D", "E"};
String[] Reihenfolge_Sensor = {"A", "B", "C", "D", "E"};
float[] Position = {0, 0, 0, 0, 0};

void MenschSensor() {
  one.active = false;
  two.active = false;
  three.active = false;
  four.active = false;
  two_three.active = false;
  onlyOneProbe();
  fill(0);
  textSize(20);
  text("Station 2 - Mensch vs. Sensor", 20, 50);
  text("Nimm dir die 5 Proben des verdünnten Ethanols und rieche daran. Ordne sie der Konzentration nach und notiere dir dir Reihen-\nfolge.\n\nKlicke anschließend auf 'Sensormessung' und lasse den Sensor an den Proben 'riechen'.", 20, 100);
  stroke(0);
  line(0, 200, 1280, 200);


  noStroke();
  textSize(30);
  text("Konzentration in Probe", 490, 300);
  reihenfolge();
  fill(0);
  textSize(40);
  for (int i = 0; i < 4; i++) {
    text(">", 415 + 150*i, 410);
  }
  fill(255);
  for (int i = 0; i < 5; i++) {
    rect(300 + 150*i, 350, 110, 100);
  }
  A.show();
  B.show();
  C.show();
  D.show();
  E.show();
  if (A.inPlace && B.inPlace && C.inPlace && D.inPlace && E.inPlace) {
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
    fill(200);
    stroke(0);
    rect(x-50, y - 50, 100, 100);
    fill(0);
    text(text, x-15, y+15);
    if (this.y > 350 && this.y < 450 && this.x > 300 && this.x < 1000) {
      this.inPlace = true;
    } else {
      this.inPlace = false;
    }
    if (this.isOver() && mousePressed && this.active) {
      this.x = mouseX;
      this.y = mouseY;
    }
  }
  void hide() {
    this.active = false;
    this.inPlace = true;
  }
  boolean isOver() {
    if (mouseX > x - 50 && mouseX  < x + 50 && mouseY > y - 50 && mouseY < y + 50) {
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
    if (x < e.x) {
      return -1;
    } else {
      return 1;
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
}



void reihenfolge() {
  Position[0] = A.x;
  Position[1] = B.x;
  Position[2] = C.x;
  Position[3] = D.x;
  Position[4] = E.x;
  Position = sort(Position);
  for (int i = 0; i < 5; i++) {
    if (Position[i] == A.x) {
      Reihenfolge[i] = "A";
    }
    if (Position[i] == B.x) {
      Reihenfolge[i] = "B";
    }
    if (Position[i] == C.x) {
      Reihenfolge[i] = "C";
    }
    if (Position[i] == D.x) {
      Reihenfolge[i] = "D";
    }
    if (Position[i] == E.x) {
      Reihenfolge[i] = "E";
    }
  }
}


float[] MesswertSensor = {0, 0, 0, 0, 0};
float[] MesswertSensor2 = {0, 0, 0, 0, 0};
float currentTime = -100000;
int prob = 0;

float[][] MenschSensorMesswerte = new float[5][500];
int indexMenschSensorMax = 0;

int indexMenschSensor = 0;
boolean MenschSensorMessen = false;

int scale_MenschSensor = 0;

void Station2_Sensor() {
  A.hide();
  B.hide();
  C.hide();
  D.hide();
  E.hide();
  reset_Station2.show();
  up2.show();
  down2.show();

  if (up2.isClicked()) {
    scale_MenschSensor += 1;
    if (scale_MenschSensor > 8) {
      scale_MenschSensor = 0;
    }
  }

  if (down2.isClicked()) {
    scale_MenschSensor -= 1;
    if (scale_MenschSensor < 0) {
      scale_MenschSensor = 8;
    }
  }
  textSize(20);
  text("Deine Reihenfolge: " + Reihenfolge[0] + " > " + Reihenfolge[1] + " > " + Reihenfolge[2] + " > " +Reihenfolge[3] + " > " +Reihenfolge[4], 50, 50);
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
  textSize(25);
  if ((millis() - currentTime)/1000 > 60) {
    MenschSensorMessen = false;
    if (prob != 5) {
      text("Schraube Probe " + temp + " an die Platine und klicke anschließend auf 'Messen'.", 20, 120);
      messen.show();
    }
    letzteWiederholen.show();
  } else {
    messen.hide();
    letzteWiederholen.hide();
  }

  if (messen.isClicked()) {
    currentTime = millis();
    indexMenschSensor = 0;
    MenschSensorMessen = true;
    if (prob < 5) {
      prob += 1;
    }
  }


  if (MenschSensorMessen) {
    if (prob == 1) {
      MesswertSensor[0] = 0;
      for (int i = 0; i < indexMenschSensor; i++) {
        MesswertSensor[0] += MenschSensorMesswerte[0][i];
      }
      MesswertSensor[0] = MesswertSensor[0]/indexMenschSensor;
    } else if (prob == 2) {
      MesswertSensor[1] = 0;
      for (int i = 0; i < indexMenschSensor; i++) {
        MesswertSensor[1] += MenschSensorMesswerte[1][i];
      }
      MesswertSensor[1] = MesswertSensor[1]/indexMenschSensor;
    } else if (prob == 3) {
      MesswertSensor[2] = 0;
      for (int i = 0; i < indexMenschSensor; i++) {
        MesswertSensor[2] += MenschSensorMesswerte[2][i];
      }
      MesswertSensor[2] = MesswertSensor[2]/indexMenschSensor;
    } else if (prob == 4) {
      MesswertSensor[3] = 0;
      for (int i = 0; i < indexMenschSensor; i++) {
        MesswertSensor[3] += MenschSensorMesswerte[3][i];
      }
      MesswertSensor[3] = MesswertSensor[3]/indexMenschSensor;
    } else if (prob == 5) {
      MesswertSensor[4] = 0;
      for (int i = 0; i < indexMenschSensor; i++) {
        MesswertSensor[4] += MenschSensorMesswerte[4][i];
      }
      MesswertSensor[4] = MesswertSensor[4]/indexMenschSensor;
    }
  }
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
    if ((millis() - currentTime)/1000 > 60) {
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
  rect(10, 240, 440, 310);
  rect(500, 190, 700, 400);
  fill(0);
  textAlign(CENTER);
  for (int i = 0; i < 5; i++) {
    text(nf(MesswertSensor[i], 0, 1), 280, 335 + 50*i);
  }
  textAlign(CORNER);
  text("A", 60, 335);
  text("B", 60, 385);
  text("C", 60, 435);
  text("D", 60, 485);
  text("E", 60, 535);

  text("Probe", 40, 290); 
  text("   Durchschnittliche\nKonzentration in ppb", 150, 265);
  text("Zeit in Sekunden", 750, 660);
  if (prob == 1) {
    if ((millis() - currentTime)/1000 < 60) {
      text(nf((millis() - currentTime)/1000, 0, 1), 1200, 630);

      float zeitTemp = (millis() - currentTime)/1000;
      float dZeitTemp = 700/zeitTemp;

      for (int i = 5; i < 60; i+= 5) {
        strokeWeight(1);
        if (490 + i*dZeitTemp < 1200 && i%10 == 0) {
          text(i, 490 + i*dZeitTemp, 620);
        }
        if (zeitTemp > i) {
          strokeWeight(2);
          if (i % 10 == 0) {
            stroke(0);
          } else {
            stroke(200);
          }
          line(500 + i*dZeitTemp, 190, 500 + i*dZeitTemp, 590);
        }
        strokeWeight(1);
      }
    } else {
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
  line(10, 310, 450, 310);
  line(130, 240, 130, 550);

  for (int i = 0; i < 4; i++) {
    line(10, 350 + 50*i, 450, 350 + 50*i);
  }

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
    max = 20000;
  } else if (scale_MenschSensor == 7) {
    max = 30000;
  } else {
    max = 60000;
  }
  noStroke();
  text(nf(round(max), 0, 0), 420, 200);
  text("0", 470, 590);
  text("0", 475, 630);

  for (int i = 0; i < 5; i++) {
    for (int j = 0; j < 500; j++) {
      if (MenschSensorMesswerte[i][j] != 0 && j > indexMenschSensorMax) {
        indexMenschSensorMax = j + 1;
      }
    }
  }

  if (scale_MenschSensor > 0) {
    for (int i = 0; i < 4; i++) {
      stroke(200);
      line(500, 270 + 80*i, 1200, 270 + 80*i);
    }
  }
  strokeWeight(4);
  for (int j = 0; j < 5; j++) {
    for (int i = 1; i < indexMenschSensorMax; i++) {
      float x1 = 500 + i*700/(indexMenschSensorMax-1); 
      float x2 = 500 + (i-1)*700/(indexMenschSensorMax-1);
      float y1 = 590 - MenschSensorMesswerte[j][i]*400/max;
      float y2 = 590 - MenschSensorMesswerte[j][i-1]*400/max;
      noFill();
      if (j == 0) {
        stroke(255, 0, 0);
      } else if (j == 1) {
        stroke(0, 0, 255);
      } else if (j == 2) {
        stroke(255, 0, 255);
      } else if (j == 3) {
        stroke(0, 155, 0);
      } else if (j == 4) {
        stroke(0);
      }
      float m = ((y2 - y1)/(x2 - x1));
      if (x1 < 500) {
        y2 = m*175 + y1 - m*x1;
      }
      if (y2 < 190) {
        y2 = 190;
        x2 = (190 + m*x1 - y1)/m;
      }
      if (y1 < 190) {
        y1 = 190;
        x1 = (190 + m*x2 - y2)/m;
      }

      if (y1 >= 190 && y2 >= 190 && x2 >= 500 && x1 <= 1200 && x2 <= 1200) {
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

  if (ja_zufrieden.isClicked()) {
    page = 2.11;
  }
  strokeWeight(1);
}






void dottedLine(float x1, float y1, float x2, float yMax) {
  float dx = (x2 - x1)/60;
  if (y1 >= yMax) {
    for (int i = 0; i < 61; i++) {
      point(x1 + i*dx, y1);
    }
  }
}



void  Station2_Vergleich() {
  ja_zufrieden.hide();
  messen.hide();
  letzteWiederholen.hide();

  MesswertSensor2[0] = MesswertSensor[4];
  MesswertSensor2[1] = MesswertSensor[3];
  MesswertSensor2[2] = MesswertSensor[2];
  MesswertSensor2[3] = MesswertSensor[1];
  MesswertSensor2[4] = MesswertSensor[0];
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
  text("Hier siehst du die Vorhersage deiner Nase und des Sensors. Vergleiche die Ergebnisse nun mit den wahren Werten. Konntest du\ngegen den Sensor gewinnen?", 20, 100);


  stroke(0);
  line(100, 300, 1180, 300);
  line(100, 400, 1180, 400);
  line(100, 500, 1180, 500);

  for (int i = -1; i < 6; i++) {
    line(280 + 180*i, 300, 280 + 180*i, 500);
  }
  textSize(25);
  text("hohe Konzentration                                           niedrige Konzentration", 300, 250);
  textSize(30);
  text("    Deine\nReihenfolge", 106, 333);
  text("Sensor", 140, 460);
  textSize(50);
  text(Reihenfolge[0] + "         " + Reihenfolge[1] + "          " + Reihenfolge[2] + "         " +Reihenfolge[3] + "         " +Reihenfolge[4], 350, 365);
  text(Reihenfolge_Sensor[0] + "         " + Reihenfolge_Sensor[1] + "          " + Reihenfolge_Sensor[2] + "         " +Reihenfolge_Sensor[3] + "         " +Reihenfolge_Sensor[4], 350, 465);
  zumObermenu.x = 1000;
  zumObermenu.show();
}
