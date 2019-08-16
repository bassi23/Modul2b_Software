void T_H_CO2() {
  // SCD_check.show();
  two_three.active = false;
  four.active = false;
  one.active = false;
  settings.active = false;


  boolean T_left = false;
  boolean T_right = false;
  boolean H_left = false;
  boolean H_right = false;
  boolean CO2_left = false;
  boolean CO2_right = false;

  if (SCD_Rot.name == "Temperatur") {
    T_left = true;
    up1.show();
    down1.show();
  } else if (SCD_Rot.name == "Luftfeuchte") {
    H_left = true;
    up1.show();
    down1.show();
  } else if (SCD_Rot.name == "CO2") {
    CO2_left = true;
    up1.show();
    down1.show();
  } else {
    up1.hide();
    down1.hide();
  }

  if (SCD_Blau.name == "Temperatur") {
    T_right = true;
    up2.show();
    down2.show();
  } else if (SCD_Blau.name == "Luftfeuchte") {
    H_right = true;
    up2.show();
    down2.show();
  } else if (SCD_Blau.name == "CO2") {
    CO2_right = true;
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

  textSize(20);

  if (T_left) {
    graph(scd_temperature_data, 0, "Temperatur in °C", x_scale, y_scale, true);
  } else if (H_left) {
    graph(scd_humidity_data, 0, "relative Luftfeuchte in %", x_scale, y_scale, true);
  } else if (CO2_left) {
    graph(scd_co2_data, 0, "CO2 in ppm", x_scale, y_scale, true);
  }

  if (T_right) {
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



  left1.show();
  right1.show();
  reset.show();
  back.show();
  aktualisierung_right.show();
  aktualisierung_left.show();
  start_stopp.show();
  zumObermenu.show();
  SCD_Blau.show();
  SCD_Rot.show();
}
