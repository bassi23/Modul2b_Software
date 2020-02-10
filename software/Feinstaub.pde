int[] y_scale = {0, 0};
int[] y_scale1 = {0, 0};
int[] y_scale2 = {0, 0};
int x_scale = 0;

//void Feinstaub() {
//  //SPS_check.show();
//  two_three.active = false;
//  four.active = false;
//  one.active = false;
//  settings.active = false;
//  reset.hide();

//  boolean PM1_left = false;
//  boolean PM1_right = false;
//  boolean PM2_5_left = false;
//  boolean PM2_5_right = false;
//  boolean PM4_left = false;
//  boolean PM4_right = false;
//  boolean PM10_left = false;
//  boolean PM10_right = false;

//  if (SPS_Rot.name == "PM1") {
//    PM1_left = true;
//    up1.show();
//    down1.show();
//  } else if (SPS_Rot.name == "PM2.5") {
//    PM2_5_left = true;
//    up1.show();
//    down1.show();
//  } else if (SPS_Rot.name == "PM4") {
//    PM4_left = true;
//    up1.show();
//    down1.show();
//  } else if (SPS_Rot.name == "PM10") {
//    PM10_left = true;
//    up1.show();
//    down1.show();
//  } else {
//    up1.hide();
//    down1.hide();
//  }

//  if (SPS_Blau.name == "PM1") {
//    PM1_right = true;
//    up2.show();
//    down2.show();
//  } else if (SPS_Blau.name == "PM2.5") {
//    PM2_5_right = true;
//    up2.show();
//    down2.show();
//  } else if (SPS_Blau.name == "PM4") {
//    PM4_right = true;
//    up2.show();
//    down2.show();
//  } else if (SPS_Blau.name == "PM10") {
//    PM10_right = true;
//    up2.show();
//    down2.show();
//  } else {
//    up2.hide();
//    down2.hide();
//  }


//  // Zeichne den Hintergrund
//  fill(255);
//  stroke(0);
//  rect(120, 140, 830, 500);
//  fill(230);
//  rect(1080, -1, 200, 720);
//  stroke(100, 100);

//  if (y_scale[0] != 0 || y_scale[1] != 0) {
//    for (int i = 0; i < 4; i++) {
//      line(120, 240 + 100*i, 950, 240 + 100*i);
//    }
//  }
//  if (up1.isClicked()) {
//    y_scale[0] += 1;
//    if (y_scale[0] > 4) {
//      y_scale[0] = 0;
//    }
//  }

//  if (down1.isClicked()) {
//    y_scale[0] -= 1;
//    if (y_scale[0] < 0) {
//      y_scale[0] = 4;
//    }
//  }

//  if (up2.isClicked()) {
//    y_scale[1] += 1;
//    if (y_scale[1] > 4) {
//      y_scale[1] = 0;
//    }
//  }

//  if (down2.isClicked()) {
//    y_scale[1] -= 1;
//    if (y_scale[1] < 0) {
//      y_scale[1] = 4;
//    }
//  }

//  if (left1.isClicked()) {
//    x_scale -= 1;
//    if (x_scale < 0) {
//      x_scale =  10;
//    }
//  }

//  if (right1.isClicked()) {
//    x_scale += 1;
//    if (x_scale > 10) {
//      x_scale = 0;
//    }
//  }
//  fill(0);

//  String intervall = "";
//  if (x_scale == 0) {
//    intervall = "alle\nMesswerte";
//  } else if (x_scale == 1) {
//    intervall = "letzte\n60 Sekunden";
//  } else if (x_scale == 2) {
//    intervall = "letzte\n180 Sekunden";
//  } else if (x_scale == 3) {
//    intervall = "letzte\n360 Sekunden";
//  } else if (x_scale == 4) {
//    intervall = "letzte\n12 Minuten";
//  } else if (x_scale == 5) {
//    intervall = "letzte\n60 Minuten";
//  } else if (x_scale == 6) {
//    intervall = "letzte\n180 Minuten";
//  } else if (x_scale == 7) {
//    intervall = "letzte\n360 Minuten";
//  } else if (x_scale == 8) {
//    intervall = "letzte\n12 Stunden";
//  } else if (x_scale == 9) {
//    intervall = "letzte\n24 Stunden";
//  } else if (x_scale == 10) {
//    intervall = "letzte\n72 Stunden";
//  }


//  if (PM1_left) {
//    graph(sps_pm1_data, 0, "Feinstaub PM1 in μg/m³", x_scale, y_scale, true);
//  } else if (PM2_5_left) {
//    graph(sps_pm25_data, 0, "Feinstaub PM2.5 in μg/m³", x_scale, y_scale, true);
//  } else if (PM4_left) {
//    graph(sps_pm4_data, 0, "Feinstaub PM4 in μg/m³", x_scale, y_scale, true);
//  } else if (PM10_left) {
//    graph(sps_pm10_data, 0, "Feinstaub PM10 in μg/m³", x_scale, y_scale, true);
//  }

//  if (PM1_right) {
//    graph(sps_pm1_data, 0, "Feinstaub PM1 in μg/m³", x_scale, y_scale, false);
//  } else if (PM2_5_right) {
//    graph(sps_pm25_data, 0, "Feinstaub PM2.5 in μg/m³", x_scale, y_scale, false);
//  } else if (PM4_right) {
//    graph(sps_pm4_data, 0, "Feinstaub PM4 in μg/m³", x_scale, y_scale, false);
//  } else if (PM10_right) {
//    graph(sps_pm10_data, 0, "Feinstaub PM10 in μg/m³", x_scale, y_scale, false);
//  }
//  fill(0);
//  noStroke();
//  textSize(24);
//  text("Optionen", 1130, 22);
//  fill(240);

//  stroke(0);
//  rect(1105, 445, 155, 140);
//  rect(1105, 250, 155, 180);
//  rect(1105, 155, 155, 80);
//  fill(0);
//  noStroke();
//  textSize(20);
//  textAlign(CENTER);
//  if (del == 0) {
//    text("Messintervall", 1185, 480);
//    text("Maximum", 1190, 565);
//  } else {
//    text("Messintervall", 1185, 480);
//    text(nf(del, 0, 0) + " s", 1185, 565);
//  }
//  text("Anzeige\nMesswerte", 1185, 280);
//  text(intervall, 1185, 390);
//  textSize(15);
//  text("Fehlerbalken", 1165, 180);
//  text("verbinden", 1165, 220);
//  textAlign(CORNER);
//  stroke(0);
//  if (measure) {
//    fill(0, 255, 0);
//  } else {
//    fill(255, 0, 0);
//  }
//  ellipse(1098, 125, 20, 20);
//  SPS_Rot.show();
//  SPS_Blau.show();
//  left1.show();
//  right1.show();
//  reset.show();
//  back.show();
//  aktualisierung_right.show();
//  aktualisierung_left.show();
//  start_stopp.show();
//  zumObermenu.show();
//  verbinde.show();
//  fehler.show();

//  if (fehler.checked) {
//    error_bars.name = "anzeigen";
//  } else {
//    error_bars.name = "nicht anzeigen";
//  }
//  if (verbinde.checked) {
//    connect.name = "verbinden";
//  } else {
//    connect.name = "nicht verbinden";
//  }
//}




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
  // 1. Box mit abgerundeten Ecken
  fill(150, 150, 255, 100);
  noStroke();
  bezierRect(25, 200, 500, 450, 5, 5);
  fill(0);

  fill(0);
  textSize(20);
  textFont(bold);
  text("Station 4.2 - Feinstaubmessung", 20, 50);
  text("Aufgabe 1 - Versuchsaufbau", 120, 240);
  textFont(normal);
  text("Für diesen Versuch benötigst du:\n\n- Sensorboard\n- Tafel\n- Kreidesorten A und B\n- Zwei Schwämme (feucht und trocken)\n\nBefestige das Board, an der Tafel.\nAchte dabei darauf, dass die Öffnung des Fein-\nstaubsensors in Richtung der Tafel zeigt.\n\n          Klicke anschließend auf ‚weiter‘.", 50, 290);
  Station1_Aufgabentext.show();
  // Station1_Aufgabentext2.show();
  //image(Versuchsaufbau_Feinstaub, 600, 200);
  Feinstaub_weiter.show();


  image(Board, 570, 200);
  image(KreideA, 900, 620);
  image(KreideB, 900, 550);
  image(Tafel, 900, 200);
  image(Schwaemme, 570, 525);

  text("Sensorboard", 650, 185);
  text("Tafel", 980, 185);
  text("Schwämme", 650, 520);
  text("Kreide A", 970, 705);
  text("Kreide B", 1000, 535);
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

  graph(Station1_PM25, 1, "Feinstaub PM2.5 in μg/m³", x_scale, y_scale, true);
  graph(Station1_PM10, 1, "Feinstaub PM10 in μg/m³", x_scale, y_scale, false);

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

  if (!Station1Start && !ersterDurchlauf_Station1_referenz) {
    station1_MessungStarten.show();
  } else {
    station1_MessungStarten.hide();
    station1_MessungWiederholen.show();
    ersterDurchlauf_Station1_referenz = true;
  }

  if (ceil((millis() - time_station1)/1000) > (gesamtzeit_station1-del + 0.1) && Station1Start) {
    station1_referenz_abgeschlossen = true;
  }

  if (ceil((millis() - time_station1)/1000) > (gesamtzeit_station1 - 2)) {
    station1_weiter_ab.show();
  }

  if (station1_referenz_abgeschlossen) {
    station1_weiter_ab.show();
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
