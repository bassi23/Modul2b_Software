int[] y_scale = {0, 0};
int x_scale = 0;

void Feinstaub() {
  //SPS_check.show();
  two_three.active = false;
  four.active = false;
  one.active = false;
  settings.active = false;

  boolean PM1_left = false;
  boolean PM1_right = false;
  boolean PM2_5_left = false;
  boolean PM2_5_right = false;
  boolean PM4_left = false;
  boolean PM4_right = false;
  boolean PM10_left = false;
  boolean PM10_right = false;

  if (SPS_Rot.name == "PM1") {
    PM1_left = true;
    up1.show();
    down1.show();
  } else if (SPS_Rot.name == "PM2.5") {
    PM2_5_left = true;
    up1.show();
    down1.show();
  } else if (SPS_Rot.name == "PM4") {
    PM4_left = true;
    up1.show();
    down1.show();
  } else if (SPS_Rot.name == "PM10") {
    PM10_left = true;
    up1.show();
    down1.show();
  } else {
    up1.hide();
    down1.hide();
  }

  if (SPS_Blau.name == "PM1") {
    PM1_right = true;
    up2.show();
    down2.show();
  } else if (SPS_Blau.name == "PM2.5") {
    PM2_5_right = true;
    up2.show();
    down2.show();
  } else if (SPS_Blau.name == "PM4") {
    PM4_right = true;
    up2.show();
    down2.show();
  } else if (SPS_Blau.name == "PM10") {
    PM10_right = true;
    up2.show();
    down2.show();
  } else {
    up2.hide();
    down2.hide();
  }


  // Zeichne den Hintergrund
  fill(255);
  stroke(0);
  rect(120, 140, 830, 500);
  fill(230);
  rect(1080, -1, 200, 720);
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

  if (left1.isClicked()) {
    x_scale -= 1;
    if (x_scale < 0) {
      x_scale =  10;
    }
  }

  if (right1.isClicked()) {
    x_scale += 1;
    if (x_scale > 10) {
      x_scale = 0;
    }
  }
  fill(0);

  String intervall = "";
  if (x_scale == 0) {
    intervall = "alle\nMesswerte";
  } else if (x_scale == 1) {
    intervall = "letzte\n60 Sekunden";
  } else if (x_scale == 2) {
    intervall = "letzte\n180 Sekunden";
  } else if (x_scale == 3) {
    intervall = "letzte\n360 Sekunden";
  } else if (x_scale == 4) {
    intervall = "letzte\n12 Minuten";
  } else if (x_scale == 5) {
    intervall = "letzte\n60 Minuten";
  } else if (x_scale == 6) {
    intervall = "letzte\n180 Minuten";
  } else if (x_scale == 7) {
    intervall = "letzte\n360 Minuten";
  } else if (x_scale == 8) {
    intervall = "letzte\n12 Stunden";
  } else if (x_scale == 9) {
    intervall = "letzte\n24 Stunden";
  } else if (x_scale == 10) {
    intervall = "letzte\n72 Stunden";
  }


  if (PM1_left) {
    graph(sps_pm1_data, 0, "Feinstaub PM1 in μg/m³", x_scale, y_scale, true);
  } else if (PM2_5_left) {
    graph(sps_pm25_data, 0, "Feinstaub PM2.5 in μg/m³", x_scale, y_scale, true);
  } else if (PM4_left) {
    graph(sps_pm4_data, 0, "Feinstaub PM4 in μg/m³", x_scale, y_scale, true);
  } else if (PM10_left) {
    graph(sps_pm10_data, 0, "Feinstaub PM10 in μg/m³", x_scale, y_scale, true);
  }

  if (PM1_right) {
    graph(sps_pm1_data, 0, "Feinstaub PM1 in μg/m³", x_scale, y_scale, false);
  } else if (PM2_5_right) {
    graph(sps_pm25_data, 0, "Feinstaub PM2.5 in μg/m³", x_scale, y_scale, false);
  } else if (PM4_right) {
    graph(sps_pm4_data, 0, "Feinstaub PM4 in μg/m³", x_scale, y_scale, false);
  } else if (PM10_right) {
    graph(sps_pm10_data, 0, "Feinstaub PM10 in μg/m³", x_scale, y_scale, false);
  }
  fill(0);
  noStroke();
  textSize(30);
  text("Optionen", 1120, 50);
  fill(240);
  ;
  stroke(0);
  rect(1105, 450, 155, 140);
  rect(1105, 250, 155, 180);
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
  text("Anzeige\nMesswerte", 1185, 280);
  text(intervall, 1185, 390);
  textAlign(CORNER);
  stroke(0);
  if (measure) {
    fill(0, 255, 0);
  } else {
    fill(255, 0, 0);
  }
  ellipse(1098, 125, 20, 20);
  SPS_Rot.show();
  SPS_Blau.show();
  left1.show();
  right1.show();
  reset.show();
  back.show();
  aktualisierung_right.show();
  aktualisierung_left.show();
  start_stopp.show();
  zumObermenu.show();
}




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



float gesamtzeit_station1 = 5;


boolean ersterStart_Station1 = false;

void Station1() {
  two_three.active = false;
  four.active = false;
  one.active = false;
  settings.active = false;
  up1.hide();
  down1.hide();
  up2.hide();
  down2.hide();
  left1.hide();
  right1.hide();
  reset.hide();
  station1_MessungStarten.hide();

  station1_referenz.show();
  station1_trocken.show();
  station1_nass.show();
  aktualisierung_right.hide();
  aktualisierung_left.hide();

  fill(0);
  textSize(20);
  text("Station 1 - Feinstaubmessung", 20, 50);
  text("Miss den Feinstaub, der von einem trockenen und einem nassen Tafelschwamm emittiert wird. Führe auch eine Referenzmessung\nohne Schwamm durch. Jede Messung dauert 3 Minuten und setzt sich aus den folgenden Schritten zusammen:", 20, 100);
  text("-30 Sekunden Einlaufzeit\n-1 Minute Messung mit geschlossenem Deckel\n-1 Minute Messung mit geöffnetem Deckel\n-30 Sekunden Auslaufzeit", 450, 180);
  textSize(30);


  if (station1_referenz_abgeschlossen && station1_trocken_abgeschlossen && station1_nass_abgeschlossen) {
    zur_Auswertung2.show();
  }
  if (station1_referenz_abgeschlossen) {
    haken(250);
  } else {
    kreuz(300);
  }
  if (station1_trocken_abgeschlossen) {
    haken(575);
  } else {
    kreuz(650);
  }
  if (station1_nass_abgeschlossen) {
    haken(950);
  } else {
    kreuz(1000);
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

float time_station1;
void referenzmessung() {
  station1_referenz.hide();
  station1_trocken.hide();
  station1_nass.hide();

  println(zeroTime3);
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

  fill(200, 255, 200, 200);
  rect(120, 140, 138.333333, 500);
  fill(255, 200, 200, 200);
  rect(258.333333, 140, 276.66666666, 500);
  fill(255, 255, 200, 200);
  rect(535, 140, 276.66666666, 500);
  fill(200, 255, 200, 200);
  rect(811.6666666, 140, 138.333333, 500);
  textSize(26);
  fill(170, 220);
  text("Einlaufen", 135, 130);
  text("Deckel schließen", 305, 130);
  text("Deckel öffnen", 600, 130);
  text("Auslaufen", 821, 130);
  textSize(80);
  fill(170, 50);
  text("Referenzmessung", 200, 420);
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

  if (PM1_left) {
    graph(Station1_PM1, 1, "Feinstaub PM1 in μg/m³", x_scale, y_scale, true);
  } else if (PM2_5_left) {
    graph(Station1_PM25, 1, "Feinstaub PM2.5 in μg/m³", x_scale, y_scale, true);
  } else if (PM4_left) {
    graph(Station1_PM4, 1, "Feinstaub PM4 in μg/m³", x_scale, y_scale, true);
  } else if (PM10_left) {
    graph(Station1_PM10, 1, "Feinstaub PM10 in μg/m³", x_scale, y_scale, true);
  }

  if (PM1_right) {
    graph(Station1_PM1, 1, "Feinstaub PM1 in μg/m³", x_scale, y_scale, false);
  } else if (PM2_5_right) {
    graph(Station1_PM25, 1, "Feinstaub PM2.5 in μg/m³", x_scale, y_scale, false);
  } else if (PM4_right) {
    graph(Station1_PM4, 1, "Feinstaub PM4 in μg/m³", x_scale, y_scale, false);
  } else if (PM10_right) {
    graph(Station1_PM10, 1, "Feinstaub PM10 in μg/m³", x_scale, y_scale, false);
  }
  fill(0);
  textSize(20);
  text("0", 115, 660);
  text("30", 245.333333, 660);
  text("90", 525, 660);
  text("150", 796.6666666, 660);
  text("180", 938, 660);



  SPS_Rot_Station1.show();
  SPS_Blau_Station1.show();


  if (!Station1Start && !ersterDurchlauf_Station1_referenz) {
    station1_MessungStarten.show();
  } else {
    station1_MessungStarten.hide();
    station1_MessungWiederholen.show();
    ersterDurchlauf_Station1_referenz = true;
  }

  if (ceil((millis() - time_station1)/1000) > (gesamtzeit_station1-del) && Station1Start) {
    station1_referenz_abgeschlossen = true;
  }

  if (station1_referenz_abgeschlossen) {
    station1_weiter_ab.show();
  }
  
  
  fill(0);
  noStroke();
  textSize(30);
  text("Optionen", 1120, 50);
  fill(240);;
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
  textAlign(CORNER);
  back.show();
  zumObermenu.show();
  aktualisierung_right.show();
  aktualisierung_left.show();
}



boolean ersterDurchlauf_Station1_trocken = false;
boolean ersterDurchlauf_Station1_nass = false;
boolean station1_trocken_abgeschlossen = false;
boolean station1_nass_abgeschlossen = false;


void trockenerSchwamm() {
  station1_referenz.hide();
  station1_trocken.hide();
  station1_nass.hide();
  Sensoren_SPS_Blau.show();
  Sensoren_SPS_Rot.show();
  //Welche Graphen sollen angezeigt werden?
  boolean PM1_left = false;
  boolean PM1_right = false;
  boolean PM2_5_left = false;
  boolean PM2_5_right = false;
  boolean PM4_left = false;
  boolean PM4_right = false;
  boolean PM10_left = false;
  boolean PM10_right = false;
  if (Sensoren_SPS_Rot.getValue() == 1) {
    PM1_left = true;
    up1.show();
    down1.show();
  } else if (Sensoren_SPS_Rot.getValue() == 2) {
    PM2_5_left = true;
    up1.show();
    down1.show();
  } else if (Sensoren_SPS_Rot.getValue() == 3) {
    PM4_left = true;
    up1.show();
    down1.show();
  } else if (Sensoren_SPS_Rot.getValue() == 4) {
    PM10_left = true;
    up1.show();
    down1.show();
  } else {
    up1.hide();
    down1.hide();
  }
  if (Sensoren_SPS_Blau.getValue() == 1) {
    PM1_right = true;
    up2.show();
    down2.show();
  } else if (Sensoren_SPS_Blau.getValue() == 2) {
    PM2_5_right = true;
    up2.show();
    down2.show();
  } else if (Sensoren_SPS_Blau.getValue() == 3) {
    PM4_right = true;
    up2.show();
    down2.show();
  } else if (Sensoren_SPS_Blau.getValue() == 4) {
    PM10_right = true;
    up2.show();
    down2.show();
  } else {
    up2.hide();
    down2.hide();
  }




  if (!Station1Start && !ersterDurchlauf_Station1_trocken) {
    station1_MessungStarten.show();
  } else {
    station1_MessungStarten.hide();
    station1_MessungWiederholen.show();
    ersterDurchlauf_Station1_trocken = true;
  }

  if (ceil((millis() - time_station1)/1000) > (gesamtzeit_station1-del) && Station1Start) {
    station1_trocken_abgeschlossen = true;
  }

  if (station1_trocken_abgeschlossen) {
    station1_weiter_bc.show();
  }




  fill(0);
  textSize(20);
  reset.hide();
  fill(0);
  noStroke();

  // Zeichne den Hintergrund
  fill(255);
  stroke(0);
  rect(175, 100, 930, 500);

  fill(200, 255, 200, 200);
  rect(175, 100, 155, 500);
  fill(255, 200, 200, 200);
  rect(330, 100, 310, 500);
  fill(255, 255, 200, 200);
  rect(640, 100, 310, 500);
  fill(200, 255, 200, 200);
  rect(950, 100, 155, 500);
  textSize(26);
  fill(170, 220);
  text("Einlaufen", 195, 130);
  text("Deckel schließen", 385, 130);
  text("Deckel öffnen", 715, 130);
  text("Auslaufen", 971, 130);
  textSize(80);
  fill(170, 50);
  text("trockener Schwamm", 270, 370);
  stroke(100, 100);
  if (y_scale[0] != 0 || y_scale[1] != 0) {
    for (int i = 0; i < 4; i++) {
      line(175, 200 + 100*i, 1105, 200 + 100*i);
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
  rect(580, 20, 130, 50);

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
  text("0", 170, 635);
  text("30", 310, 635);
  text("90", 630, 635);
  text("150", 920, 635);
  text("180", 1100, 635);
}



void nasserSchwamm() {
  station1_referenz.hide();
  station1_trocken.hide();
  station1_nass.hide();
  Sensoren_SPS_Blau.show();
  Sensoren_SPS_Rot.show();
  //Welche Graphen sollen angezeigt werden?
  boolean PM1_left = false;
  boolean PM1_right = false;
  boolean PM2_5_left = false;
  boolean PM2_5_right = false;
  boolean PM4_left = false;
  boolean PM4_right = false;
  boolean PM10_left = false;
  boolean PM10_right = false;
  if (Sensoren_SPS_Rot.getValue() == 1) {
    PM1_left = true;
    up1.show();
    down1.show();
  } else if (Sensoren_SPS_Rot.getValue() == 2) {
    PM2_5_left = true;
    up1.show();
    down1.show();
  } else if (Sensoren_SPS_Rot.getValue() == 3) {
    PM4_left = true;
    up1.show();
    down1.show();
  } else if (Sensoren_SPS_Rot.getValue() == 4) {
    PM10_left = true;
    up1.show();
    down1.show();
  } else {
    up1.hide();
    down1.hide();
  }
  if (Sensoren_SPS_Blau.getValue() == 1) {
    PM1_right = true;
    up2.show();
    down2.show();
  } else if (Sensoren_SPS_Blau.getValue() == 2) {
    PM2_5_right = true;
    up2.show();
    down2.show();
  } else if (Sensoren_SPS_Blau.getValue() == 3) {
    PM4_right = true;
    up2.show();
    down2.show();
  } else if (Sensoren_SPS_Blau.getValue() == 4) {
    PM10_right = true;
    up2.show();
    down2.show();
  } else {
    up2.hide();
    down2.hide();
  }




  if (!Station1Start && !ersterDurchlauf_Station1_nass) {
    station1_MessungStarten.show();
  } else {
    station1_MessungStarten.hide();
    station1_MessungWiederholen.show();
    ersterDurchlauf_Station1_nass = true;
  }

  if (ceil((millis() - time_station1)/1000) > (gesamtzeit_station1-del) && Station1Start) {
    station1_nass_abgeschlossen = true;
  }

  if (station1_nass_abgeschlossen) {
    station1_zur_Auswertung.show();
  }




  fill(0);
  textSize(20);
  reset.hide();
  fill(0);
  noStroke();

  // Zeichne den Hintergrund
  fill(255);
  stroke(0);
  rect(175, 100, 930, 500);

  fill(200, 255, 200, 200);
  rect(175, 100, 155, 500);
  fill(255, 200, 200, 200);
  rect(330, 100, 310, 500);
  fill(255, 255, 200, 200);
  rect(640, 100, 310, 500);
  fill(200, 255, 200, 200);
  rect(950, 100, 155, 500);
  textSize(26);
  fill(170, 220);
  text("Einlaufen", 195, 130);
  text("Deckel schließen", 385, 130);
  text("Deckel öffnen", 715, 130);
  text("Auslaufen", 971, 130);
  textSize(80);
  fill(170, 50);
  text("nasser Schwamm", 305, 370);
  stroke(100, 100);
  if (y_scale[0] != 0 || y_scale[1] != 0) {
    for (int i = 0; i < 4; i++) {
      line(175, 200 + 100*i, 1105, 200 + 100*i);
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
  rect(580, 20, 130, 50);

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
  text("0", 170, 635);
  text("30", 310, 635);
  text("90", 630, 635);
  text("150", 920, 635);
  text("180", 1100, 635);
}





void Vergleich_Feinstaub() {
  textSize(20);
  text("Auf der nächsten Seite kannst du deine Messwerte analysieren. Beantworte die folgenden Fragen:", 20, 50);
  text("a) Beschreibe die Verläufe deiner drei Messungen der Feinstaubemission\nb) Gab es einen Unterschied zwischen Messungen verschiedener Feinstaubgrößen? Falls ja, wieso?\nc) Welches Fazit ziehst du aus diesem Experiment?", 200, 250);
  zur_Auswertung3.show();
}




void Vergleich_Feinstaub_Graphen() {
  boolean PM25_referenz_rot = false;
  boolean PM10_referenz_rot = false;

  boolean PM25_trocken_rot = false;
  boolean PM10_trocken_rot = false;

  boolean PM25_nass_rot = false;
  boolean PM10_nass_rot = false;

  ///

  boolean PM25_referenz_gruen = false;
  boolean PM10_referenz_gruen = false;

  boolean PM25_trocken_gruen = false;
  boolean PM10_trocken_gruen = false;

  boolean PM25_nass_gruen = false;
  boolean PM10_nass_gruen = false;

  //

  boolean PM25_referenz_blau = false;
  boolean PM10_referenz_blau = false;

  boolean PM25_trocken_blau = false;
  boolean PM10_trocken_blau = false;

  boolean PM25_nass_blau = false;
  boolean PM10_nass_blau = false;


  String rot = SPS_Gruen_Station1_Auswertung.name;
  String gruen = SPS_Gruen_Station1_Auswertung.name;
  String blau = SPS_Blau_Station1_Auswertung.name;

  if (rot == "PM2.5 (Referenz)") {
    PM25_referenz_rot = true;
  } else if (rot == "PM10 (Referenz)") {
    PM10_referenz_rot = true;
  } else if (rot == "PM2.5 (trocken)") {
    PM25_trocken_rot = true;
  } else if (rot == "PM10 (trocken)") {
    PM10_trocken_rot = true;
  } else if (rot == "PM2.5 (nass)") {
    PM25_nass_rot = true;
  } else if (rot == "PM10 (nass)") {
    PM10_nass_rot = true;
  }

  if (blau == "PM2.5 (Referenz)") {
    PM25_referenz_blau = true;
  } else if (blau == "PM10 (Referenz)") {
    PM10_referenz_blau = true;
  } else if (blau == "PM2.5 (trocken)") {
    PM25_trocken_blau = true;
  } else if (blau == "PM10 (trocken)") {
    PM10_trocken_blau = true;
  } else if (blau == "PM2.5 (nass)") {
    PM25_nass_blau = true;
  } else if (blau == "PM10 (nass)") {
    PM10_nass_blau = true;
  }

  if (gruen == "PM2.5 (Referenz)") {
    PM25_referenz_gruen = true;
  } else if (gruen == "PM10 (Referenz)") {
    PM10_referenz_gruen = true;
  } else if (gruen == "PM2.5 (trocken)") {
    PM25_trocken_gruen = true;
  } else if (gruen == "PM10 (trocken)") {
    PM10_trocken_gruen = true;
  } else if (gruen == "PM2.5 (nass)") {
    PM25_nass_gruen = true;
  } else if (gruen == "PM10 (nass)") {
    PM10_nass_gruen = true;
  }



  up1.show();
  down1.show();
  // Zeichne den Hintergrund
  fill(255);
  stroke(0);
  rect(175, 100, 930, 500);

  fill(200, 255, 200, 200);
  rect(175, 100, 155, 500);
  fill(255, 200, 200, 200);
  rect(330, 100, 310, 500);
  fill(255, 255, 200, 200);
  rect(640, 100, 310, 500);
  fill(200, 255, 200, 200);
  rect(950, 100, 155, 500);
  textSize(26);
  fill(170, 220);
  text("Einlaufen", 195, 130);
  text("Deckel schließen", 385, 130);
  text("Deckel öffnen", 715, 130);
  text("Auslaufen", 971, 130);
  stroke(100, 100);
  if (y_scale[0] == 0) {
    y_scale[0] = 1;
  }
  if (y_scale[1] == 0) {
    y_scale[1] = 1;
  }
  if (y_scale[0] != 0 || y_scale[1] != 0) {
    for (int i = 0; i < 4; i++) {
      line(175, 200 + 100*i, 1105, 200 + 100*i);
    }
  }

  if (up1.isClicked()) {
    y_scale[0] += 1;
    y_scale[1] += 1;
    if (y_scale[0] > 4) {
      y_scale[0] = 1;
    }
    if (y_scale[1] > 4) {
      y_scale[1] = 1;
    }
  }

  if (down1.isClicked()) {
    y_scale[0] -= 1;
    y_scale[1] -= 1;
    if (y_scale[0] < 1) {
      y_scale[0] = 4;
    }
    if (y_scale[1] < 1) {
      y_scale[1] = 4;
    }
  }

  if (PM25_referenz_rot) {
    graph2(Station1_PM25, 1, "Feinstaub in µg/m³", 0, y_scale, true, color(255, 0, 0));
  } else if (PM10_referenz_rot) {
    graph2(Station1_PM10, 1, "Feinstaub in µg/m³", 0, y_scale, true, color(255, 0, 0));
  } else if (PM25_trocken_rot) {
    graph2(Station1_PM25_trocken, 2, "Feinstaub in µg/m³", 0, y_scale, true, color(255, 0, 0));
  } else if (PM10_trocken_rot) {
    graph2(Station1_PM10_trocken, 2, "Feinstaub in µg/m³", 0, y_scale, true, color(255, 0, 0));
  } else if (PM25_nass_rot) {
    graph2(Station1_PM25_nass, 3, "Feinstaub in µg/m³", 0, y_scale, true, color(255, 0, 0));
  } else if (PM10_nass_rot) {
    graph2(Station1_PM10_nass, 3, "Feinstaub in µg/m³", 0, y_scale, true, color(255, 0, 0));
  }

  if (PM25_referenz_gruen) {
    graph2(Station1_PM25, 1, "Feinstaub in µg/m³", 0, y_scale, true, color(0, 255, 0));
  } else if (PM10_referenz_gruen) {
    graph2(Station1_PM10, 1, "Feinstaub in µg/m³", 0, y_scale, true, color(0, 255, 0));
  } else if (PM25_trocken_gruen) {
    graph2(Station1_PM25_trocken, 2, "Feinstaub in µg/m³", 0, y_scale, true, color(0, 255, 0));
  } else if (PM10_trocken_gruen) {
    graph2(Station1_PM10_trocken, 2, "Feinstaub in µg/m³", 0, y_scale, true, color(0, 255, 0));
  } else if (PM25_nass_gruen) {
    graph2(Station1_PM25_nass, 3, "Feinstaub in µg/m³", 0, y_scale, true, color(0, 255, 0));
  } else if (PM10_nass_gruen) {
    graph2(Station1_PM10_nass, 3, "Feinstaub in µg/m³", 0, y_scale, true, color(0, 255, 0));
  }


  if (PM25_referenz_blau) {
    graph2(Station1_PM25, 1, "Feinstaub in µg/m³", 0, y_scale, true, color(0, 0, 255));
  } else if (PM10_referenz_blau) {
    graph2(Station1_PM10, 1, "Feinstaub in µg/m³", 0, y_scale, true, color(0, 0, 255));
  } else if (PM25_trocken_blau) {
    graph2(Station1_PM25_trocken, 2, "Feinstaub in µg/m³", 0, y_scale, true, color(0, 0, 255));
  } else if (PM10_trocken_blau) {
    graph2(Station1_PM10_trocken, 2, "Feinstaub in µg/m³", 0, y_scale, true, color(0, 0, 255));
  } else if (PM25_nass_blau) {
    graph2(Station1_PM25_nass, 3, "Feinstaub in µg/m³", 0, y_scale, true, color(0, 0, 255));
  } else if (PM10_nass_blau) {
    graph2(Station1_PM10_nass, 3, "Feinstaub in µg/m³", 0, y_scale, true, color(0, 0, 255));
  }


  fill(0);
  textSize(20);
  text("0", 170, 635);
  text("30", 310, 635);
  text("90", 630, 635);
  text("150", 920, 635);
  text("180", 1100, 635);


  SPS_Gruen_Station1_Auswertung.show();
  SPS_Rot_Station1_Auswertung.show();
  SPS_Blau_Station1_Auswertung.show();
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
