void TVOC_Duelle() {
  Sensormessung.visible = false;
  textSize(20);
  fill(0);
  textFont(bold);
  text("Station 3 - TVOC-Duelle", 20, 50);
  textFont(normal);
  Station3_Aufgabentext_a1.show();
  //  text("Vergleiche verschiedene Materialien auf die Ausdünstung von flüchtigen organischen Verbindungen (TVOC). Welche Stoffe\nemittieren am meisten? Gib zuvor eine Prognose ab, indem du an den Stoffen riechst.", 20, 100);
  stroke(0);
  line(0, 180, 1280, 180);
  noStroke();
  textFont(bold);
  text("a) Riechen", 20, 220);
  textFont(normal);
  Station3_Aufgabentext_a2.show();
  //  text("\nOrdne die Emission der folgenden Stoffe auf der unteren Skala an! Vergib Punkte von 0 (nicht wahrnehmbar) bis\n6(extrem stark).", 20, 220); 
  TVOC_Duelle_Start.show();
  if (TVOC_Duelle_Start.isClicked()) {
    delay(200);
    page = 3.1;
  }
  Station3_Aufgabentext_a2.y = 230;
  Duell_Runde = 1;
}

int Duell_Runde = 1;

void TVOC_Duelle_Riechen() {
  weiter_zum_Sensor.hide();
  textSize(20);
  fill(0);
  //  Station3_Aufgabentext_a1.show();
  // text("Vergleiche verschiedene Materialien auf die Ausdünstung von flüchtigen organischen Verbindungen (TVOC). Welche Stoffe\nemittieren am meisten? Gib zuvor eine Prognose ab, indem du an den Stoffen riechst.", 20, 100);
  stroke(0);
  line(0, 180, 1280, 180);
  noStroke();
  textFont(bold);
  text("a) Riechen", 20, 50);
  textFont(normal);
  Station3_Aufgabentext_a2.y = 60;
  Station3_Aufgabentext_a2.show();
  // text("\nOrdne die Emission der folgenden Stoffe auf der unteren Skala an! Vergib Punkte von 0 (nicht wahrnehmbar) bis\n6(extrem stark).", 20, 220); 
  text("nicht wahrnehmbar (0)", 50, 480);
  text("extrem stark (6)", 1020, 480);
  TVOC_Duelle_Start.hide();


  for (int i = 0; i < 50; i++) {
    fill(255*(float(i)/50), 255-255*(float(i)/50), 0);
    rect(290 + 14*i, 450, 14, 50);
  }



  Sensormessung.visible = false;

  if (naechstes_Duell.isClicked()) {
    Duell_Runde += 1;
    delay(200);
  }
  if (vorheriges_Duell.isClicked()) {
    Duell_Runde -= 1;
    delay(200);
  }


  if (Duell_Runde < 4) {
    naechstes_Duell.show();
  }
  if (Duell_Runde > 1) {
    vorheriges_Duell.show();
  }
  if (Duell_Runde == 1) {
    Stoff1.show();
    Stoff2.show();
  } else if (Duell_Runde == 2) {
    Stoff3.show();
    Stoff4.show();
  } else if (Duell_Runde == 3) {
    Stoff5.show();
    Stoff6.show();
  } else if (Duell_Runde == 4) {
    Stoff7.show();
    Stoff8.show();
    weiter_zum_Sensor.show();
  }

  if (weiter_zum_Sensor.isClicked()) {
    delay(200);
    weiter_zum_Sensor.hide();

    page = 3.11;
  }


  tvoc_duelle_werte_mensch[0] = 6*(Stoff1.x - 290)/700;
  tvoc_duelle_werte_mensch[1] = 6*(Stoff2.x- 290)/700;
  tvoc_duelle_werte_mensch[2] = 6*(Stoff3.x- 290)/700;
  tvoc_duelle_werte_mensch[3] = 6*(Stoff4.x- 290)/700;
  tvoc_duelle_werte_mensch[4] = 6*(Stoff5.x- 290)/700;
  tvoc_duelle_werte_mensch[5] = 6*(Stoff6.x- 290)/700;
  tvoc_duelle_werte_mensch[6] = 6*(Stoff7.x- 290)/700;
  tvoc_duelle_werte_mensch[7] = 6*(Stoff8.x- 290)/700;
}


class TVOC_Kandidat {
  float x, y;
  PImage image;
  String name;

  TVOC_Kandidat(float x_, float y_, PImage image_, String name_) {
    x = x_;
    y = y_;
    name = name_;
    image = image_;
  }

  void show() {
    imageMode(CENTER);
    image(image, x, y);
    imageMode(CORNER);
    textAlign(CENTER);
    textSize(20);
    fill(0);
    if (y < 475) {
      text(name, x, y - 70);
    } else {
      text(name, x, y + 70);
    }
    float points = (x-290)/70;
    float points2 = 6*points/10;
    text(nf(points2, 0, 1), x-70, y);
    String skala = "";
    if (points < 0.5) {
      skala = "nicht wahrnehmbar";
    } else if (points2 < 1.5) {
      skala = "sehr schwach";
    } else if (points2 < 2.5) {
      skala = "schwach";
    } else if (points2 < 3.5) {
      skala = "deutlich";
    } else if (points2 < 4.5) {
      skala = "stark";
    } else if (points2 < 5.5) {
      skala = "sehr stark";
    } else {
      skala = "extrem stark";
    }
    textAlign(CORNER);
    text(skala, x+55, y);

    if (mouseX > (x - image.width/2)*scale_factor && mouseX < (x + image.width/2)*scale_factor && (mouseY - scroll) > (y - image.height/2)*scale_factor && (mouseY - scroll) < (y + image.height/2)*scale_factor && mousePressed && mouseX > scale_factor*290 && mouseX < scale_factor*990) {
      x = mouseX/scale_factor;
    }

    float r = 255*(x - 290)/700;
    float g = 255 - r;
    strokeWeight(4);
    stroke(r, g, 0);

    if (y < 475) {
      line(x, y + image.height/2, x, 450);
      line(x - 20, 430, x, 450);
      line(x, 450, x + 20, 430);
    } else {
      line(x, y - image.height/2, x, 500);
      line(x - 20, 520, x, 500);
      line(x, 500, x + 20, 520);
    }
    strokeWeight(1);
  }
}


int tvoc_stoff = 1;

float[] tvoc_duelle_werte_mensch = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
float[] tvoc_duelle_werte_sensor = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};

void TVOC_Duelle_Messen() {
  textSize(20);

  if (tvoc_stoff < 8) {
    naechster_Stoff.show();
    naechster_Stoff.y = 200;
    zur_Auswertung.hide();
  } else {
    zur_Auswertung.show();
  }
  if (naechster_Stoff.isClicked()) {
    delay(200); 
    tvoc_stoff += 1;
  }
  if (vorheriger_Stoff.isClicked()) {
    delay(200);
    tvoc_stoff -= 1;
  }
  if (tvoc_stoff > 1) {
    vorheriger_Stoff.show();
  }
  if (zur_Auswertung.isClicked()) {
    delay(200);
    page = 3.111;
  }
  strokeWeight(1);
  textFont(bold);
  text("b) Messen", 20, 50);
  textFont(normal);
  // text("\nMiss nun die verschiedenen Stoffe, indem du sie in die Gläser legst und unter den Sensor schraubst. Vergleiche die Messwerte\nmit deiner Vorhersage.", 20, 50);
  Station3_Aufgabentext_b1.show();
  //text("Miss die Emission von Stoff " + tvoc_stoff +". Warte dabei bis sich ein Gleichgewicht eingestellt hat.", 20, 150);
  textFont(bold);
  text("Deine Einschätzung", 20, 200);
  text("Messung des\nSensors", 20, 450);
  textFont(normal);
  text("nicht wahrnehmbar (0)", 10, 380);
  text("extrem stark (6)", 1020, 380);
  text("nicht wahrnehmbar (0)", 10, 630);
  text("extrem stark (6)", 1020, 630);
  stroke(0);
  // line(0, 125, 1280, 125);
  noStroke();
  for (int i = 0; i < 50; i++) {
    fill(255*(float(i)/50), 255-255*(float(i)/50), 0);
    rect(290 + 14*i, 350, 14, 50);
    rect(290 + 14*i, 600, 14, 50);
  }
  fill(0);

  if (tvoc_stoff == 1) {
    //Meine Vorhersage
    image(Stoff1_bild, Stoff1.x - 50, 210);
    text(nf(tvoc_duelle_werte_mensch[0], 0, 1), Stoff1.x - 90, 260);
    float points = tvoc_duelle_werte_mensch[0];
    String skala = "";
    if (points < 0.5) {
      skala = "nicht wahrnehmbar";
    } else if (points < 1.5) {
      skala = "sehr schwach";
    } else if (points < 2.5) {
      skala = "schwach";
    } else if (points < 3.5) {
      skala = "deutlich";
    } else if (points < 4.5) {
      skala = "stark";
    } else if (points < 5.5) {
      skala = "sehr stark";
    } else {
      skala = "extrem stark";
    }
    text(skala, Stoff1.x + 70, 260);

    float r = 255*(Stoff1.x - 360)/700;
    float g = 255 - r;
    strokeWeight(4);
    stroke(r, g, 0);
    line(Stoff1.x, 310, Stoff1.x, 350);
    line(Stoff1.x - 20, 330, Stoff1.x, 350);
    line(Stoff1.x, 350, Stoff1.x + 20, 330);
  } else if (tvoc_stoff == 2) {
    image(Stoff2_bild, Stoff2.x - 50, 210);
    text(nf(tvoc_duelle_werte_mensch[1], 0, 1), Stoff2.x - 90, 250);
    float points = tvoc_duelle_werte_mensch[1];
    String skala = "";
    if (points < 0.5) {
      skala = "nicht wahrnehmbar";
    } else if (points < 1.5) {
      skala = "sehr schwach";
    } else if (points < 2.5) {
      skala = "schwach";
    } else if (points < 3.5) {
      skala = "deutlich";
    } else if (points < 4.5) {
      skala = "stark";
    } else if (points < 5.5) {
      skala = "sehr stark";
    } else {
      skala = "extrem stark";
    }
    text(skala, Stoff2.x + 70, 260);
    float r = 255*(Stoff2.x - 360)/700;
    float g = 255 - r;
    strokeWeight(4);
    stroke(r, g, 0);
    line(Stoff2.x, 310, Stoff2.x, 350);
    line(Stoff2.x - 20, 330, Stoff2.x, 350);
    line(Stoff2.x, 350, Stoff2.x + 20, 330);
  } else if (tvoc_stoff == 3) {
    text(nf(tvoc_duelle_werte_mensch[2], 0, 1), Stoff3.x - 90, 250);
    image(Stoff3_bild, Stoff3.x - 50, 210);
    float points = tvoc_duelle_werte_mensch[2];
    String skala = "";
    if (points < 0.5) {
      skala = "nicht wahrnehmbar";
    } else if (points < 1.5) {
      skala = "sehr schwach";
    } else if (points < 2.5) {
      skala = "schwach";
    } else if (points < 3.5) {
      skala = "deutlich";
    } else if (points < 4.5) {
      skala = "stark";
    } else if (points < 5.5) {
      skala = "sehr stark";
    } else {
      skala = "extrem stark";
    }
    text(skala, Stoff3.x + 70, 260);
    float r = 255*(Stoff3.x - 360)/700;
    float g = 255 - r;
    strokeWeight(4);
    stroke(r, g, 0);
    line(Stoff3.x, 310, Stoff3.x, 350);
    line(Stoff3.x - 20, 330, Stoff3.x, 350);
    line(Stoff3.x, 350, Stoff3.x + 20, 330);
  } else if (tvoc_stoff == 4) {
    text(nf(tvoc_duelle_werte_mensch[3], 0, 1), Stoff4.x - 90, 250);
    image(Stoff4_bild, Stoff4.x - 50, 210);
    float points = tvoc_duelle_werte_mensch[3];
    String skala = "";
    if (points < 0.5) {
      skala = "nicht wahrnehmbar";
    } else if (points < 1.5) {
      skala = "sehr schwach";
    } else if (points < 2.5) {
      skala = "schwach";
    } else if (points < 3.5) {
      skala = "deutlich";
    } else if (points < 4.5) {
      skala = "stark";
    } else if (points < 5.5) {
      skala = "sehr stark";
    } else {
      skala = "extrem stark";
    }
    text(skala, Stoff4.x + 70, 260);
    float r = 255*(Stoff4.x - 360)/700;
    float g = 255 - r;
    strokeWeight(4);
    stroke(r, g, 0);
    line(Stoff4.x, 310, Stoff4.x, 350);
    line(Stoff4.x - 20, 330, Stoff4.x, 350);
    line(Stoff4.x, 350, Stoff4.x + 20, 330);
  } else if (tvoc_stoff == 5) {
    text(nf(tvoc_duelle_werte_mensch[4], 0, 1), Stoff5.x - 90, 250);
    image(Stoff5_bild, Stoff5.x - 50, 210);
    float points = tvoc_duelle_werte_mensch[4];
    String skala = "";
    if (points < 0.5) {
      skala = "nicht wahrnehmbar";
    } else if (points < 1.5) {
      skala = "sehr schwach";
    } else if (points < 2.5) {
      skala = "schwach";
    } else if (points < 3.5) {
      skala = "deutlich";
    } else if (points < 4.5) {
      skala = "stark";
    } else if (points < 5.5) {
      skala = "sehr stark";
    } else {
      skala = "extrem stark";
    }
    text(skala, Stoff5.x + 70, 260);
    float r = 255*(Stoff5.x - 360)/700;
    float g = 255 - r;
    strokeWeight(4);
    stroke(r, g, 0);
    line(Stoff5.x, 310, Stoff5.x, 350);
    line(Stoff5.x - 20, 330, Stoff5.x, 350);
    line(Stoff5.x, 350, Stoff5.x + 20, 330);
  } else if (tvoc_stoff == 6) {
    text(nf(tvoc_duelle_werte_mensch[5], 0, 1), Stoff6.x - 90, 250);
    image(Stoff6_bild, Stoff6.x - 50, 210);
    float points = tvoc_duelle_werte_mensch[5];
    String skala = "";
    if (points < 0.5) {
      skala = "nicht wahrnehmbar";
    } else if (points < 1.5) {
      skala = "sehr schwach";
    } else if (points < 2.5) {
      skala = "schwach";
    } else if (points < 3.5) {
      skala = "deutlich";
    } else if (points < 4.5) {
      skala = "stark";
    } else if (points < 5.5) {
      skala = "sehr stark";
    } else {
      skala = "extrem stark";
    }
    text(skala, Stoff6.x + 70, 260);
    float r = 255*(Stoff6.x - 360)/700;
    float g = 255 - r;
    strokeWeight(4);
    stroke(r, g, 0);
    line(Stoff6.x, 310, Stoff6.x, 350);
    line(Stoff6.x - 20, 330, Stoff6.x, 350);
    line(Stoff6.x, 350, Stoff6.x + 20, 330);
  } else if (tvoc_stoff == 7) {
    text(nf(tvoc_duelle_werte_mensch[6], 0, 1), Stoff7.x - 90, 250);
    image(Stoff7_bild, Stoff7.x - 50, 210);
    float points = tvoc_duelle_werte_mensch[6];
    String skala = "";
    if (points < 0.5) {
      skala = "nicht wahrnehmbar";
    } else if (points < 1.5) {
      skala = "sehr schwach";
    } else if (points < 2.5) {
      skala = "schwach";
    } else if (points < 3.5) {
      skala = "deutlich";
    } else if (points < 4.5) {
      skala = "stark";
    } else if (points < 5.5) {
      skala = "sehr stark";
    } else {
      skala = "extrem stark";
    }
    text(skala, Stoff7.x + 70, 260);
    float r = 255*(Stoff7.x - 360)/700;
    float g = 255 - r;
    strokeWeight(4);
    stroke(r, g, 0);
    line(Stoff7.x, 310, Stoff7.x, 350);
    line(Stoff7.x - 20, 330, Stoff7.x, 350);
    line(Stoff7.x, 350, Stoff7.x + 20, 330);
  } else if (tvoc_stoff == 8) {
    text(nf(tvoc_duelle_werte_mensch[7], 0, 1), Stoff8.x - 90, 250);
    image(Stoff8_bild, Stoff8.x - 50, 210);
    float points = tvoc_duelle_werte_mensch[7];
    String skala = "";
    if (points < 0.5) {
      skala = "nicht wahrnehmbar";
    } else if (points < 1.5) {
      skala = "sehr schwach";
    } else if (points < 2.5) {
      skala = "schwach";
    } else if (points < 3.5) {
      skala = "deutlich";
    } else if (points < 4.5) {
      skala = "stark";
    } else if (points < 5.5) {
      skala = "sehr stark";
    } else {
      skala = "extrem stark";
    }
    text(skala, Stoff1.x + 70, 260);
    float r = 255*(Stoff8.x - 360)/700;
    float g = 255 - r;
    strokeWeight(4);
    stroke(r, g, 0);
    line(Stoff8.x, 310, Stoff8.x, 350);
    line(Stoff8.x - 20, 330, Stoff8.x, 350);
    line(Stoff8.x, 350, Stoff8.x + 20, 330);
  } 
  //Messung des Sensors
  if (index > 1) {
    float x = sgp_tvoc_data[index - 1];
    x = (x * float(Kalibrierung_Station2_2.replace(',', '.')) + 290)*scale_factor;
    if (x > 990*scale_factor) {
      x = 990*scale_factor;
    }
    imageMode(CENTER);
    if (tvoc_stoff == 1) {
      image(Stoff1_bild, x, 510);
      tvoc_duelle_werte_sensor[0] = (x - 290)/70;
      text(nf(tvoc_duelle_werte_sensor[0], 0, 1), x - 90, 520);

      float points = 6*(x-290)/700;
      String skala = "";
      if (points < 0.5) {
        skala = "nicht wahrnehmbar";
      } else if (points < 1.5) {
        skala = "sehr schwach";
      } else if (points < 2.5) {
        skala = "schwach";
      } else if (points < 3.5) {
        skala = "deutlich";
      } else if (points < 4.5) {
        skala = "stark";
      } else if (points < 5.5) {
        skala = "sehr stark";
      } else {
        skala = "extrem stark";
      }
      textAlign(CENTER);
      text(skala +  "\n(in ppb: " + sgp_tvoc_data[index - 1] + ")", x + 170, 520);
      textAlign(CORNER);
    } else if (tvoc_stoff == 2) {
      image(Stoff2_bild, x, 510);
      tvoc_duelle_werte_sensor[1] = (x - 290)/70;
      text(nf(tvoc_duelle_werte_sensor[1], 0, 1), x - 90, 520);
      float points = 6*(x-290)/700;
      String skala = "";
      if (points < 0.5) {
        skala = "nicht wahrnehmbar";
      } else if (points < 1.5) {
        skala = "sehr schwach";
      } else if (points < 2.5) {
        skala = "schwach";
      } else if (points < 3.5) {
        skala = "deutlich";
      } else if (points < 4.5) {
        skala = "stark";
      } else if (points < 5.5) {
        skala = "sehr stark";
      } else {
        skala = "extrem stark";
      }
      textAlign(CENTER);
      text(skala +  "\n(in ppb: " + sgp_tvoc_data[index - 1] + ")", x + 170, 520);
      textAlign(CORNER);
    } else if (tvoc_stoff == 3) {
      image(Stoff3_bild, x, 510);
      tvoc_duelle_werte_sensor[2] = (x - 290)/70;
      text(nf(tvoc_duelle_werte_sensor[2], 0, 1), x - 90, 520);
      float points = 6*(x-290)/700;
      String skala = "";
      if (points < 0.5) {
        skala = "nicht wahrnehmbar";
      } else if (points < 1.5) {
        skala = "sehr schwach";
      } else if (points < 2.5) {
        skala = "schwach";
      } else if (points < 3.5) {
        skala = "deutlich";
      } else if (points < 4.5) {
        skala = "stark";
      } else if (points < 5.5) {
        skala = "sehr stark";
      } else {
        skala = "extrem stark";
      }
      textAlign(CENTER);
      text(skala +  "\n(in ppb: " + sgp_tvoc_data[index - 1] + ")", x + 170, 520);
      textAlign(CORNER);
    } else if (tvoc_stoff == 4) {
      image(Stoff4_bild, x, 510);
      tvoc_duelle_werte_sensor[3] = (x - 290)/70;
      text(nf(tvoc_duelle_werte_sensor[3], 0, 1), x - 90, 520);
      float points = 6*(x-290)/700;
      String skala = "";
      if (points < 0.5) {
        skala = "nicht wahrnehmbar";
      } else if (points < 1.5) {
        skala = "sehr schwach";
      } else if (points < 2.5) {
        skala = "schwach";
      } else if (points < 3.5) {
        skala = "deutlich";
      } else if (points < 4.5) {
        skala = "stark";
      } else if (points < 5.5) {
        skala = "sehr stark";
      } else {
        skala = "extrem stark";
      }
      textAlign(CENTER);
      text(skala +  "\n(in ppb: " + sgp_tvoc_data[index - 1] + ")", x + 170, 520);
      textAlign(CORNER);
    } else if (tvoc_stoff == 5) {
      image(Stoff5_bild, x, 510);
      tvoc_duelle_werte_sensor[4] = (x - 290)/70;
      text(nf(tvoc_duelle_werte_sensor[4], 0, 1), x - 90, 520);
      float points = 6*(x-290)/700;
      String skala = "";
      if (points < 0.5) {
        skala = "nicht wahrnehmbar";
      } else if (points < 1.5) {
        skala = "sehr schwach";
      } else if (points < 2.5) {
        skala = "schwach";
      } else if (points < 3.5) {
        skala = "deutlich";
      } else if (points < 4.5) {
        skala = "stark";
      } else if (points < 5.5) {
        skala = "sehr stark";
      } else {
        skala = "extrem stark";
      }
      textAlign(CENTER);
      text(skala +  "\n(in ppb: " + sgp_tvoc_data[index - 1] + ")", x + 170, 520);
      textAlign(CORNER);
    } else if (tvoc_stoff == 6) {
      image(Stoff6_bild, x, 510);
      tvoc_duelle_werte_sensor[5] = (x - 290)/70;
      text(nf(tvoc_duelle_werte_sensor[5], 0, 1), x - 90, 520);
      float points = 6*(x-290)/700;
      String skala = "";
      if (points < 0.5) {
        skala = "nicht wahrnehmbar";
      } else if (points < 1.5) {
        skala = "sehr schwach";
      } else if (points < 2.5) {
        skala = "schwach";
      } else if (points < 3.5) {
        skala = "deutlich";
      } else if (points < 4.5) {
        skala = "stark";
      } else if (points < 5.5) {
        skala = "sehr stark";
      } else {
        skala = "extrem stark";
      }
      textAlign(CENTER);
      text(skala +  "\n(in ppb: " + sgp_tvoc_data[index - 1] + ")", x + 170, 520);
      textAlign(CORNER);
    } else if (tvoc_stoff == 7) {
      image(Stoff7_bild, x, 510);
      tvoc_duelle_werte_sensor[6] = (x - 290)/70;
      text(nf(tvoc_duelle_werte_sensor[6], 0, 1), x - 90, 520);
      float points = 6*(x-290)/700;
      String skala = "";
      if (points < 0.5) {
        skala = "nicht wahrnehmbar";
      } else if (points < 1.5) {
        skala = "sehr schwach";
      } else if (points < 2.5) {
        skala = "schwach";
      } else if (points < 3.5) {
        skala = "deutlich";
      } else if (points < 4.5) {
        skala = "stark";
      } else if (points < 5.5) {
        skala = "sehr stark";
      } else {
        skala = "extrem stark";
      }
      textAlign(CENTER);
      text(skala +  "\n(in ppb: " + sgp_tvoc_data[index - 1] + ")", x + 170, 520);
      textAlign(CORNER);
    } else if (tvoc_stoff == 8) {
      image(Stoff8_bild, x, 510);
      tvoc_duelle_werte_sensor[7] = (x - 290)/70;
      text(nf(tvoc_duelle_werte_sensor[7], 0, 1), x - 90, 520);
      float points = 6*(x-290)/700;
      String skala = "";
      if (points < 0.5) {
        skala = "nicht wahrnehmbar";
      } else if (points < 1.5) {
        skala = "sehr schwach";
      } else if (points < 2.5) {
        skala = "schwach";
      } else if (points < 3.5) {
        skala = "deutlich";
      } else if (points < 4.5) {
        skala = "stark";
      } else if (points < 5.5) {
        skala = "sehr stark";
      } else {
        skala = "extrem stark";
      }
      textAlign(CENTER);
      text(skala +  "\n(in ppb: " + sgp_tvoc_data[index - 1] + ")", x + 170, 520);
      textAlign(CORNER);
    }
    imageMode(CORNER);
    float r_sensor = 255*(x - 290)/700;
    float g_sensor = 255 - r_sensor;
    strokeWeight(4);
    stroke(r_sensor, g_sensor, 0);
    line(x, 560, x, 600);
    line(x - 20, 580, x, 600);
    line(x, 600, x + 20, 580);
  }
  strokeWeight(1);

  zur_Auswertung.y = 470;
}


void Auswertung_Station3() {
  textFont(normal);

  fill(255);
  // noStroke();
  //size(1280, 720);
  stroke(0);
  rect(50, 20, 500, 330); 
  rect(590, 20, 500, 330); 
  rect(50, 370, 500, 330); 
  rect(590, 370, 500, 330); 


  noStroke();
  fill(100);
  text("Geruch", 150, 330);
  text("Sensor", 280, 330);

  text("Geruch", 150, 680);
  text("Sensor", 280, 680);

  text("Geruch", 690, 330);
  text("Sensor", 820, 330);

  text("Geruch", 690, 680);
  text("Sensor", 820, 680);


  image(Stoff1_bild, 435, 80);
  image(Stoff2_bild, 435, 240);

  image(Stoff3_bild, 975, 80);
  image(Stoff4_bild, 975, 240);

  image(Stoff5_bild, 435, 430);
  image(Stoff6_bild, 435, 595);

  image(Stoff7_bild, 975, 595);
  image(Stoff8_bild, 975, 430);

  fill(255, 100, 100);
  rect(430, 25, 110, 50);
  rect(430, 375, 110, 50);
  rect(970, 25, 110, 50);
  rect(970, 375, 110, 50);
  fill(100, 255, 100);
  rect(430, 190, 110, 50);
  rect(430, 540, 110, 50);
  rect(970, 190, 110, 50);
  rect(970, 540, 110, 50);

  fill(0);
  textSize(14);
  textAlign(CENTER);
  text("mit Lösungs-\nmitteln", 485, 45);
  text("ohne Lösungs-\nmitteln", 485, 210);

  text("herkömmlich", 1025, 52);
  text("VOC-frei", 1025, 218);

  text("mit Lösungs-\nmitteln", 485, 395);
  text("VOC-frei", 485, 570);

  text("PVC", 1025, 405);
  text("Parkett", 1025, 570);


  stroke(200);
  fill(255);
  rect(125, 75, 250, 225);
  rect(665, 75, 250, 225);
  rect(125, 425, 250, 225);
  rect(665, 425, 250, 225);
  for (int i = 1; i < 6; i++) {
    line(125, 75 + 37.5*i, 375, 75 + 37.5*i);
    line(665, 75 + 37.5*i, 915, 75 + 37.5*i);
    line(125, 425 + 37.5*i, 375, 425 + 37.5*i);
    line(665, 425 + 37.5*i, 915, 425 + 37.5*i);
  }
  fill(0);
  for (int i = 0; i < 7; i++) {
    text(6-i, 100, 80 + 37.5*i);
    text(6-i, 640, 80 + 37.5*i);
    text(6-i, 100, 430 + 37.5*i);
    text(6-i, 640, 430 + 37.5*i);
  }

  textSize(26);
  text("Lacke", 250, 60);
  text("Filzstifte", 800, 60);
  text("Kleber", 250, 400);
  text("Böden", 800, 400);

  textSize(20);
  pushMatrix();
  translate(width/2, height/2);
  rotate(3*PI/2);
  text("Riechskala", height/2 -180, -width/2 +80);
  text("Riechskala", height/2 -180, -width/2 +620);
  text("Riechskala", height/2 -525, -width/2 +620);
  text("Riechskala", height/2 -525, -width/2 +80);
  popMatrix();


  textSize(20);
  text("Legende", 1190, 30);
  textSize(16);
  textAlign(LEFT);
  text("0: nicht wahrnehmbar", 1100, 60);
  text("1: sehr schwach", 1100, 80);
  text("2: schwach", 1100, 100);
  text("3: deutlich", 1100, 120);
  text("4: stark", 1100, 140);
  text("5: sehr stark", 1100, 160);
  text("6: extrem stark", 1100, 180);

  fill(255, 100, 100);
  stroke(0);
  rect(150, 300, 30, - 37.5*tvoc_duelle_werte_mensch[0]);
  rect(280, 300, 30, -37.5*6*tvoc_duelle_werte_sensor[0]/10);

  rect(690, 300, 30, - 37.5*tvoc_duelle_werte_mensch[2]);
  rect(820, 300, 30, -37.5*6*tvoc_duelle_werte_sensor[2]/10);

  rect(150, 650, 30, - 37.5*tvoc_duelle_werte_mensch[4]);
  rect(280, 650, 30, -37.5*6*tvoc_duelle_werte_sensor[4]/10);

  rect(690, 650, 30, - 37.5*tvoc_duelle_werte_mensch[6]);
  rect(820, 650, 30, -37.5*6*tvoc_duelle_werte_sensor[6]/10);

  fill(100, 255, 100);

  rect(190, 300, 30, - 37.5*tvoc_duelle_werte_mensch[1]);
  rect(320, 300, 30, -37.5*6*tvoc_duelle_werte_sensor[1]/10);

  rect(730, 300, 30, - 37.5*tvoc_duelle_werte_mensch[3]);
  rect(860, 300, 30, -37.5*6*tvoc_duelle_werte_sensor[3]/10);

  rect(190, 650, 30, - 37.5*tvoc_duelle_werte_mensch[5]);
  rect(320, 650, 30, -37.5*6*tvoc_duelle_werte_sensor[5]/10);

  rect(730, 650, 30, - 37.5*tvoc_duelle_werte_mensch[7]);
  rect(860, 650, 30, -37.5*6*tvoc_duelle_werte_sensor[7]/10);

  TVOC_analyse.show();
}



void Analyse() {
  textFont(normal);
  text("Fahre mit der Maus über die gestesteten Stoffe, um ein Spektrum der Komponenten der Stoffe zu sehen", 20, 50);
  textFont(bold);
  text("Gaschromatographie-Spektrum", 280, 110);
  text("Hauptbestandteile", 800, 110);
  text("Einschätzung", 280, 450);
  image(Stoff1_bild, 20, 100);
  image(Stoff2_bild, 130, 100);
  image(Stoff3_bild, 20, 250);
  image(Stoff4_bild, 130, 250);
  image(Stoff5_bild, 20, 400);
  image(Stoff6_bild, 130, 400);
  image(Stoff7_bild, 20, 550);
  image(Stoff8_bild, 130, 550);

  if (mouseX > 20*scale_factor && mouseX < 120*scale_factor && mouseY >100*scale_factor && mouseY < 200*scale_factor) {
    image(Stinkelack, 280, 130);
    textFont(normal);
    text("- Bestandteil 1\n- Bestandteil 2\n- ...", 800, 150);
    text("Stinkelack stinkt und ist nicht so dufte für die Gesundheit", 280, 490);
  }
  if (mouseX > 130*scale_factor && mouseX < 230*scale_factor && mouseY >100*scale_factor && mouseY < 200*scale_factor) {
    image(Eco_Lack, 280, 130);
    textFont(normal);
    text("- Bestandteil 1\n- Bestandteil 2\n- ...", 800, 150);
    text("Es ist Obst im Haus", 280, 490);
  }

  if (mouseX > 20*scale_factor && mouseX < 120*scale_factor && mouseY >250*scale_factor && mouseY < 350*scale_factor) {
    image(Edding, 280, 130);
    textFont(normal);
    text("- Bestandteil 1\n- Bestandteil 2\n- ...", 800, 150);
    text("Edding stinkt und ist nicht so dufte für die Gesundheit", 280, 490);
  }
  if (mouseX > 130*scale_factor && mouseX < 230*scale_factor && mouseY >250*scale_factor && mouseY < 350*scale_factor) {
    image(Eco_Edding, 280, 130);
    textFont(normal);
    text("- Bestandteil 1\n- Bestandteil 2\n- ...", 800, 150);
    text("Es ist Obst im Haus", 280, 490);
  }


  if (mouseX > 20*scale_factor && mouseX < 120*scale_factor && mouseY >400*scale_factor && mouseY < 500*scale_factor) {
    image(Sekundenkleber, 280, 130);
    textFont(normal);
    text("- Bestandteil 1\n- Bestandteil 2\n- ...", 800, 150);
    text("Sekundenkleber stinkt und ist nicht so dufte für die Gesundheit", 280, 490);
  }
  if (mouseX > 130*scale_factor && mouseX < 230*scale_factor && mouseY >400*scale_factor && mouseY < 500*scale_factor) {
    image(Eco_Kleber, 280, 130);
    textFont(normal);
    text("- Bestandteil 1\n- Bestandteil 2\n- ...", 800, 150);
    text("Es ist Obst im Haus", 280, 490);
  }


  if (mouseX > 20*scale_factor && mouseX < 120*scale_factor && mouseY >550*scale_factor && mouseY < 650*scale_factor) {
    image(Kork, 280, 130);
    textFont(normal);
    text("- Bestandteil 1\n- Bestandteil 2\n- ...", 800, 150);
    text("Kork stinkt und ist nicht so dufte für die Gesundheit", 280, 490);
  }
  if (mouseX > 130*scale_factor && mouseX < 230*scale_factor && mouseY >550*scale_factor && mouseY < 650*scale_factor) {
    image(Eco_Boden, 280, 130);
    textFont(normal);
    text("- Bestandteil 1\n- Bestandteil 2\n- ...", 800, 150);
    text("Es ist Obst im Haus", 280, 490);
  }



  //Eco_Boden 
  //Eco_Edding
  //Eco_Kleber 
  //Kork
  //Sekundenkleber 
  //Edding 
  //Stinkelack 
  //Eco_Lack 


  strokeWeight(2);
  stroke(0);
  line(250, 80, 250, 720);
  line(0, 80, 1280, 80);
  line(250, 420, 1280, 420);
  line(780, 80, 780, 420);
}




void Zusammenfassung_Mensch_Sensor() {
  TVOC_Duelle_uebertragen.show();
  translate(0, 40);
  noFill();
  stroke(0);
  rect(200, 50, 400, 550);  
  rect(50, 150, 550, 450);
  rect(350, 600, 250, 70);

  rect(680, 50, 400, 550);
  rect(680, 150, 400, 450);
  rect(680, 600, 250, 70);


  for (int i = 0; i < 2; i++) {
    for (int j = 0; j < 4; j++) {
      rect(360 + 130*i, 170 + 105*j, 90, 90); 
      rect(700 + 130*i, 170 + 105*j, 90, 90);
    }
  }


  textFont(bold);
  textSize(30);
  textAlign(CENTER);
  text("herkömmliche\nProdukte", 400, 90);
  text("emissionsarme\nVergleichsprodukte", 880, 90);

  text("Nase     Sensor", 485, 645);
  text("Nase     Sensor", 810, 645);
  textFont(normal);
  textSize(35);
  text("Farben", 125, 215);
  text("Filzstifte", 125, 320);
  text("Kleber", 125, 425);
  text("Böden", 125, 530);

  for (int i = 0; i < 5; i++) {
    text("vs.", 645, 120 + 105*i);
  }


  text(nf(tvoc_duelle_werte_mensch[0], 0, 1), 405, 225 + 105*0); 
  text(nf(tvoc_duelle_werte_mensch[1], 0, 1), 745, 225 + 105*0);
  text(nf(tvoc_duelle_werte_mensch[2], 0, 1), 405, 225 + 105*1); 
  text(nf(tvoc_duelle_werte_mensch[3], 0, 1), 745, 225 + 105*1); 
  text(nf(tvoc_duelle_werte_mensch[4], 0, 1), 745, 225 + 105*2); 
  text(nf(tvoc_duelle_werte_mensch[5], 0, 1), 405, 225 + 105*2); 
  text(nf(tvoc_duelle_werte_mensch[6], 0, 1), 405, 225 + 105*3); 
  text(nf(tvoc_duelle_werte_mensch[7], 0, 1), 745, 225 + 105*3); 


  text(nf(tvoc_duelle_werte_sensor[0], 0, 1), 535, 225 + 105*0); 
  text(nf(tvoc_duelle_werte_sensor[1], 0, 1), 875, 225 + 105*0);
  text(nf(tvoc_duelle_werte_sensor[2], 0, 1), 535, 225 + 105*1); 
  text(nf(tvoc_duelle_werte_sensor[3], 0, 1), 875, 225 + 105*1); 
  text(nf(tvoc_duelle_werte_sensor[4], 0, 1), 875, 225 + 105*2); 
  text(nf(tvoc_duelle_werte_sensor[5], 0, 1), 535, 225 + 105*2); 
  text(nf(tvoc_duelle_werte_sensor[6], 0, 1), 535, 225 + 105*3); 
  text(nf(tvoc_duelle_werte_sensor[7], 0, 1), 875, 225 + 105*3); 




  textAlign(CORNER);
  image(Stoff1_bild, 230, 170);
  image(Stoff2_bild, 950, 170);
  image(Stoff3_bild, 230, 275);
  image(Stoff4_bild, 950, 275);
  image(Stoff5_bild, 230, 380);
  image(Stoff6_bild, 950, 380);
  image(Stoff7_bild, 230, 485);
  image(Stoff8_bild, 950, 485);
  zur_Auswertung.show();  
  zur_Auswertung.y = 530;
  if (zur_Auswertung.isClicked()) {
    delay(200);
    page = 3.1111;
  }
  translate(0, -40);
}
