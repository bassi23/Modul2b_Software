void alleSensoren() {
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
  boolean eco2_left = false;
  boolean eco2_right = false;
  boolean tvoc_left = false;
  boolean tvoc_right = false;
  boolean T_left = false;
  boolean T_right = false;
  boolean H_left = false;
  boolean H_right = false;
  boolean CO2_left = false;
  boolean CO2_right = false;



  if (Alle_Sensoren_Blau.name == "TVOC") {
    tvoc_right = true;
    up2.show();
    down2.show();
  } else if (Alle_Sensoren_Blau.name == "eCO2" || Alle_Sensoren_Blau.name == "eCO") {
    eco2_right = true;
    up2.show();
    down2.show();
  } else if (Alle_Sensoren_Blau.name == "Temperatur") {
    T_right = true;
    up2.show();
    down2.show();
  } else if (Alle_Sensoren_Blau.name == "Luftfeuchte") {
    H_right = true;
    up2.show();
    down2.show();
  } else if (Alle_Sensoren_Blau.name == "CO2"  || Alle_Sensoren_Blau.name == "CO") {
    CO2_right = true;
    up2.show();
    down2.show();
  } else if (Alle_Sensoren_Blau.name == "PM1") {
    PM1_right = true;
    up2.show();
    down2.show();
  } else if (Alle_Sensoren_Blau.name == "PM2.5") {
    PM2_5_right = true;
    up2.show();
    down2.show();
  } else if (Alle_Sensoren_Blau.name == "PM4") {
    PM4_right = true;
    up2.show();
    down2.show();
  } else if (Alle_Sensoren_Blau.name == "PM10") {
    PM10_right = true;
    up2.show();
    down2.show();
  } else {
    up2.hide();
    down2.hide();
  }


  if (Alle_Sensoren_Rot.name == "TVOC") {
    tvoc_left = true;
    up1.show();
    down1.show();
  } else if (Alle_Sensoren_Rot.name == "eCO2" || Alle_Sensoren_Rot.name == "eCO") {
    eco2_left = true;
    up1.show();
    down1.show();
  } else if (Alle_Sensoren_Rot.name == "Temperatur") {
    T_left = true;
    up1.show();
    down1.show();
  } else if (Alle_Sensoren_Rot.name == "Luftfeuchte") {
    H_left = true;
    up1.show();
    down1.show();
  } else if (Alle_Sensoren_Rot.name == "CO2" || Alle_Sensoren_Rot.name == "CO") {
    CO2_left = true;
    up1.show();
    down1.show();
  } else if (Alle_Sensoren_Rot.name == "PM1") {
    PM1_left = true;
    up1.show();
    down1.show();
  } else if (Alle_Sensoren_Rot.name == "PM2.5") {
    PM2_5_left = true;
    up1.show();
    down1.show();
  } else if (Alle_Sensoren_Rot.name == "PM4") {
    PM4_left = true;
    up1.show();
    down1.show();
  } else if (Alle_Sensoren_Rot.name == "PM10") {
    PM10_left = true;
    up1.show();
    down1.show();
  } else {
    up1.hide();
    down1.hide();
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
  } else if (tvoc_left) {
    graph(sgp_tvoc_data, 0, "TVOC in ppb", x_scale, y_scale, true);
  } else if (eco2_left) {
    graph(sgp_eco2_data, 0, "eCO2 in ppm", x_scale, y_scale, true);
  } else if (T_left) {
    graph(scd_temperature_data, 0, "Temperatur in °C", x_scale, y_scale, true);
  } else if (H_left) {
    graph(scd_humidity_data, 0, "relative Luftfeuchte in %", x_scale, y_scale, true);
  } else if (CO2_left) {
    graph(scd_co2_data, 0, "CO2 in ppm", x_scale, y_scale, true);
  }




  if (PM1_right) {
    graph(sps_pm1_data, 0, "Feinstaub PM1 in μg/m³", x_scale, y_scale, false);
  } else if (PM2_5_right) {
    graph(sps_pm25_data, 0, "Feinstaub PM2.5 in μg/m³", x_scale, y_scale, false);
  } else if (PM4_right) {
    graph(sps_pm4_data, 0, "Feinstaub PM4 in μg/m³", x_scale, y_scale, false);
  } else if (PM10_right) {
    graph(sps_pm10_data, 0, "Feinstaub PM10 in μg/m³", x_scale, y_scale, false);
  } else if (tvoc_right) {
    graph(sgp_tvoc_data, 0, "TVOC in ppb", x_scale, y_scale, false);
  } else if (eco2_right) {
    graph(sgp_eco2_data, 0, "eCO2 in ppm", x_scale, y_scale, false);
  } else  if (T_right) {
    graph(scd_temperature_data, 0, "Temperatur in °C", x_scale, y_scale, false);
  } else if (H_right) {
    graph(scd_humidity_data, 0, "relative Luftfeuchte in %", x_scale, y_scale, false);
  } else if (CO2_right) {
    graph(scd_co2_data, 0, "CO2 in ppm", x_scale, y_scale, false);
  }
  fill(0);
  noStroke();
  textSize(30);
  text("Optionen", 1120, 50);
  fill(240);;
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
  if(measure){
   fill(0,255,0); 
  }else{
   fill(255,0,0); 
  }
  ellipse(1098, 125, 20, 20);

  Alle_Sensoren_Rot.show();
  Alle_Sensoren_Blau.show();
  left1.show();
  right1.show();
  reset.show();
  back.show();
  aktualisierung_right.show();
  aktualisierung_left.show();
  start_stopp.show();
  zumObermenu.show();
}
