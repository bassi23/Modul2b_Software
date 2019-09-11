void TVOC_eCO2() {
  //SGP_check.show();
  two_three.active = false;
  four.active = false;
  one.active = false;
  settings.active = false;


  boolean eco2_left = false;
  boolean eco2_right = false;
  boolean tvoc_left = false;
  boolean tvoc_right = false;

  if (SGP_Rot.name == "TVOC") {
    tvoc_left = true;
    up1.show();
    down1.show();
  } else if (SGP_Rot.name == "eCO2" || SGP_Rot.name == "eCO") {
    eco2_left = true;
    up1.show();
    down1.show();
  } else {
    up1.hide();
    down1.hide();
  }

  if (SGP_Blau.name == "TVOC") {
    tvoc_right = true;
    up2.show();
    down2.show();
  } else if (SGP_Blau.name == "eCO2" ||SGP_Blau.name == "eCO" ) {
    eco2_right = true;
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

  //Welche Graphen sollen angezeigt werden?

  if (tvoc_left) {
    graph(sgp_tvoc_data, 0, "TVOC in ppb", x_scale, y_scale, true);
  }
  if (tvoc_right) {
    graph(sgp_tvoc_data, 0, "TVOC in ppb", x_scale, y_scale, false);
  }

  if (eco2_left) {
    graph(sgp_eco2_data, 0, "eCO2 in ppm", x_scale, y_scale, true);
  }

  if (eco2_right) {
    graph(sgp_eco2_data, 0, "eCO2 in ppm", x_scale, y_scale, false);
  }

  fill(0);
  noStroke();
  textSize(24);
  text("Optionen", 1130, 22);
  fill(240);
  stroke(0);
  rect(1105, 445, 155, 140);
  rect(1105, 250, 155, 180);
  rect(1105, 155, 155, 80);
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
  textSize(15);
  text("Fehlerbalken", 1165, 180);
  text("verbinden", 1165, 220);
  textAlign(CORNER);
  stroke(0);
  if (measure) {
    fill(0, 255, 0);
  } else {
    fill(255, 0, 0);
  }
  ellipse(1098, 60, 20, 20);


  left1.show();
  right1.show();
  reset.show();
  back.show();
  aktualisierung_right.show();
  aktualisierung_left.show();
  start_stopp.show();
  zumObermenu.show();
  SGP_Blau.show();
  SGP_Rot.show();
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
