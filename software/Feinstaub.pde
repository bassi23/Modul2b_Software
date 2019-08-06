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



boolean station1_ref = false;
boolean station1_tro = false;
boolean station1_nas = false;


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


  //Wurden 180 Sekunden gemessen?
  boolean nass_fertig = false;
  boolean trocken_fertig = false;
  boolean referenz_fertig = false;
  for (int i = 0; i < 1000; i++) {
    if (Station1_zeit_nass[i] > 179) {
      nass_fertig = true;
    }
  }
  for (int i = 0; i < 1000; i++) {
    if (Station1_zeit_trocken[i] > 179) {
      trocken_fertig = true;
    }
  }
  for (int i = 0; i < 1000; i++) {
    if (Station1_zeit[i] > 179) {
      referenz_fertig = true;
    }
  }



  if (referenz_fertig) {
    haken(250);
  } else {
    kreuz(300);
  }

  if (trocken_fertig) {
    haken(600);
  } else {
    kreuz(650);
  }
  if (nass_fertig) {
    haken(950);
  } else {
    kreuz(1000);
  }


  if (referenz_fertig && trocken_fertig && nass_fertig) {
    FeinstaubVergleichen.show();
  } else {
    FeinstaubVergleichen.hide();
  }

  fill(0);
  textSize(20);
  text("Station 1 - Feinstaubmessung", 20, 50);
  text("Miss den Feinstaub, der von einem trockenen und einem nassen Tafelschwamm emittiert wird. Führe auch eine Referenzmessung\nohne Schwamm durch. Jede Messung dauert 3 Minuten und setzt sich aus den folgenden Schritten zusammen:", 20, 100);
  text("-30 Sekunden Einlaufzeit\n-1 Minute Messung mit geschlossenem Deckel\n-1 Minute Messung mit geöffnetem Decken\n-30 Sekunden Auslaufzeit", 450, 180);
}


void haken(float x) {
  strokeWeight(5);
  stroke(0, 255, 0);

  line(x, 560, x + 50, 610);
  line(x + 50, 610, x + 100, 510);
  strokeWeight(1);
}


void kreuz(float x) {
  strokeWeight(5);
  stroke(255, 0, 0);
  line(x - 50, 510, x + 50, 610);
  line(x - 50, 610, x + 50, 510);
  strokeWeight(1);
}


void referenzmessung() {
  SPS_check.show();
  station1_referenz.hide();
  station1_trocken.hide();
  station1_nass.hide();
  text("PM1            PM2.5              PM4            PM10", 340, 43);
  onlyTwo(SPS_check, "PM1", "PM2.5", "PM4", "PM10");  //Sorgt dafür, dass man nur zwei Sachen gleichzeitig auswählen kann
  //Welche Graphen sollen angezeigt werden?
  boolean pm1 = SPS_check.getState("PM1");
  boolean pm25 = SPS_check.getState("PM2.5");
  boolean pm4 = SPS_check.getState("PM4");
  boolean pm10 = SPS_check.getState("PM10");
  if (Station1Start) {
    station1_MessungStarten.hide();
  } else {
    station1_MessungStarten.show();
  }

  fill(0);
  textSize(20);
  up1.show();
  down1.show();
  down2.show();
  up2.show();
  reset.hide();
  fill(0);
  noStroke();

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
  //Welche Graphen sollen angezeigt werden?
  if (pm1) {
    graph(Station1_PM1, 1, "Feinstaub PM1 in μg/m³", x_scale, y_scale, true);
    if (pm25) {
      graph(Station1_PM25, 1, "Feinstaub PM2.5 in μg/m³", x_scale, y_scale, false);
    } else if (pm4) {
      graph(Station1_PM4, 1, "Feinstaub PM4 in μg/m³", x_scale, y_scale, false);
    } else if (pm10) {
      graph(Station1_PM10, 1, "Feinstaub PM10 in μg/m³", x_scale, y_scale, false);
    }
  } else if (pm25) {
    graph(Station1_PM25, 1, "Feinstaub PM2.5 in μg/m³", x_scale, y_scale, true);
    if (pm4) {
      graph(Station1_PM4, 1, "Feinstaub PM4 in μg/m³", x_scale, y_scale, false);
    } else if (pm10) {
      graph(Station1_PM10, 1, "Feinstaub PM10 in μg/m³", x_scale, y_scale, false);
    }
  } else if (pm4) {
    graph(Station1_PM4, 1, "Feinstaub PM4 in μg/m³", x_scale, y_scale, true);
    if (pm10) {
      graph(Station1_PM10, 1, "Feinstaub PM10 in μg/m³", x_scale, y_scale, false);
    }
  } else if (pm10) {
    graph(Station1_PM10, 1, "Feinstaub PM10 in μg/m³", x_scale, y_scale, true);
  }
  fill(0);
}



void trockenerSchwamm() {
  SPS_check.show();
  station1_referenz.hide();
  station1_trocken.hide();
  station1_nass.hide();
  if (Station1Start) {
    station1_MessungStarten.hide();
  } else {
    station1_MessungStarten.show();
  }
  fill(0);
  textSize(20);
  up1.show();
  down1.show();
  up2.show();
  down2.show();
  reset.hide();
  text("PM1            PM2.5              PM4            PM10", 340, 43);
  onlyTwo(SPS_check, "PM1", "PM2.5", "PM4", "PM10");  //Sorgt dafür, dass man nur zwei Sachen gleichzeitig auswählen kann
  //Welche Graphen sollen angezeigt werden?
  boolean pm1 = SPS_check.getState("PM1");
  boolean pm25 = SPS_check.getState("PM2.5");
  boolean pm4 = SPS_check.getState("PM4");
  boolean pm10 = SPS_check.getState("PM10");
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
  //Welche Graphen sollen angezeigt werden?
  if (pm1) {
    graph(Station1_PM1_trocken, 2, "Feinstaub PM1 in μg/m³", x_scale, y_scale, true);
    if (pm25) {
      graph(Station1_PM25_trocken, 2, "Feinstaub PM2.5 in μg/m³", x_scale, y_scale, false);
    } else if (pm4) {
      graph(Station1_PM4_trocken, 2, "Feinstaub PM4 in μg/m³", x_scale, y_scale, false);
    } else if (pm10) {
      graph(Station1_PM10_trocken, 2, "Feinstaub PM10 in μg/m³", x_scale, y_scale, false);
    }
  } else if (pm25) {
    graph(Station1_PM25_trocken, 2, "Feinstaub PM2.5 in μg/m³", x_scale, y_scale, true);
    if (pm4) {
      graph(Station1_PM4_trocken, 2, "Feinstaub PM4 in μg/m³", x_scale, y_scale, false);
    } else if (pm10) {
      graph(Station1_PM10_trocken, 2, "Feinstaub PM10 in μg/m³", x_scale, y_scale, false);
    }
  } else if (pm4) {
    graph(Station1_PM4_trocken, 2, "Feinstaub PM4 in μg/m³", x_scale, y_scale, true);
    if (pm10) {
      graph(Station1_PM10_trocken, 2, "Feinstaub PM10 in μg/m³", x_scale, y_scale, false);
    }
  } else if (pm10) {
    graph(Station1_PM10_trocken, 2, "Feinstaub PM10 in μg/m³", x_scale, y_scale, true);
  }
  fill(0);
}



void nasserSchwamm() {
  SPS_check.show();
  station1_referenz.hide();
  station1_trocken.hide();
  station1_nass.hide();
  if (Station1Start) {
    station1_MessungStarten.hide();
  } else {
    station1_MessungStarten.show();
  }
  fill(0);
  textSize(20);
  up1.show();
  down1.show();
  up2.show();
  down2.show();
  reset.hide();
  text("PM1            PM2.5              PM4            PM10", 340, 43);
  onlyTwo(SPS_check, "PM1", "PM2.5", "PM4", "PM10");  //Sorgt dafür, dass man nur zwei Sachen gleichzeitig auswählen kann
  //Welche Graphen sollen angezeigt werden?
  boolean pm1 = SPS_check.getState("PM1");
  boolean pm25 = SPS_check.getState("PM2.5");
  boolean pm4 = SPS_check.getState("PM4");
  boolean pm10 = SPS_check.getState("PM10");
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
  //Welche Graphen sollen angezeigt werden?
  if (pm1) {
    graph(Station1_PM1_nass, 3, "Feinstaub PM1 in μg/m³", x_scale, y_scale, true);
    if (pm25) {
      graph(Station1_PM25_nass, 3, "Feinstaub PM2.5 in μg/m³", x_scale, y_scale, false);
    } else if (pm4) {
      graph(Station1_PM4_nass, 3, "Feinstaub PM4 in μg/m³", x_scale, y_scale, false);
    } else if (pm10) {
      graph(Station1_PM10_nass, 3, "Feinstaub PM10 in μg/m³", x_scale, y_scale, false);
    }
  } else if (pm25) {
    graph(Station1_PM25_nass, 3, "Feinstaub PM2.5 in μg/m³", x_scale, y_scale, true);
    if (pm4) {
      graph(Station1_PM4_nass, 3, "Feinstaub PM4 in μg/m³", x_scale, y_scale, false);
    } else if (pm10) {
      graph(Station1_PM10_nass, 3, "Feinstaub PM10 in μg/m³", x_scale, y_scale, false);
    }
  } else if (pm4) {
    graph(Station1_PM4_nass, 3, "Feinstaub PM4 in μg/m³", x_scale, y_scale, true);
    if (pm10) {
      graph(Station1_PM10_nass, 3, "Feinstaub PM10 in μg/m³", x_scale, y_scale, false);
    }
  } else if (pm10) {
    graph(Station1_PM10_nass, 3, "Feinstaub PM10 in μg/m³", x_scale, y_scale, true);
  }
}





void Vergleich_Feinstaub() {
  SPS_check.show();
  station1_referenz.hide();
  station1_trocken.hide();
  station1_nass.hide();
  station1_MessungStarten.hide();
  fill(0);
  textSize(20);
  up1.show();
  down1.show();
  left1.hide();
  right1.hide();
  reset.hide();

  text("PM1            PM2.5              PM4            PM10", 340, 43);
  onlyOne(SPS_check, "PM1", "PM2.5", "PM4", "PM10");  //Sorgt dafür, dass man nur zwei Sachen gleichzeitig auswählen kann
  //Welche Graphen sollen angezeigt werden?
  boolean pm1 = SPS_check.getState("PM1");
  boolean pm25 = SPS_check.getState("PM2.5");
  boolean pm4 = SPS_check.getState("PM4");
  boolean pm10 = SPS_check.getState("PM10");
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

  //Welche Graphen sollen angezeigt werden?


  if (pm1) {
    graphFeinstaub(Station1_PM1, Station1_PM1_trocken, Station1_PM1_nass, y_scale[0]);
  } else if (pm25) {
    graphFeinstaub(Station1_PM25, Station1_PM25_trocken, Station1_PM25_nass, y_scale[0]);
  } else if (pm4) {
    graphFeinstaub(Station1_PM4, Station1_PM4_trocken, Station1_PM4_nass, y_scale[0]);
  } else if (pm10) {
    graphFeinstaub(Station1_PM10, Station1_PM10_trocken, Station1_PM10_nass, y_scale[0]);
  }
  textSize(20);
  fill(255, 0, 0);
  text("Referenzmessung", 150, 670);
  fill(0, 255, 0);
  text("trockener Schwamm", 550, 670);
  fill(0, 0, 255);
  text("nasser Schwamm", 950, 670);
}


void graphFeinstaub(float[] arr1, float[] arr2, float[] arr3, float y_scale) {
  int sizeArr1 = 0;
  int sizeArr2 = 0;
  int sizeArr3 = 0;
  for (int i = 1; i < 1000; i++) {
    if (arr1[i] != 0) {
      sizeArr1 = i;
    }
    if (arr2[i] != 0) {
      sizeArr2 = i;
    }
    if (arr3[i] != 0) {
      sizeArr3 = i;
    }
  }

  float max = 0;
  float min = 9999999;


  if (y_scale == 0) {
    for (int i = 0; i < sizeArr1; i++) {
      if (arr1[i] > max) {
        max = arr1[i];
      }
      if (arr1[i] < min) {
        min = arr1[i];
      }
    }
    for (int i = 0; i < sizeArr2; i++) {
      if (arr2[i] > max) {
        max = arr2[i];
      }
      if (arr2[i] < min) {
        min = arr2[i];
      }
    }
    for (int i = 0; i < sizeArr3; i++) {
      if (arr3[i] > max) {
        max = arr3[i];
      }
      if (arr3[i] < min) {
        min = arr3[i];
      }
    }
  } else if (y_scale == 1) {
    min = 0;
    max = 10;
  } else if (y_scale == 2) {
    min = 0;
    max = 20;
  } else if (y_scale == 3) {
    min = 0;
    max = 50;
  } else if (y_scale == 4) {
    min = 0;
    max = 200;
  }

  float pos_x = 0;
  float y = y_scale;

  pos_x = 135;
  fill(0);
  if (y == 1) {
    text("2", pos_x, 507);
    text("4", pos_x, 407);
    text("6", pos_x, 307);
    text("8", pos_x, 207);
  } else if (y == 2) {
    text("4", pos_x, 507);
    text("8", pos_x, 407);
    text("12", pos_x, 307);
    text("16", pos_x, 207);
  } else if (y == 3) {
    text("10", pos_x, 507);
    text("20", pos_x, 407);
    text("30", pos_x, 307);
    text("40", pos_x, 207);
  } else if (y == 4) {
    text("40", pos_x, 507);
    text("80", pos_x, 407);
    text("120", pos_x, 307);
    text("160", pos_x, 207);
  }
  if (y == 0) {
    text(nf(min, 0, 1), 135, 600);
    text(nf(max, 0, 1), 135, 100);
  } else {
    text(nf(min, 0, 0), 135, 600);
    text(nf(max, 0, 0), 135, 100);
  }
  pushMatrix();
  translate(width/2, height/2);
  rotate(3*PI/2);
  text("Feinstaub in μg/m³", -50, -575);
  popMatrix();
  text("0", 150, 640);
  stroke(255, 0, 0);
  for (int i = 0; i < sizeArr1-1; i++) {
    float x_anfang = 0;
    float x_ende = Station1_zeit[sizeArr1-1];
    float x_intervall = x_ende - x_anfang;
    float x1 = 175 + (Station1_zeit[i] - x_anfang)*930/x_intervall;
    float x2 = 175 + (Station1_zeit[i+1] - x_anfang)*930/x_intervall;
    float y1 = 600 - 500*(arr1[i]-min)/(max - min);
    float y2 = 600 - 500*(arr1[i+1] - min)/(max - min);
    if (arr1[i] <= max && arr1[i+1] <= max) {
      line(x1, y1, x2, y2);
    }
  }
  stroke(0, 255, 0);
  for (int i = 0; i < sizeArr2-1; i++) {
    float x_anfang = 0;
    float x_ende = Station1_zeit_trocken[sizeArr2-1];
    float x_intervall = x_ende - x_anfang;
    float x1 = 175 + (Station1_zeit_trocken[i] - x_anfang)*930/x_intervall;
    float x2 = 175 + (Station1_zeit_trocken[i+1] - x_anfang)*930/x_intervall;
    float y1 = 600 - 500*(arr2[i]-min)/(max - min);
    float y2 = 600 - 500*(arr2[i+1] - min)/(max - min);
    if (arr2[i] <= max && arr2[i+1] <= max) {
      line(x1, y1, x2, y2);
    }
  }
  stroke(0, 0, 255);
  for (int i = 0; i < sizeArr3-1; i++) {
    float x_anfang = 0;
    float x_ende = Station1_zeit_nass[sizeArr3-1];
    float x_intervall = x_ende - x_anfang;
    float x1 = 175 + (Station1_zeit_nass[i] - x_anfang)*930/x_intervall;
    float x2 = 175 + (Station1_zeit_nass[i+1] - x_anfang)*930/x_intervall;
    float y1 = 600 - 500*(arr3[i]-min)/(max - min);
    float y2 = 600 - 500*(arr3[i+1] - min)/(max - min);
    if (arr3[i] <= max && arr3[i+1] <= max) {
      line(x1, y1, x2, y2);
    }
  }
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
