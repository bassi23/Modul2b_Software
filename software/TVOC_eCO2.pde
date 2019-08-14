void TVOC_eCO2() {
  //SGP_check.show();

  two_three.active = false;
  four.active = false;
  one.active = false;
  settings.active = false;
  left1.show();
  right1.show();
  reset.show();
  boolean eco2_left = false;
  boolean eco2_right = false;
  boolean tvoc_left = false;
  boolean tvoc_right = false;

  if (SGP_Rot.name == "TVOC") {
    tvoc_left = true;
    up1.show();
    down1.show();
  } else if (SGP_Rot.name == "eCO2") {
    eco2_left = true;
    up1.show();
    down1.show();
  }else{
   up1.hide();
   down1.hide();
  }

  if (SGP_Blau.name == "TVOC") {
    tvoc_right = true;
    up2.show();
    down2.show();
  } else if (SGP_Blau.name == "eCO2") {
    eco2_right = true;
    up2.show();
    down2.show();
  }else{
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
  SGP_Blau.show();
  SGP_Rot.show();
}
