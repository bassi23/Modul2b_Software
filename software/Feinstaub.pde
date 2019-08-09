int[] y_scale = {0, 0};
int x_scale = 0;

void Feinstaub() {
  //SPS_check.show();
  two_three.active = false;
  four.active = false;
  one.active = false;
  settings.active = false;
  left1.show();
  right1.show();
  reset.show();
  Sensoren_SPS_Rot.show();
  Sensoren_SPS_Blau.show(); 
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


  aktualisierung_right.show();
  aktualisierung_left.show();
  fill(0);
  noStroke();

  if (del == 0) {
    text("Aktualisierungsintervall: Maximum", 220, 692);
  } else {
    text("Aktualisierungsintervall: " + nf(del, 0, 0) + " s", 220, 692);
  }

  // Zeichne den Hintergrund
  fill(255);
  stroke(0);
  rect(175, 100, 930, 500);
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
    intervall = "Zeige alle Messwerte";
  } else if (x_scale == 1) {
    intervall = "Zeige die letzen 60 Sekunden";
  } else if (x_scale == 2) {
    intervall = "Zeige die letzen 180 Sekunden";
  } else if (x_scale == 3) {
    intervall = "Zeige die letzen 360 Sekunden";
  } else if (x_scale == 4) {
    intervall = "Zeige die letzen 12 Minuten";
  } else if (x_scale == 5) {
    intervall = "Zeige die letzen 60 Minuten";
  } else if (x_scale == 6) {
    intervall = "Zeige die letzen 180 Minuten";
  } else if (x_scale == 7) {
    intervall = "Zeige die letzen 360 Minuten";
  } else if (x_scale == 8) {
    intervall = "Zeige die letzen 12 Stunden";
  } else if (x_scale == 9) {
    intervall = "Zeige die letzen 24 Stunden";
  } else if (x_scale == 10) {
    intervall = "Zeige die letzen 72 Stunden";
  }
  text(intervall, 740, 690);

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
  textSize(24);
  text("Links", 275, 50);
  text("Rechts", 750, 50);
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



float gesamtzeit_station1 = 10;


boolean ersterStart_Station1 = false;

void Station1() {
  SPS_check.hide();
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
  text("Referenzmessung", 295, 370);
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
  textSize(24);
  text("Links", 275, 50);
  text("Rechts", 750, 50);
  textSize(20);
  text("0", 170, 635);
  text("30", 310, 635);
  text("90", 630, 635);
  text("150", 920, 635);
  text("180", 1100, 635);
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
  textSize(24);
  text("Links", 275, 50);
  text("Rechts", 750, 50);
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
  textSize(24);
  text("Links", 275, 50);
  text("Rechts", 750, 50);
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

  Sensoren_SPS_Rot_Station1.hide();
  Sensoren_SPS_Blau_Station1.hide();
  Sensoren_SPS_Gruen_Station1.hide();
}




void Vergleich_Feinstaub_Graphen() {

  Sensoren_SPS_Rot_Station1.show();
  Sensoren_SPS_Blau_Station1.show();
  Sensoren_SPS_Gruen_Station1.show();











  boolean PM1_referenz_rot = false;
  boolean PM25_referenz_rot = false;
  boolean PM4_referenz_rot = false;
  boolean PM10_referenz_rot = false;

  boolean PM1_trocken_rot = false;
  boolean PM25_trocken_rot = false;
  boolean PM4_trocken_rot = false;
  boolean PM10_trocken_rot = false;

  boolean PM1_nass_rot = false;
  boolean PM25_nass_rot = false;
  boolean PM4_nass_rot = false;
  boolean PM10_nass_rot = false;

  ///

  boolean PM1_referenz_gruen = false;
  boolean PM25_referenz_gruen = false;
  boolean PM4_referenz_gruen = false;
  boolean PM10_referenz_gruen = false;

  boolean PM1_trocken_gruen = false;
  boolean PM25_trocken_gruen = false;
  boolean PM4_trocken_gruen = false;
  boolean PM10_trocken_gruen = false;

  boolean PM1_nass_gruen = false;
  boolean PM25_nass_gruen = false;
  boolean PM4_nass_gruen = false;
  boolean PM10_nass_gruen = false;

  //

  boolean PM1_referenz_blau = false;
  boolean PM25_referenz_blau = false;
  boolean PM4_referenz_blau = false;
  boolean PM10_referenz_blau = false;

  boolean PM1_trocken_blau = false;
  boolean PM25_trocken_blau = false;
  boolean PM4_trocken_blau = false;
  boolean PM10_trocken_blau = false;

  boolean PM1_nass_blau = false;
  boolean PM25_nass_blau = false;
  boolean PM4_nass_blau = false;
  boolean PM10_nass_blau = false;


  float rot = Sensoren_SPS_Rot_Station1.getValue();
  float gruen = Sensoren_SPS_Gruen_Station1.getValue();
  float blau = Sensoren_SPS_Blau_Station1.getValue();


  if (rot == 1) {
    PM1_referenz_rot = true;
  }
  if (rot == 2) {
    PM25_referenz_rot = true;
  }
  if (rot == 3) {
    PM4_referenz_rot = true;
  }
  if (rot == 4) {
    PM10_referenz_rot = true;
  }
  if (rot == 5) {
    PM1_trocken_rot = true;
  }
  if (rot == 6) {
    PM25_trocken_rot = true;
  }
  if (rot == 7) {
    PM4_trocken_rot = true;
  }
  if (rot == 8) {
    PM10_trocken_rot = true;
  }
  if (rot == 9) {
    PM1_nass_rot = true;
  }
  if (rot == 10) {
    PM25_nass_rot = true;
  }
  if (rot == 11) {
    PM4_nass_rot = true;
  } 
  if (rot == 12) {
    PM10_nass_rot = true;
  }

  if (gruen == 1) {
    PM1_referenz_gruen = true;
  }
  if (gruen == 2) {
    PM25_referenz_gruen = true;
  }
  if (gruen == 3) {
    PM4_referenz_gruen = true;
  }
  if (gruen == 4) {
    PM10_referenz_gruen = true;
  }
  if (gruen == 5) {
    PM1_trocken_gruen = true;
  }
  if (gruen == 6) {
    PM25_trocken_gruen = true;
  }
  if (gruen == 7) {
    PM4_trocken_gruen = true;
  }
  if (gruen == 8) {
    PM10_trocken_gruen = true;
  }
  if (gruen == 9) {
    PM1_nass_gruen = true;
  }
  if (gruen == 10) {
    PM25_nass_gruen = true;
  }
  if (gruen == 11) {
    PM4_nass_gruen = true;
  } 
  if (gruen == 12) {
    PM10_nass_gruen = true;
  }

  if (blau == 1) {
    PM1_referenz_blau = true;
  }
  if (blau == 2) {
    PM25_referenz_blau = true;
  }
  if (blau == 3) {
    PM4_referenz_blau = true;
  }
  if (blau == 4) {
    PM10_referenz_blau = true;
  }
  if (blau == 5) {
    PM1_trocken_blau = true;
  }
  if (blau == 6) {
    PM25_trocken_blau = true;
  }
  if (blau == 7) {
    PM4_trocken_blau = true;
  }
  if (blau == 8) {
    PM10_trocken_blau = true;
  }
  if (blau == 9) {
    PM1_nass_blau = true;
  }
  if (blau == 10) {
    PM25_nass_blau = true;
  }
  if (blau == 11) {
    PM4_nass_blau = true;
  } 
  if (blau == 12) {
    PM10_nass_blau = true;
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

  if (PM1_referenz_rot) {
    graph2(Station1_PM1, 3, "Feinstaub in µg/m³", x_scale, y_scale, true, color(255, 0, 0));
  } else if (PM25_referenz_rot) {
    graph2(Station1_PM25, 3, "Feinstaub in µg/m³", x_scale, y_scale, true, color(255, 0, 0));
  } else if (PM4_referenz_rot) {
    graph2(Station1_PM4, 3, "Feinstaub in µg/m³", x_scale, y_scale, true, color(255, 0, 0));
  } else if (PM10_referenz_rot) {
    graph2(Station1_PM10, 3, "Feinstaub in µg/m³", x_scale, y_scale, true, color(255, 0, 0));
  } else if (PM1_trocken_rot) {
    graph2(Station1_PM1_trocken, 3, "Feinstaub in µg/m³", x_scale, y_scale, true, color(255, 0, 0));
  } else if (PM25_trocken_rot) {
    graph2(Station1_PM25_trocken, 3, "Feinstaub in µg/m³", x_scale, y_scale, true, color(255, 0, 0));
  } else if (PM4_trocken_rot) {
    graph2(Station1_PM4_trocken, 3, "Feinstaub in µg/m³", x_scale, y_scale, true, color(255, 0, 0));
  } else if (PM10_trocken_rot) {
    graph2(Station1_PM10_trocken, 3, "Feinstaub in µg/m³", x_scale, y_scale, true, color(255, 0, 0));
  } else if (PM1_nass_rot) {
    graph2(Station1_PM1_nass, 3,"Feinstaub in µg/m³", x_scale, y_scale, true, color(255, 0, 0));
  } else if (PM25_nass_rot) {
    graph2(Station1_PM25_nass, 3, "Feinstaub in µg/m³", x_scale, y_scale, true, color(255, 0, 0));
  } else if (PM4_nass_rot) {
    graph2(Station1_PM4_nass, 3,"Feinstaub in µg/m³", x_scale, y_scale, true, color(255, 0, 0));
  } else if (PM10_nass_rot) {
    graph2(Station1_PM10_nass, 3, "Feinstaub in µg/m³", x_scale, y_scale, true, color(255, 0, 0));
  }


  if (PM1_referenz_gruen) {
    graph2(Station1_PM1, 3, "Feinstaub in µg/m³", x_scale, y_scale, true, color(0, 255, 0));
  } else if (PM25_referenz_gruen) {
    graph2(Station1_PM25, 3, "Feinstaub in µg/m³", x_scale, y_scale, true, color(0, 255, 0));
  } else if (PM4_referenz_gruen) {
    graph2(Station1_PM4, 3, "Feinstaub in µg/m³", x_scale, y_scale, true, color(0, 255, 0));
  } else if (PM10_referenz_gruen) {
    graph2(Station1_PM10, 3, "Feinstaub in µg/m³", x_scale, y_scale, true, color(0, 255, 0));
  } else if (PM1_trocken_gruen) {
    graph2(Station1_PM1_trocken, 3, "Feinstaub in µg/m³", x_scale, y_scale, true, color(0, 255, 0));
  } else if (PM25_trocken_gruen) {
    graph2(Station1_PM25_trocken, 3, "Feinstaub in µg/m³", x_scale, y_scale, true, color(0, 255, 0));
  } else if (PM4_trocken_gruen) {
    graph2(Station1_PM4_trocken, 3, "Feinstaub in µg/m³", x_scale, y_scale, true, color(0, 255, 0));
  } else if (PM10_trocken_gruen) {
    graph2(Station1_PM10_trocken, 3, "Feinstaub in µg/m³", x_scale, y_scale, true, color(0, 255, 0));
  } else if (PM1_nass_gruen) {
    graph2(Station1_PM1_nass, 3, "Feinstaub in µg/m³", x_scale, y_scale, true, color(0, 255, 0));
  } else if (PM25_nass_gruen) {
    graph2(Station1_PM25_nass, 3, "Feinstaub in µg/m³", x_scale, y_scale, true, color(0, 255, 0));
  } else if (PM4_nass_gruen) {
    graph2(Station1_PM4_nass, 3, "Feinstaub in µg/m³", x_scale, y_scale, true, color(0, 255, 0));
  } else if (PM10_nass_gruen) {
    graph2(Station1_PM10_nass, 3, "Feinstaub in µg/m³", x_scale, y_scale, true, color(0, 255, 0));
  }


  if (PM1_referenz_blau) {
    graph2(Station1_PM1, 3, "Feinstaub in µg/m³", x_scale, y_scale, true, color(0, 0, 255));
  } else if (PM25_referenz_blau) {
    graph2(Station1_PM25, 3, "Feinstaub in µg/m³", x_scale, y_scale, true, color(0, 0, 255));
  } else if (PM4_referenz_blau) {
    graph2(Station1_PM4, 3, "Feinstaub in µg/m³", x_scale, y_scale, true, color(0, 0, 255));
  } else if (PM10_referenz_blau) {
    graph2(Station1_PM10, 3,"Feinstaub in µg/m³", x_scale, y_scale, true, color(0, 0, 255));
  } else if (PM1_trocken_blau) {
    graph2(Station1_PM1_trocken, 3, "Feinstaub in µg/m³", x_scale, y_scale, true, color(0, 0, 255));
  } else if (PM25_trocken_blau) {
    graph2(Station1_PM25_trocken, 3, "Feinstaub in µg/m³", x_scale, y_scale, true, color(0, 0, 255));
  } else if (PM4_trocken_blau) {
    graph2(Station1_PM4_trocken, 3, "Feinstaub in µg/m³", x_scale, y_scale, true, color(0, 0, 255));
  } else if (PM10_trocken_blau) {
    graph2(Station1_PM10_trocken, 3, "Feinstaub in µg/m³", x_scale, y_scale, true, color(0, 0, 255));
  } else if (PM1_nass_blau) {
    graph2(Station1_PM1_nass, 3, "Feinstaub in µg/m³", x_scale, y_scale, true, color(0, 0, 255));
  } else if (PM25_nass_blau) {
    graph2(Station1_PM25_nass, 3, "Feinstaub in µg/m³", x_scale, y_scale, true, color(0, 0, 255));
  } else if (PM4_nass_blau) {
    graph2(Station1_PM4_nass, 3, "Feinstaub in µg/m³", x_scale, y_scale, true, color(0, 0, 255));
  } else if (PM10_nass_blau) {
    graph2(Station1_PM10_nass, 3, "Feinstaub in µg/m³", x_scale, y_scale, true, color(0, 0, 255));
  }


  fill(0);
  textSize(20);
  text("0", 170, 635);
  text("30", 310, 635);
  text("90", 630, 635);
  text("150", 920, 635);
  text("180", 1100, 635);
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
