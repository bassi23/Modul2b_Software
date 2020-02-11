int[] y_scale = {0, 0};
int[] y_scale1 = {0, 0};
int[] y_scale2 = {0, 0};
int x_scale = 0;


void onlyTwo(CheckBox check, String state1, String state2, String state3, String state4) {
  boolean st1 = check.getState(state1);
  boolean st2 = check.getState(state2);
  boolean st3 = check.getState(state3);
  boolean st4 = check.getState(state4);

  if (st1 && st2) {
    check.deactivate(state3);
    check.deactivate(state4);
  }
  if (st1 && st3) {
    check.deactivate(state2);
    check.deactivate(state4);
  }
  if (st1 && st4) {
    check.deactivate(state2);
    check.deactivate(state3);
  }
  if (st2 && st3) {
    check.deactivate(state1);
    check.deactivate(state4);
  }
  if (st2 && st4) {
    check.deactivate(state1);
    check.deactivate(state3);
  }
  if (st3 && st4) {
    check.deactivate(state1);
    check.deactivate(state2);
  }
}



float gesamtzeit_station1 = 150;


boolean ersterStart_Station1 = false;

void Station1() {
}






void Feinstaub1() {
  up1.hide();
  down1.hide();
  up2.hide();
  down2.hide();
  left1.hide();
  right1.hide();
  reset.hide();
  station1_MessungStarten.hide();
  aktualisierung_right.hide();
  aktualisierung_left.hide();
  fill(0);
  textSize(20);
  textFont(bold);
  text("Station 4.2 - Kreidestaub", 20, 50);
  textFont(normal);
  text("In diesem Versuch werdet ihr die Feinstaubemission beim Schreiben mit Kreide und anschließendem Wischen untersuchen.", 20, 100);
  Feinstaub_weiter.show();
  imageMode(CENTER);
  image(Aufbau_Feinstaub, 640, 400);
  textAlign(CENTER);
  text("Zwei Kreidearten\nsind zu untersuchen.", 150, 440);
  text("Es soll trocken und nass\ngewischt werden.", 1120, 440);
  stroke(0);

  line(250, 450, 515, 450);
  line(250, 450, 470, 480);

  line(750, 550, 1000, 450);
  line(790, 450, 1000, 450);
  //stroke(0);
  //fill(255);
  //rect(100, 150, 980, 500);
  //fill(0);
  //textSize(40);
  //text("Platzhalter", 550, 300);

  ////////////////// HIER NACH ABSCHLUSS DES VERSUCHS EIN "Zur Auswertung" Button erscheinen lassen!!!!! ///////////////////////////////////////////////////////////
}
void Feinstaub2() {
  fill(0);
  textSize(20);
  textFont(bold);
  text("Station 4.2 - Kreidestaub", 20, 50);
  textFont(normal);
  text("In diesem Versuch werdet ihr die Feinstaubemission beim Schreiben mit Kreide und anschließendem Wischen untersuchen.", 20, 100);


  text("Bevor es losgeht: Fädelt das Board an den Füßen durch die Schlaufen der Tafel.", 20, 160); 
  stroke(0);
  fill(255);
  rect(200, 250, 780, 400);
  fill(0);
  textSize(40);
  text("Platzhalter", 550, 400);
  Feinstaub_weiter.show();
}
void Feinstaub3() {
  textSize(20);
  fill(0);
  text("Der Messvorgang dauert 5 x 30s und sieht für beide Kreidearten folgendermaßen aus.", 20, 50);

  fill(255);
  stroke(0);
  rect(150, 150, 980, 400);
  strokeWeight(3);
  line(150, 570, 1130, 570);
  textAlign(CENTER);
  fill(0);
  for (int i = 0; i < 5; i++) {
    strokeWeight(1);
    line(346 + 196*i, 150, 346 + 196*i, 550); 
    strokeWeight(3);
    line(155 + 196*i, 565, 150 + 196*i, 570);
    line(155 + 196*i, 575, 150 + 196*i, 570);

    line(341 + 196*i, 565, 346 + 196*i, 570);
    line(341 + 196*i, 575, 346 + 196*i, 570);

    text("30 s", 253 + 196*i, 600);
  }

  pushMatrix();
  translate(width/2, height/2);
  rotate(3*PI/2);
  text("Feinstaub PM2.5", height/2 -370, -width/2 + 100);  
  popMatrix();

  pushMatrix();
  translate(width/2, height/2);
  rotate(PI/2);
  text("Feinstaub PM10", -height/2 +370, width/2 - 1170);
  popMatrix();

  textSize(18);
  text("Die Messung beginnt\nmit einer Einlauf-\nphase.\n\nHier ist nichts zu\ntun, außer zu warten.", 250, 300);
  Feinstaub_weiter.show();
}
void Feinstaub4() {
  Feinstaub3();
  textAlign(CENTER);
  textSize(18);
  text("Schreibt anschließend\nmit der Kreide\n''munter drauf los''", 445, 180);
}
void Feinstaub5() {
  Feinstaub4();

  textAlign(CENTER);
  textSize(18);
  text("Dann wird erst\ntrocken gewischt...", 641, 280);
}
void Feinstaub6() {
  Feinstaub5();

  textAlign(CENTER);
  textSize(18);
  text("... ehe noch einmal\nordnentlich\ngekritzelt wird.", 837, 350);
}
void Feinstaub7() {
  Feinstaub6();

  textAlign(CENTER);
  textSize(18);
  text("Schließlich wird die\nTafel nass gewischt.", 1033, 440);
}

void Feinstaub8() {
  Feinstaub7();
  stroke(0, 0, 255);
  // line(100, 100, 1180, 100);
  strokeWeight(4);
  line(100, 100, 290, 100);
  line(1180, 100, 990, 100);
  line(100, 100, 100, 270);

  line(95, 265, 100, 270);
  line(100, 270, 105, 265);

  line(1180, 100, 1180, 270);
  line(1175, 265, 1180, 270);
  line(1180, 270, 1185, 265);
  fill(0);
  textAlign(CENTER);
  textSize(20);
  text("Beachtet noch: Es werden Partikel verschiedener Größe gemessen.", 640, 105);
}


void Feinstaub9() {
  Feinstaub_weiter.show();
  fill(0);
  textSize(20);
  textAlign(CENTER);
  text("Beginnt bitte mit der gewöhnlichen Schulkreide.", 640, 200);
  imageMode(CENTER);
  image(KreideA, 640, 300);
}


void Feinstaub10() {
  Feinstaub_KreideA();
}

void Feinstaub11() {
  Feinstaub_weiter.show();
  
  
}

void Feinstaub12() {
  Feinstaub_weiter.show();
}

void Feinstaub13() {
  Feinstaub_weiter.show();
}






void Feinstaub_Aufgabe2() {
  fill(150, 150, 255, 100);
  noStroke();
  bezierRect(25, 25, 650, 650, 5, 5);
  fill(0);
  Feinstaub_weiter.show();
  fill(0);
  textSize(20);
  textFont(bold);
  textAlign(CENTER);
  text("Aufgabe 2 - Messung der Feinstaubemission", 337.5, 65);
  text("a) Kreidesorte A", 135, 205);
  textFont(normal);
  text("- Klicke auf 'Messung starten'\n- Warte 30 Sekunden (Einlaufzeit)\n- Beschrifte die Tafel für 30 Sekunden mit Kreidesorte A\n- Wische die Tafel für 30 Sekunden mit einem\ntrockenen Schwamm\n- Beschrifte die Tafel für 30 Sekunden\n- Wische die Tafel für 30 Sekunden mit einem nassen\nSchwamm", 337.5, 325);

  image(KreideA, 290, 155);
  textAlign(CORNER);
  text("Miss nun die Feinstaubemission, die bei Beschriftung und\nWischen der Tafel entsteht.\n\n\nIm ersten Versuch arbeiten wir mit Kreidesorte A. Führe die\nfolgenden Schritte auf der nächsten Seite aus:", 50, 115);
  text("Wenn du den Messablauf verinnerlicht hast, klicke auf ‚weiter‘.", 50, 605);
  image(Versuchsaufbau_Feinstaub2, 700, 70);
}


void Feinstaub_KreideA() {
  //Welche Graphen sollen angezeigt werden?
  up1.show();
  down1.show();
  zumObermenu.y = 605;
  up2.show();
  down2.show();


  fill(0);
  textSize(20);
  reset.hide();
  fill(0);
  noStroke();

  // Zeichne den Hintergrund
  fill(255);
  stroke(0);
  rect(145, 165, 780, 450);
  fill(230);
  rect(1080, -1, 200, 720);
  stroke(0, 50);
  textSize(16);
  fill(0);
  textAlign(CENTER);
  text("Einlaufen", 223, 130);
  text("Tafel beschriften", 379, 130);
  text("Tafel wischen\n(trocken)", 535, 125);
  text("Tafel beschriften", 691, 130);
  text("Tafel wischen\n(nass)", 847, 125);
  textAlign(CORNER);
  stroke(100, 100);
  if (y_scale[0] != 0 || y_scale[1] != 0) {
    for (int i = 0; i < 4; i++) {
      line(145, 255 + 90*i, 925, 255 + 90*i);
    }
  }

  if (up1.isClicked()) {
    y_scale[0] += 1;
    if (y_scale[0] > 7) {
      y_scale[0] = 0;
    }
  }

  if (down1.isClicked()) {
    y_scale[0] -= 1;
    if (y_scale[0] < 0) {
      y_scale[0] = 7;
    }
  }

  if (up2.isClicked()) {
    y_scale[1] += 1;
    if (y_scale[1] > 7) {
      y_scale[1] = 0;
    }
  }

  if (down2.isClicked()) {
    y_scale[1] -= 1;
    if (y_scale[1] < 0) {
      y_scale[1] = 7;
    }
  }

  fill(255);
  stroke(0);
  //rect(470, 20, 130, 50);
  image(KreideA, 450, 20);
  rect(1105, 155, 155, 80);



  float maxPM25 = 0;
  float minPM25 = 99999999;

  float maxPM10 = 0;
  float minPM10 = 99999999;
  textSize(16);

  if (indexStation1 > 0) {
    textAlign(LEFT);
    fill(255, 0, 0);
    text("Aktueller Wert: (" + round(Station1_PM25[indexStation1-1]) + " +/- 10 µg/m³)", 145, 50);
    textAlign(RIGHT);
    fill(0, 0, 255);
    text("Aktueller Wert: (" + round(Station1_PM10[indexStation1-1]) + " +/- 10 µg/m³)", 925, 50);
  }
  textAlign(CORNER);
  textSize(20);
  fill(255, 0, 0);
  if (y_scale[0] == 0) {
    maxPM25 = max(Station1_PM25);
    minPM25 = min(Station1_PM25);
    if (maxPM25 != 0) {
      text(nf(maxPM25, 0, 1), 80, 175);
      text(nf(minPM25, 0, 1), 80, 625);
    }
  } else if (y_scale[0] == 1) {
    maxPM25 = 10;
    minPM25 = 0;
  } else if (y_scale[0] == 2) {
    maxPM25 = 50;
    minPM25 = 0;
  } else if (y_scale[0] == 3) {
    maxPM25 = 100;
    minPM25 = 0;
  } else if (y_scale[0] == 4) {
    maxPM25 = 200;
    minPM25 = 0;
  } else if (y_scale[0] == 5) {
    maxPM25 = 500;
    minPM25 = 0;
  } else if (y_scale[0] == 6) {
    maxPM25 = 1000;
    minPM25 = 0;
  } else if (y_scale[0] == 7) {
    maxPM25 = 2000;
    minPM25 = 0;
  }
  fill(0, 0, 255);
  if (y_scale[1] == 0) {
    maxPM10 = max(Station1_PM10);
    minPM10 = min(Station1_PM10);
    if (maxPM10 != 0) {
      text(nf(maxPM10, 0, 1), 960, 175);
      text(nf(minPM10, 0, 1), 960, 625);
    }
  } else if (y_scale[1] == 1) {
    maxPM10 = 10;
    minPM10 = 0;
  } else if (y_scale[1] == 2) {
    maxPM10 = 50;
    minPM10 = 0;
  } else if (y_scale[1] == 3) {
    maxPM10 = 100;
    minPM10 = 0;
  } else if (y_scale[1] == 4) {
    maxPM10 = 200;
    minPM10 = 0;
  } else if (y_scale[1] == 5) {
    maxPM10 = 500;
    minPM10 = 0;
  } else if (y_scale[1] == 6) {
    maxPM10 = 1000;
    minPM10 = 0;
  } else if (y_scale[1] == 7) {
    maxPM10 = 2000;
    minPM10 = 0;
  }


  fill(255, 0, 0);
  if (y_scale[0] != 0) {
    for (int i = 0; i < 6; i++) {
      text(round(i*maxPM25/5), 80, 625- 90*i);
    }
  }
  fill(0, 0, 255);
  if (y_scale[1] != 0) {
    for (int i = 0; i < 6; i++) {
      text(round(i*maxPM10/5), 960, 625- 90*i);
    }
  }


  //rect(145, 165, 780, 450);
  stroke(255, 0, 0);
  strokeWeight(3);
  for (int i = 1; i < 500; i++) {
    if (Station1_PM25[i] != 0) {
      float x1 = 145 + 780*(Station1_zeit[i]-Station1_zeit[0])/150;
      float x2 = 145 + 780*(Station1_zeit[i-1]-Station1_zeit[0])/150;
      float y1 = 615 - 450*(Station1_PM25[i] - minPM25)/(maxPM25 - minPM25);
      float y2 = 615 - 450*(Station1_PM25[i-1] - minPM25)/(maxPM25 - minPM25);

      float e1 = 615 - 615*(Station1_PM25[i] - 10 - minPM25)/(maxPM25-minPM25);
      float e2 = 615- 615*(Station1_PM25[i] + 10 - minPM25)/(maxPM25-minPM25);
      if (x1 >=145 && x2 >= 145 && x1 <= 925 && x2 <= 925 && y1 >=165 && y2 >= 165) {
        strokeWeight(3);
        if (verbinde.checked) {
          line(x1, y1, x2, y2);
        } else {
          line(x2-5, y2, x2+5, y2);
          line(x2, y2-5, x2, y2+5);
        }
        if (fehler.checked) {
          if (e1 < 165) {
            e1 = 165;
          }
          if (e1 > 615) {
            e1 = 615;
          }
          if (e2 < 165) {
            e2 = 165;
          }
          if (e2 > 615) {
            e2 = 615;
          }
          strokeWeight(1);
          line(x1, e1, x1, e2);
          line(x1-2, e1, x1+2, e1);
          line(x1-2, e2, x1+2, e2);
        }
      }
    }
  }


  stroke(0, 0, 255);
  for (int i = 1; i < 500; i++) {
    if (Station1_PM10[i] != 0) {
      float x1 = 145 + 780*(Station1_zeit[i]-Station1_zeit[0])/150;
      float x2 = 145 + 780*(Station1_zeit[i-1]-Station1_zeit[0])/150;
      float y1 = 615 - 450*(Station1_PM10[i] - minPM10)/(maxPM10 - minPM10);
      float y2 = 615 - 450*(Station1_PM10[i-1] - minPM10)/(maxPM10 - minPM10);
      float e1 = 615 - 615*(Station1_PM10[i] - 10 - minPM10)/(maxPM10-minPM10);
      float e2 = 615- 615*(Station1_PM10[i] + 10 - minPM10)/(maxPM10-minPM10);
      if (x1 >=145 && x2 >= 145 && x1 <= 925 && x2 <= 925 && y1 >=165 && y2 >= 165) {
        strokeWeight(3);
        if (verbinde.checked) {
          line(x1, y1, x2, y2);
        } else {
          line(x2-5, y2, x2+5, y2);
          line(x2, y2-5, x2, y2+5);
        }
        if (fehler.checked) {
          if (e1 < 165) {
            e1 = 165;
          }
          if (e1 > 615) {
            e1 = 615;
          }
          if (e2 < 165) {
            e2 = 165;
          }
          if (e2 > 615) {
            e2 = 615;
          }
          strokeWeight(1);
          line(x1, e1, x1, e2);
          line(x1-2, e1, x1+2, e1);
          line(x1-2, e2, x1+2, e2);
        }
      }
    }
  }
  //rect(145, 165, 780, 450);
  fill(255, 200, 200, 50);
  noStroke();
  if (indexStation1 > 0) {
    if ((Station1_zeit[indexStation1-1] -Station1_zeit[0]) < 30) {
      rect(145, 165, 156, 450);
    } else if ((Station1_zeit[indexStation1-1] -Station1_zeit[0])  > 30 && (Station1_zeit[indexStation1-1] -Station1_zeit[0]) < 60) {
      rect(301, 165, 156, 450);
    } else if ((Station1_zeit[indexStation1-1] -Station1_zeit[0])  > 60 && (Station1_zeit[indexStation1-1] -Station1_zeit[0]) < 90) {
      rect(457, 165, 156, 450);
    } else if ((Station1_zeit[indexStation1-1] -Station1_zeit[0])  > 90 && (Station1_zeit[indexStation1-1] -Station1_zeit[0]) < 120) {
      rect(457, 165, 156, 450);
    } else if ((Station1_zeit[indexStation1-1] -Station1_zeit[0])  > 120 && (Station1_zeit[indexStation1-1] -Station1_zeit[0]) < 150) {
      rect(613, 165, 156, 450);
    }
    if ((Station1_zeit[indexStation1-1] -Station1_zeit[0]) > 149) {
      Feinstaub_weiter.show();
    }
  }



  // graphFeinstaub(Station1_PM25, 1, "Feinstaub PM2.5 in μg/m³", x_scale, y_scale, true);
  // graphFeinstaub(Station1_PM10, 1, "Feinstaub PM10 in μg/m³", x_scale, y_scale, false);


  pushMatrix();
  translate(width/2, height/2);
  rotate(3*PI/2);
  fill(255, 0, 0);
  text("Feinstaub PM2.5", height/2 -470, -width/2 + 50);  
  popMatrix();

  pushMatrix();
  translate(width/2, height/2);
  rotate(PI/2);
  fill(0, 0, 255);
  text("Feinstaub PM10", -height/2 +320, width/2 - 1035);
  popMatrix();


  fill(0);
  textSize(20);
  textAlign(CENTER);
  text("0", 145, 660);
  text("30", 301, 660);
  text("60", 455, 660);
  text("90", 615, 660);
  text("120", 766, 660);
  text("150", 925, 660);
  stroke(0);
  // rect(145, 165, 780, 450);
  for (int i = 0; i < 4; i++) {
    line(301 + 156*i, 165, 301 + 156*i, 615);
  }



  textSize(20);
  text("Zeit in Sekunden", 530, 700);
  fill(0);
  textAlign(CENTER);

  textAlign(CORNER);
  two_b.hide();
  two_a.hide();
  Geruchstest.hide();
  if (!Station1Start) {
    station1_MessungStarten.show();
  } else {
    station1_MessungStarten.hide();
    station1_MessungWiederholen.show();
  }


  fill(0);
  noStroke();
  textSize(24);
  text("Optionen", 1120, 30);
  fill(240);
  stroke(0);
  rect(1105, 450, 155, 140);
  fill(0);
  noStroke();
  textSize(20);
  textAlign(CENTER);
  if (del == 0) {
    text("Messintervall", 1185, 480);
    text("Maximum", 1190, 565);
  } else {
    text("Messintervall", 1185, 480);
    text(nf(del, 0, 0) + " s", 1185, 565);
  }
  textSize(15);
  text("Fehlerbalken", 1165, 180);
  text("verbinden", 1165, 220);
  textAlign(CORNER);
  back.show();
  aktualisierung_right.show();
  aktualisierung_left.show();
  verbinde.show();
  fehler.show();

  if (fehler.checked) {
    error_bars.name = "anzeigen";
  } else {
    error_bars.name = "nicht anzeigen";
  }
  if (verbinde.checked) {
    connect.name = "verbinden";
  } else {
    connect.name = "nicht verbinden";
  }
}








void Feinstaub_Aufgabe2b() {
  fill(150, 150, 255, 100);
  noStroke();
  bezierRect(25, 25, 650, 650, 5, 5);
  fill(0);
  textSize(20);
  textFont(bold);
  textAlign(CENTER);
  text("Aufgabe 2 - Messung der Feinstaubemission", 337.5, 65);
  text("b) Kreidesorte B", 135, 205);
  textFont(normal);
  text("- Klicke auf 'Messung starten'\n- Warte 30 Sekunden (Einlaufzeit)\n- Beschrifte die Tafel für 30 Sekunden mit Kreidesorte B\n- Wische die Tafel für 30 Sekunden mit einem\ntrockenen Schwamm\n- Beschrifte die Tafel für 30 Sekunden\n- Wische die Tafel für 30 Sekunden mit einem nassen\nSchwamm", 337.5, 325);

  image(KreideB, 290, 155);
  textAlign(CORNER);
  text("Miss nun die Feinstaubemission, die bei Beschriftung und\nWischen der Tafel entsteht.\n\n\nIm ersten Versuch arbeiten wir mit Kreidesorte B. Führe die\nfolgenden Schritte auf der nächsten Seite aus:", 50, 115);
  text("Wenn du den Messablauf verinnerlicht hast, klicke auf ‚weiter‘.", 50, 605);
  image(Versuchsaufbau_Feinstaub2, 700, 70);
  Feinstaub_weiter.show();
  zumObermenu.hide();
}

void Feinstaub_KreideB() {
  //Welche Graphen sollen angezeigt werden?
  up1.show();
  down1.show();

  up2.show();
  down2.show();

  fill(0);
  textSize(20);
  reset.hide();
  fill(0);
  noStroke();

  // Zeichne den Hintergrund
  fill(255);
  stroke(0);
  rect(120, 140, 830, 500);
  fill(230);
  rect(1080, -1, 200, 720);
  stroke(0, 50);
  textSize(20);
  fill(0);
  textAlign(CENTER);
  text("Einlaufen", 203, 110);
  text("Tafel beschriften", 369, 110);
  text("Tafel wischen\n(trocken)", 535, 100);
  text("Tafel beschriften", 701, 110);
  text("Tafel wischen\n(nass)", 867, 100);
  textAlign(CORNER);
  stroke(100, 100);
  if (y_scale[0] != 0 || y_scale[1] != 0) {
    for (int i = 0; i < 4; i++) {
      line(120, 240 + 100*i, 950, 240 + 100*i);
    }
  }

  if (up1.isClicked()) {
    y_scale[0] += 1;
    if (y_scale[0] > 5) {
      y_scale[0] = 0;
    }
  }

  if (down1.isClicked()) {
    y_scale[0] -= 1;
    if (y_scale[0] < 0) {
      y_scale[0] = 5;
    }
  }

  if (up2.isClicked()) {
    y_scale[1] += 1;
    if (y_scale[1] > 5) {
      y_scale[1] = 0;
    }
  }

  if (down2.isClicked()) {
    y_scale[1] -= 1;
    if (y_scale[1] < 0) {
      y_scale[1] = 5;
    }
  }

  fill(255);
  stroke(0);
  rect(470, 20, 130, 50);
  rect(1105, 155, 155, 80);

  graph(Station1_PM25_trocken, 2, "Feinstaub PM2.5 in μg/m³", x_scale, y_scale, true);
  graph(Station1_PM10_trocken, 2, "Feinstaub PM10 in μg/m³", x_scale, y_scale, false);

  fill(0);
  textSize(20);
  text("0", 115, 660);
  text("30", 281, 660);
  text("60", 447, 660);
  text("90", 613, 660);
  text("120", 779, 660);
  text("150", 945, 660);
  stroke(0);

  for (int i = 0; i < 4; i++) {
    line(286 + 166*i, 140, 286 + 166*i, 640);
  }



  textSize(20);
  text("Zeit in Sekunden", 455, 700);
  fill(0);
  textAlign(CENTER);

  if ((millis() - time_station1)/1000 < gesamtzeit_station1) {
    text(round((millis() - time_station1)/1000) + " s/" + round(gesamtzeit_station1) + " s", 535, 55);
  } else {
    text(round(gesamtzeit_station1) + " s/" + round(gesamtzeit_station1) + " s", 535, 55);
  }
  textAlign(CORNER);



  if (!Station1Start && !ersterDurchlauf_Station1_trocken) {
    station1_MessungStarten.show();
  } else {
    station1_MessungStarten.hide();
    station1_MessungWiederholen.show();
    ersterDurchlauf_Station1_trocken = true;
  }

  if (ceil((millis() - time_station1)/1000) > (gesamtzeit_station1-del + 0.1) && Station1Start) {
    station1_trocken_abgeschlossen = true;
  }
  if (round((millis() - time_station1)/1000) == round(gesamtzeit_station1)) {
    station1_zur_Auswertung.show();
  }

  if (station1_trocken_abgeschlossen) {
    station1_zur_Auswertung.show();
  }













  fill(0);
  noStroke();
  textSize(24);
  text("Optionen", 1120, 30);
  fill(240);
  stroke(0);
  rect(1105, 450, 155, 140);
  fill(0);
  noStroke();
  textSize(20);
  textAlign(CENTER);
  if (del == 0) {
    text("Messintervall", 1185, 480);
    text("Maximum", 1190, 565);
  } else {
    text("Messintervall", 1185, 480);
    text(nf(del, 0, 0) + " s", 1185, 565);
  }
  textSize(15);
  text("Fehlerbalken", 1165, 180);
  text("verbinden", 1165, 220);
  textAlign(CORNER);
  back.show();
  zumObermenu.show();
  aktualisierung_right.show();
  aktualisierung_left.show();
  verbinde.show();
  fehler.show();

  if (fehler.checked) {
    error_bars.name = "anzeigen";
  } else {
    error_bars.name = "nicht anzeigen";
  }
  if (verbinde.checked) {
    connect.name = "verbinden";
  } else {
    connect.name = "nicht verbinden";
  }
}



void haken(float x) {
  strokeWeight(5);
  stroke(0, 255, 0);

  line(x, 510, x + 50, 560);
  line(x + 50, 560, x + 100, 460);
  strokeWeight(1);
}


void kreuz(float x) {
  strokeWeight(5);
  stroke(255, 0, 0);
  line(x - 50, 460, x + 50, 560);
  line(x - 50, 560, x + 50, 460);
  strokeWeight(1);
}


boolean ersterDurchlauf_Station1_referenz = false;
boolean station1_referenz_abgeschlossen = false;

float time_station1 = -999999;


boolean ersterDurchlauf_Station1_trocken = false;
boolean ersterDurchlauf_Station1_nass = false;
boolean station1_trocken_abgeschlossen = false;
boolean station1_nass_abgeschlossen = false;


void trockenerSchwamm() {
  station1_referenz.hide();
  station1_trocken.hide();
  station1_nass.hide();

  //Welche Graphen sollen angezeigt werden?
  boolean PM1_left = false;
  boolean PM1_right = false;
  boolean PM2_5_left = false;
  boolean PM2_5_right = false;
  boolean PM4_left = false;
  boolean PM4_right = false;
  boolean PM10_left = false;
  boolean PM10_right = false;

  if (SPS_Rot_Station1.name == "PM1") {
    PM1_left = true;
    up1.show();
    down1.show();
  } else if (SPS_Rot_Station1.name == "PM2.5") {
    PM2_5_left = true;
    up1.show();
    down1.show();
  } else if (SPS_Rot_Station1.name == "PM4") {
    PM4_left = true;
    up1.show();
    down1.show();
  } else if (SPS_Rot_Station1.name == "PM10") {
    PM10_left = true;
    up1.show();
    down1.show();
  } else {
    up1.hide();
    down1.hide();
  }

  if (SPS_Blau_Station1.name == "PM1") {
    PM1_right = true;
    up2.show();
    down2.show();
  } else if (SPS_Blau_Station1.name == "PM2.5") {
    PM2_5_right = true;
    up2.show();
    down2.show();
  } else if (SPS_Blau_Station1.name == "PM4") {
    PM4_right = true;
    up2.show();
    down2.show();
  } else if (SPS_Blau_Station1.name == "PM10") {
    PM10_right = true;
    up2.show();
    down2.show();
  } else {
    up2.hide();
    down2.hide();
  }


  fill(0);
  textSize(20);
  reset.hide();
  fill(0);
  noStroke();

  // Zeichne den Hintergrund
  fill(255);
  stroke(0);
  rect(120, 140, 830, 500);
  fill(230);
  rect(1080, -1, 200, 720);
  stroke(100, 100);
  if (round((millis() - time_station1)/1000) < 10 && round((millis() - time_station1)/1000) > 0) {
    fill(150, 255, 150);
  } else {
    fill(200, 255, 200, 200);
  }

  rect(120, 140, 103.75, 500);

  if (round((millis() - time_station1)/1000) < 40 && round((millis() - time_station1)/1000) > 9) {
    fill(255, 255, 150);
  } else {
    fill(255, 255, 200, 200);
  }
  rect(223.75, 140, 311.25, 500);

  if (round((millis() - time_station1)/1000) < 70 && round((millis() - time_station1)/1000) > 39) {
    fill(255, 200, 200);
  } else {
    fill(255, 200, 200, 200);
  }


  rect(535, 140, 311.25, 500);
  if (round((millis() - time_station1)/1000) < 80 && round((millis() - time_station1)/1000) > 69) {
    fill(150, 255, 150);
  } else {
    fill(200, 255, 200, 200);
  }

  rect(846.25, 140, 103.75, 500);
  textSize(26);
  if (round((millis() - time_station1)/1000) < 10 && round((millis() - time_station1)/1000) > 0) {
    fill(0);
  } else {
    fill(170, 220);
  }
  textSize(20);
  text("Einlaufen", 125, 130);
  if (round((millis() - time_station1)/1000) < 40 && round((millis() - time_station1)/1000) > 9) {
    fill(0);
  } else {
    fill(170, 220);
  }
  text("Tafel beschriften", 295, 130);
  if (round((millis() - time_station1)/1000) < 70 && round((millis() - time_station1)/1000) > 39) {
    fill(0);
  } else {
    fill(170, 220);
  }
  text("Tafel wischen", 630, 130);
  if (round((millis() - time_station1)/1000) < 80 && round((millis() - time_station1)/1000) > 69) {
    fill(0);
  } else {
    fill(170, 220);
  }
  text("Auslaufen", 850, 130);
  textSize(80);
  fill(170, 50);
  text("trockener Schwamm", 200, 420);
  stroke(100, 100);
  if (y_scale[0] != 0 || y_scale[1] != 0) {
    for (int i = 0; i < 4; i++) {
      line(120, 240 + 100*i, 950, 240 + 100*i);
    }
  }

  if (up1.isClicked()) {
    y_scale[0] += 1;
    if (y_scale[0] > 4) {
      y_scale[0] = 0;
    }
  }

  if (down1.isClicked()) {
    y_scale[0] -= 1;
    if (y_scale[0] < 0) {
      y_scale[0] = 4;
    }
  }

  if (up2.isClicked()) {
    y_scale[1] += 1;
    if (y_scale[1] > 4) {
      y_scale[1] = 0;
    }
  }

  if (down2.isClicked()) {
    y_scale[1] -= 1;
    if (y_scale[1] < 0) {
      y_scale[1] = 4;
    }
  }
  fill(255);
  stroke(0);
  rect(470, 20, 130, 50);
  rect(1105, 155, 155, 80);

  if (PM1_left) {
    graph(Station1_PM1_trocken, 2, "Feinstaub PM1 in μg/m³", x_scale, y_scale, true);
  } else if (PM2_5_left) {
    graph(Station1_PM25_trocken, 2, "Feinstaub PM2.5 in μg/m³", x_scale, y_scale, true);
  } else if (PM4_left) {
    graph(Station1_PM4_trocken, 2, "Feinstaub PM4 in μg/m³", x_scale, y_scale, true);
  } else if (PM10_left) {
    graph(Station1_PM10_trocken, 2, "Feinstaub PM10 in μg/m³", x_scale, y_scale, true);
  }

  if (PM1_right) {
    graph(Station1_PM1_trocken, 2, "Feinstaub PM1 in μg/m³", x_scale, y_scale, false);
  } else if (PM2_5_right) {
    graph(Station1_PM25_trocken, 2, "Feinstaub PM2.5 in μg/m³", x_scale, y_scale, false);
  } else if (PM4_right) {
    graph(Station1_PM4_trocken, 2, "Feinstaub PM4 in μg/m³", x_scale, y_scale, false);
  } else if (PM10_right) {
    graph(Station1_PM10_trocken, 2, "Feinstaub PM10 in μg/m³", x_scale, y_scale, false);
  }
  fill(0);
  textSize(20);
  text("0", 115, 660);
  text("10", 210, 660);
  text("40", 525, 660);
  text("70", 834, 660);
  text("80", 938, 660);



  textSize(20);
  text("Zeit in Sekunden", 455, 700);
  fill(0);
  textAlign(CENTER);

  if ((millis() - time_station1)/1000 < gesamtzeit_station1) {
    text(round((millis() - time_station1)/1000) + " s/" + round(gesamtzeit_station1) + " s", 535, 55);
  } else {
    text(round(gesamtzeit_station1) + " s/" + round(gesamtzeit_station1) + " s", 535, 55);
  }
  textAlign(CORNER);


  SPS_Rot_Station1.show();
  SPS_Blau_Station1.show();


  if (!Station1Start && !ersterDurchlauf_Station1_trocken) {
    station1_MessungStarten.show();
  } else {
    station1_MessungStarten.hide();
    station1_MessungWiederholen.show();
    ersterDurchlauf_Station1_trocken = true;
  }

  if (ceil((millis() - time_station1)/1000) > (gesamtzeit_station1-del + 0.1) && Station1Start) {
    station1_trocken_abgeschlossen = true;
  }

  if (station1_trocken_abgeschlossen) {
    station1_weiter_bc.show();
  }


  fill(0);
  noStroke();
  textSize(24);
  text("Optionen", 1135, 30);
  fill(240);
  stroke(0);
  rect(1105, 450, 155, 140);
  fill(0);
  noStroke();
  textSize(20);
  textAlign(CENTER);
  if (del == 0) {
    text("Messintervall", 1185, 480);
    text("Maximum", 1190, 565);
  } else {
    text("Messintervall", 1185, 480);
    text(nf(del, 0, 0) + " s", 1185, 565);
  }
  textSize(15);
  text("Fehlerbalken", 1165, 180);
  text("verbinden", 1165, 220);
  textAlign(CORNER);
  back.show();
  zumObermenu.show();
  aktualisierung_right.show();
  aktualisierung_left.show();
  verbinde.show();
  fehler.show();

  if (fehler.checked) {
    error_bars.name = "anzeigen";
  } else {
    error_bars.name = "nicht anzeigen";
  }
  if (verbinde.checked) {
    connect.name = "verbinden";
  } else {
    connect.name = "nicht verbinden";
  }
}



void nasserSchwamm() {
  station1_referenz.hide();
  station1_trocken.hide();
  station1_nass.hide();


  //Welche Graphen sollen angezeigt werden?
  boolean PM1_left = false;
  boolean PM1_right = false;
  boolean PM2_5_left = false;
  boolean PM2_5_right = false;
  boolean PM4_left = false;
  boolean PM4_right = false;
  boolean PM10_left = false;
  boolean PM10_right = false;

  if (SPS_Rot_Station1.name == "PM1") {
    PM1_left = true;
    up1.show();
    down1.show();
  } else if (SPS_Rot_Station1.name == "PM2.5") {
    PM2_5_left = true;
    up1.show();
    down1.show();
  } else if (SPS_Rot_Station1.name == "PM4") {
    PM4_left = true;
    up1.show();
    down1.show();
  } else if (SPS_Rot_Station1.name == "PM10") {
    PM10_left = true;
    up1.show();
    down1.show();
  } else {
    up1.hide();
    down1.hide();
  }

  if (SPS_Blau_Station1.name == "PM1") {
    PM1_right = true;
    up2.show();
    down2.show();
  } else if (SPS_Blau_Station1.name == "PM2.5") {
    PM2_5_right = true;
    up2.show();
    down2.show();
  } else if (SPS_Blau_Station1.name == "PM4") {
    PM4_right = true;
    up2.show();
    down2.show();
  } else if (SPS_Blau_Station1.name == "PM10") {
    PM10_right = true;
    up2.show();
    down2.show();
  } else {
    up2.hide();
    down2.hide();
  }


  fill(0);
  textSize(20);
  reset.hide();
  fill(0);
  noStroke();

  // Zeichne den Hintergrund
  fill(255);
  stroke(0);
  rect(120, 140, 830, 500);
  fill(230);
  rect(1080, -1, 200, 720);
  stroke(100, 100);
  if (round((millis() - time_station1)/1000) < 10 && round((millis() - time_station1)/1000) > 0) {
    fill(150, 255, 150);
  } else {
    fill(200, 255, 200, 200);
  }

  rect(120, 140, 103.75, 500);

  if (round((millis() - time_station1)/1000) < 40 && round((millis() - time_station1)/1000) > 9) {
    fill(255, 255, 150);
  } else {
    fill(255, 255, 200, 200);
  }
  rect(223.75, 140, 311.25, 500);

  if (round((millis() - time_station1)/1000) < 70 && round((millis() - time_station1)/1000) > 39) {
    fill(255, 200, 200);
  } else {
    fill(255, 200, 200, 200);
  }


  rect(535, 140, 311.25, 500);
  if (round((millis() - time_station1)/1000) < 80 && round((millis() - time_station1)/1000) > 69) {
    fill(150, 255, 150);
  } else {
    fill(200, 255, 200, 200);
  }

  rect(846.25, 140, 103.75, 500);
  textSize(26);
  if (round((millis() - time_station1)/1000) < 10 && round((millis() - time_station1)/1000) > 0) {
    fill(0);
  } else {
    fill(170, 220);
  }
  textSize(20);
  text("Einlaufen", 125, 130);
  if (round((millis() - time_station1)/1000) < 40 && round((millis() - time_station1)/1000) > 9) {
    fill(0);
  } else {
    fill(170, 220);
  }
  text("Tafel beschriften", 295, 130);
  if (round((millis() - time_station1)/1000) < 70 && round((millis() - time_station1)/1000) > 39) {
    fill(0);
  } else {
    fill(170, 220);
  }
  text("Tafel wischen", 630, 130);
  if (round((millis() - time_station1)/1000) < 80 && round((millis() - time_station1)/1000) > 69) {
    fill(0);
  } else {
    fill(170, 220);
  }
  text("Auslaufen", 850, 130);
  textSize(80);
  fill(170, 50);
  text("nasser Schwamm", 200, 420);
  stroke(100, 100);
  if (y_scale[0] != 0 || y_scale[1] != 0) {
    for (int i = 0; i < 4; i++) {
      line(120, 240 + 100*i, 950, 240 + 100*i);
    }
  }

  if (up1.isClicked()) {
    y_scale[0] += 1;
    if (y_scale[0] > 4) {
      y_scale[0] = 0;
    }
  }

  if (down1.isClicked()) {
    y_scale[0] -= 1;
    if (y_scale[0] < 0) {
      y_scale[0] = 4;
    }
  }

  if (up2.isClicked()) {
    y_scale[1] += 1;
    if (y_scale[1] > 4) {
      y_scale[1] = 0;
    }
  }

  if (down2.isClicked()) {
    y_scale[1] -= 1;
    if (y_scale[1] < 0) {
      y_scale[1] = 4;
    }
  }
  fill(255);
  stroke(0);
  rect(470, 20, 130, 50);
  rect(1105, 155, 155, 80);

  if (PM1_left) {
    graph(Station1_PM1_nass, 3, "Feinstaub PM1 in μg/m³", x_scale, y_scale, true);
  } else if (PM2_5_left) {
    graph(Station1_PM25_nass, 3, "Feinstaub PM2.5 in μg/m³", x_scale, y_scale, true);
  } else if (PM4_left) {
    graph(Station1_PM4_nass, 3, "Feinstaub PM4 in μg/m³", x_scale, y_scale, true);
  } else if (PM10_left) {
    graph(Station1_PM10_nass, 3, "Feinstaub PM10 in μg/m³", x_scale, y_scale, true);
  }

  if (PM1_right) {
    graph(Station1_PM1_nass, 3, "Feinstaub PM1 in μg/m³", x_scale, y_scale, false);
  } else if (PM2_5_right) {
    graph(Station1_PM25_nass, 3, "Feinstaub PM2.5 in μg/m³", x_scale, y_scale, false);
  } else if (PM4_right) {
    graph(Station1_PM4_nass, 3, "Feinstaub PM4 in μg/m³", x_scale, y_scale, false);
  } else if (PM10_right) {
    graph(Station1_PM10_nass, 3, "Feinstaub PM10 in μg/m³", x_scale, y_scale, false);
  }
  fill(0);
  textSize(20);
  text("0", 115, 660);
  text("10", 210, 660);
  text("40", 525, 660);
  text("70", 834, 660);
  text("80", 938, 660);



  textSize(20);
  text("Zeit in Sekunden", 455, 700);
  fill(0);
  textAlign(CENTER);

  if ((millis() - time_station1)/1000 < gesamtzeit_station1) {
    text(round((millis() - time_station1)/1000) + " s/" + round(gesamtzeit_station1) + " s", 535, 55);
  } else {
    text(round(gesamtzeit_station1) + " s/" + round(gesamtzeit_station1) + " s", 535, 55);
  }
  textAlign(CORNER);


  SPS_Rot_Station1.show();
  SPS_Blau_Station1.show();


  if (!Station1Start && !ersterDurchlauf_Station1_nass) {
    station1_MessungStarten.show();
  } else {
    station1_MessungStarten.hide();
    station1_MessungWiederholen.show();
    ersterDurchlauf_Station1_nass = true;
  }

  if (ceil((millis() - time_station1)/1000) > (gesamtzeit_station1-del + 0.1) && Station1Start) {
    station1_nass_abgeschlossen = true;
  }

  if (station1_nass_abgeschlossen) {
    station1_zur_Auswertung.show();
  }


  fill(0);
  noStroke();
  textSize(24);
  text("Optionen", 1135, 30);
  fill(240);
  stroke(0);
  rect(1105, 450, 155, 140);
  fill(0);
  noStroke();
  textSize(20);
  textAlign(CENTER);
  if (del == 0) {
    text("Messintervall", 1185, 480);
    text("Maximum", 1190, 565);
  } else {
    text("Messintervall", 1185, 480);
    text(nf(del, 0, 0) + " s", 1185, 565);
  }
  textSize(15);
  text("Fehlerbalken", 1165, 180);
  text("verbinden", 1165, 220);
  textAlign(CORNER);
  back.show();
  zumObermenu.show();
  aktualisierung_right.show();
  aktualisierung_left.show();
  verbinde.show();
  fehler.show();

  if (fehler.checked) {
    error_bars.name = "anzeigen";
  } else {
    error_bars.name = "nicht anzeigen";
  }
  if (verbinde.checked) {
    connect.name = "verbinden";
  } else {
    connect.name = "nicht verbinden";
  }
}





void Vergleich_Feinstaub() {
  textSize(20);
  text("Auf der nächsten Seite kannst du deine Messwerte analysieren. Beantworte die folgenden Fragen:", 20, 50);
  text("a) Beschreibe die Verläufe deiner drei Messungen der Feinstaubemission\nb) Gab es einen Unterschied zwischen Messungen verschiedener Feinstaubgrößen? Falls ja, wieso?\nc) Welches Fazit ziehst du aus diesem Experiment?", 200, 250);
  zur_Auswertung3.show();
}




void Vergleich_Feinstaub_Graphen() {
  reset.hide();
  zumObermenu.hide();
  up_Feinstaub1.show(); 
  down_Feinstaub1.show();
  up_Feinstaub2.show();  
  down_Feinstaub2.show(); 
  // up1.show();
  // down1.show();
  // Zeichne den Hintergrund

  fill(255);
  stroke(0);
  rect(1100, 30, 100, 50);
  rect(1100, 380, 100, 50);
  noStroke();
  fill(255, 0, 0);
  rect(1110, 35, 15, 15);
  rect(1110, 385, 15, 15);
  textSize(20);
  text("PM 2.5", 1130, 50);
  text("PM 2.5", 1130, 400);
  fill(0, 0, 255);
  text("PM 10", 1130, 75);
  text("PM 10", 1130, 425);
  rect(1110, 60, 15, 15);
  rect(1110, 410, 15, 15);
  fill(255);
  stroke(0);
  rect(340, 30, 600, 300);
  rect(340, 380, 600, 300);



  stroke(100, 100);
  if (y_scale1[0] == 0) {
    y_scale1[0] = 1;
  }
  if (y_scale1[1] == 0) {
    y_scale1[1] = 1;
  }
  if (y_scale1[0] != 0 || y_scale1[1] != 0) {
    for (int i = 0; i < 4; i++) {
      //   line(120, 265 + 125*i, 950, 265 + 125*i);
    }
  }

  if (y_scale2[0] == 0) {
    y_scale2[0] = 1;
  }
  if (y_scale2[1] == 0) {
    y_scale2[1] = 1;
  }
  if (y_scale2[0] != 0 || y_scale2[1] != 0) {
    for (int i = 0; i < 4; i++) {
      //   line(120, 265 + 125*i, 950, 265 + 125*i);
    }
  }

  if (up_Feinstaub1.isClicked()) {
    y_scale1[0] += 1;
    y_scale1[1] += 1;
    if (y_scale1[0] > 7) {
      y_scale1[0] = 1;
    }
    if (y_scale1[1] > 7) {
      y_scale1[1] = 1;
    }
  }

  if (down_Feinstaub1.isClicked()) {
    y_scale1[0] -= 1;
    y_scale1[1] -= 1;
    if (y_scale1[0] < 1) {
      y_scale1[0] = 7;
    }
    if (y_scale1[1] < 1) {
      y_scale1[1] = 7;
    }
  }
  if (up_Feinstaub2.isClicked()) {
    y_scale2[0] += 1;
    y_scale2[1] += 1;
    if (y_scale2[0] > 7) {
      y_scale2[0] = 1;
    }
    if (y_scale2[1] > 7) {
      y_scale2[1] = 1;
    }
  }

  if (down_Feinstaub2.isClicked()) {
    y_scale2[0] -= 1;
    y_scale2[1] -= 1;
    if (y_scale2[0] < 1) {
      y_scale2[0] = 7;
    }
    if (y_scale2[1] < 1) {
      y_scale2[1] = 7;
    }
  }




  graph2(Station1_PM25, 1, "Feinstaub in µg/m³", 0, y_scale1, true, color(255, 0, 0));
  graph2(Station1_PM10, 1, "Feinstaub in µg/m³", 0, y_scale1, true, color(0, 0, 255));

  graph2(Station1_PM25_trocken, 2, "Feinstaub in µg/m³", 0, y_scale2, true, color(255, 0, 0));
  graph2(Station1_PM10_trocken, 2, "Feinstaub in µg/m³", 0, y_scale2, true, color(0, 0, 255));



  //stroke(0);
  //fill(240);
  //rect(1060, 565, 200, 80);

  fill(0);
  textSize(20);
  text("0", 335, 360);
  text("30", 455, 360);
  text("60", 575, 360);
  text("90", 695, 360);
  text("120", 815, 360);
  text("150", 935, 360);


  text("0", 335, 705);
  text("30", 455, 705);
  text("60", 575, 705);
  text("90", 695, 705);
  text("120", 815, 705);
  text("150", 935, 705);

  stroke(100);
  for (int i = 0; i < 4; i++) {
    line(460 + 120*i, 30, 460 + 120*i, 330);
    line(460 + 120*i, 380, 460 + 120*i, 680);
  }
  //textSize(16);
  //text("Fehlerbalken", 1070, 590);
  //text("verbinde", 1070, 630);


  //sFeinstaub.show();
  //sFeinstaub.move();
  //verbinde.show();
  //fehler.show();

  textSize(80);
  fill(100, 50);
  text("Kreide A", 480, 200);
  text("Kreide B", 480, 550);
}




void analyseFeinstaub(float[] array, String string, int index, int posY) {

  float x1 = sFeinstaub.x1-120;
  float x2 = sFeinstaub.x2-120;

  // 1. Schritt: Finde die entsprechenden Array Indizes
  // Es gibt "indexInnenraumluftabc" Daten im Array, die auf 830 Pixel verteilt sind

  float dichteA = float(index)/830;
  // Entsprechender Index zu x1, x2

  int indexX1A = round(x1*dichteA);
  int indexX2A = floor(x2*dichteA);



  // 2. Schritt: Merkmale Maximum, Minimum, Steigung und Mittelwert in diesem Intervall berechnen

  float MaxA = 0;
  float MinA = 99999;
  float MWA = 0;
  float SteigungA = 0;
  float MWA_fuerSteigung = 0;
  if (indexX1A < 0) {
    indexX1A = 0;
  }
  //Merkmale A
  for (int i = indexX1A; i < indexX2A + 1; i++) {
    if (array[i] > MaxA) {
      MaxA = array[i];
    }
    if (array[i] < MinA && array[i] != 0) {
      MinA =  array[i];
    }
    MWA += array[i];

    // Für die Steigung
    MWA_fuerSteigung += array[i];
  }
  MWA = MWA/(indexX2A+ 1 - indexX1A);
  MWA_fuerSteigung = MWA_fuerSteigung/(indexX2A+ 1 - indexX1A);

  float Steigung_Zaehler_A = 0;
  float Steigung_Nenner_A = 0;
  for (int i = indexX1A; i < indexX2A + 1; i++) {
    Steigung_Zaehler_A += (array[i] - MWA_fuerSteigung)*(array[i] - MWA);
    Steigung_Nenner_A += (array[i] - MWA_fuerSteigung)*(array[i] - MWA_fuerSteigung);
  }
  SteigungA = Steigung_Zaehler_A/Steigung_Nenner_A;

  stroke(0);
  if (posY == 0) {
    fill(255, 100, 100, 100);
    stroke(0);
    rect(1040, 100, 220, 25);
    fill(255);
    rect(1040, 125, 220, 115);
  } else if (posY == 1) {
    fill(100, 255, 100, 100);
    rect(1040, 250, 220, 25);
    fill(255);

    rect(1040, 275, 220, 115);
  } else if (posY == 2) {
    fill(100, 100, 255, 100);
    rect(1040, 400, 220, 25);
    fill(255);
    rect(1040, 425, 220, 115);
  }

  //fill(0);
  //stroke(0);
  //line(1060, 125, 1260, 125);
  //line(1060, 275, 1260, 275);
  //line(1060, 425, 1260, 425);

  noStroke();
  fill(0);
  String Einheit = "µg/m³";

  textSize(16);
  textAlign(CENTER);
  text(string, 1150, 120 + 150*posY);


  text("Maximum: " + nf(MaxA, 0, 1) + " in " + Einheit, 1150, 150 + 150*posY);
  text("Minimum: " + nf(MinA, 0, 1) + " in " + Einheit, 1150, 175+ 150*posY);
  text("Mittelwert: " + nf(MWA, 0, 1) + " in " + Einheit, 1150, 200+ 150*posY);
  text("Steigung: " + nf(SteigungA, 0, 1) + " in " + Einheit + "s", 1150, 225+ 150*posY);

  textAlign(CORNER);
}






void onlyOne(CheckBox check, String state1, String state2, String state3, String state4) {
  boolean st1 = check.getState(state1);
  boolean st2 = check.getState(state2);
  boolean st3 = check.getState(state3);
  boolean st4 = check.getState(state4);
  if (st1) {
    check.deactivate(state2);
    check.deactivate(state3);
    check.deactivate(state4);
  }
  if (st2) {
    check.deactivate(state1);
    check.deactivate(state3);
    check.deactivate(state4);
  }
  if (st3) {
    check.deactivate(state1);
    check.deactivate(state2);
    check.deactivate(state4);
  }
  if (st4) {
    check.deactivate(state1);
    check.deactivate(state2);
    check.deactivate(state3);
  }
}
