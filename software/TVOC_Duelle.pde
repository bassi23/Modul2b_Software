void TVOC_Duelle() {
  two.active = false;
  three.active = false;
  Sensormessung.visible = false;
  textSize(20);
  fill(0);
  textFont(bold);
  text("Station 3 - TVOC-Duelle", 20, 50);
  textFont(normal);
  text("Vergleiche verschiedene Materialien auf die Ausdünstung von flüchtigen organischen Verbindungen (TVOC). Welche Stoffe\nemittieren am meisten? Gib zuvor eine Prognose ab, indem du an den Stoffen riechst.", 20, 100);
  stroke(0);
  line(0, 180, 1280, 180);
  noStroke();
  textFont(bold);
  text("a) Riechen", 20, 220);
  textFont(normal);
  text("\nOrdne die Emission der folgenden Stoffe auf der unteren Skala an! Vergib Punkte von 0 (nicht wahrnehmbar) bis\n6(extrem stark).", 20, 220); 
  TVOC_Duelle_Start.show();
  if (TVOC_Duelle_Start.isClicked()) {
    delay(200);
    page = 3.1;
  }
  Duell_Runde = 1;
}

int Duell_Runde = 1;

void TVOC_Duelle_Riechen() {
  weiter_zum_Sensor.hide();
  textSize(20);
  fill(0);
  textFont(bold);
  text("Station 3 - TVOC-Duelle", 20, 50);
  textFont(normal);
  text("Vergleiche verschiedene Materialien auf die Ausdünstung von flüchtigen organischen Verbindungen (TVOC). Welche Stoffe\nemittieren am meisten? Gib zuvor eine Prognose ab, indem du an den Stoffen riechst.", 20, 100);
  stroke(0);
  line(0, 180, 1280, 180);
  noStroke();
  textFont(bold);
  text("a) Riechen", 20, 220);
  textFont(normal);
  text("\nOrdne die Emission der folgenden Stoffe auf der unteren Skala an! Vergib Punkte von 0 (nicht wahrnehmbar) bis\n6(extrem stark).", 20, 220); 
  text("nicht wahrnehmbar (0)", 50, 480);
  text("extrem stark (6)", 1050, 480);
  TVOC_Duelle_Start.hide();


  for (int i = 0; i < 200; i++) {
    fill(255*(float(i)/200), 255-255*(float(i)/200), 0);
    rect(240 + 4*i, 450, 4, 50);
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


  if (Duell_Runde < 5) {
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
  } else if (Duell_Runde == 5) {
    Stoff9.show();
    Stoff10.show();
    weiter_zum_Sensor.show();
  }
  if (weiter_zum_Sensor.isClicked()) {
    delay(200);
    weiter_zum_Sensor.hide();

    page = 3.11;
  }

  tvoc_duelle_werte_mensch[0] = 6*(Stoff1.x - 240)/800;
  tvoc_duelle_werte_mensch[1] = 6*(Stoff2.x- 240)/800;
  tvoc_duelle_werte_mensch[2] = 6*(Stoff3.x- 240)/800;
  tvoc_duelle_werte_mensch[3] = 6*(Stoff4.x- 240)/800;
  tvoc_duelle_werte_mensch[4] = 6*(Stoff5.x- 240)/800;
  tvoc_duelle_werte_mensch[5] = 6*(Stoff6.x- 240)/800;
  tvoc_duelle_werte_mensch[6] = 6*(Stoff7.x- 240)/800;
  tvoc_duelle_werte_mensch[7] = 6*(Stoff8.x- 240)/800;
  tvoc_duelle_werte_mensch[8] = 6*(Stoff9.x- 240)/800;
  tvoc_duelle_werte_mensch[9] = 6*(Stoff10.x- 240)/800;
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
    float points = (x-240)/80;
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

    if (mouseX > (x - image.width/2) && mouseX < (x + image.width/2) && (mouseY - scroll) > (y - image.height/2) && (mouseY - scroll) < (y + image.height/2) && mousePressed && mouseX > 240 && mouseX < 1040) {
      x = mouseX;
    }

    float r = 255*(x - 240)/800;
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

  if (tvoc_stoff < 10) {
    naechster_Stoff.show();
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
  text("\nMiss nun die verschiedenen Stoffe, indem du sie in die Gläser legst und unter den Sensor schraubst. Vergleiche die Messwerte\nmit deiner Vorhersage.", 20, 50);

  text("Miss die Emission von Stoff " + tvoc_stoff +". Warte dabei bis sich ein Gleichgewicht eingestellt hat.", 20, 150);
  textFont(bold);
  text("Deine Einschätzung", 20, 200);
  text("Messung des\nSensors", 20, 450);
  textFont(normal);
  stroke(0);
  line(0, 125, 1280, 125);
  noStroke();
  for (int i = 0; i < 50; i++) {
    fill(255*(float(i)/50), 255-255*(float(i)/50), 0);
    rect(240 + 16*i, 350, 16, 50);
    rect(240 + 16*i, 600, 16, 50);
  }

  if (tvoc_stoff == 1) {
    //Meine Vorhersage
    image(Stoff1_bild, Stoff1.x - 50, 210);
    float r = 255*(Stoff1.x - 310)/800;
    float g = 255 - r;
    strokeWeight(4);
    stroke(r, g, 0);
    line(Stoff1.x, 310, Stoff1.x, 350);
    line(Stoff1.x - 20, 330, Stoff1.x, 350);
    line(Stoff1.x, 350, Stoff1.x + 20, 330);
  } else if (tvoc_stoff == 2) {
    image(Stoff2_bild, Stoff2.x - 50, 210);
    float r = 255*(Stoff2.x - 310)/800;
    float g = 255 - r;
    strokeWeight(4);
    stroke(r, g, 0);
    line(Stoff2.x, 310, Stoff2.x, 350);
    line(Stoff2.x - 20, 330, Stoff2.x, 350);
    line(Stoff2.x, 350, Stoff2.x + 20, 330);
  } else if (tvoc_stoff == 3) {
    image(Stoff3_bild, Stoff3.x - 50, 210);
    float r = 255*(Stoff3.x - 310)/800;
    float g = 255 - r;
    strokeWeight(4);
    stroke(r, g, 0);
    line(Stoff3.x, 310, Stoff3.x, 350);
    line(Stoff3.x - 20, 330, Stoff3.x, 350);
    line(Stoff3.x, 350, Stoff3.x + 20, 330);
  } else if (tvoc_stoff == 4) {
    image(Stoff4_bild, Stoff4.x - 50, 210);
    float r = 255*(Stoff4.x - 310)/800;
    float g = 255 - r;
    strokeWeight(4);
    stroke(r, g, 0);
    line(Stoff4.x, 310, Stoff4.x, 350);
    line(Stoff4.x - 20, 330, Stoff4.x, 350);
    line(Stoff4.x, 350, Stoff4.x + 20, 330);
  } else if (tvoc_stoff == 5) {
    image(Stoff5_bild, Stoff5.x - 50, 210);
    float r = 255*(Stoff5.x - 310)/800;
    float g = 255 - r;
    strokeWeight(4);
    stroke(r, g, 0);
    line(Stoff5.x, 310, Stoff5.x, 350);
    line(Stoff5.x - 20, 330, Stoff5.x, 350);
    line(Stoff5.x, 350, Stoff5.x + 20, 330);
  } else if (tvoc_stoff == 6) {
    image(Stoff6_bild, Stoff6.x - 50, 210);
    float r = 255*(Stoff6.x - 310)/800;
    float g = 255 - r;
    strokeWeight(4);
    stroke(r, g, 0);
    line(Stoff6.x, 310, Stoff6.x, 350);
    line(Stoff6.x - 20, 330, Stoff6.x, 350);
    line(Stoff6.x, 350, Stoff6.x + 20, 330);
  } else if (tvoc_stoff == 7) {
    image(Stoff7_bild, Stoff7.x - 50, 210);
    float r = 255*(Stoff7.x - 310)/800;
    float g = 255 - r;
    strokeWeight(4);
    stroke(r, g, 0);
    line(Stoff7.x, 310, Stoff7.x, 350);
    line(Stoff7.x - 20, 330, Stoff7.x, 350);
    line(Stoff7.x, 350, Stoff7.x + 20, 330);
  } else if (tvoc_stoff == 8) {
    image(Stoff8_bild, Stoff8.x - 50, 210);
    float r = 255*(Stoff8.x - 310)/800;
    float g = 255 - r;
    strokeWeight(4);
    stroke(r, g, 0);
    line(Stoff8.x, 310, Stoff8.x, 350);
    line(Stoff8.x - 20, 330, Stoff8.x, 350);
    line(Stoff8.x, 350, Stoff8.x + 20, 330);
  } else if (tvoc_stoff == 9) {
    image(Stoff9_bild, Stoff9.x - 50, 210);
    float r = 255*(Stoff9.x - 310)/800;
    float g = 255 - r;
    strokeWeight(4);
    stroke(r, g, 0);
    line(Stoff9.x, 310, Stoff9.x, 350);
    line(Stoff9.x - 20, 330, Stoff9.x, 350);
    line(Stoff9.x, 350, Stoff9.x + 20, 330);
  } else if (tvoc_stoff == 10) {
    image(Stoff10_bild, Stoff10.x - 50, 210);
    float r = 255*(Stoff9.x - 310)/800;
    float g = 255 - r;
    strokeWeight(4);
    stroke(r, g, 0);
    line(Stoff10.x, 310, Stoff10.x, 350);
    line(Stoff10.x - 20, 330, Stoff10.x, 350);
    line(Stoff10.x, 350, Stoff10.x + 20, 330);
  }
  //Messung des Sensors
  if (index > 1) {
    float x = sgp_tvoc_data[index - 1];
    x = 800*x/1000 + 240;
    if (x > 1040) {
      x = 1040;
    }
    imageMode(CENTER);
    if (tvoc_stoff == 1) {
      image(Stoff1_bild, x, 510);
      tvoc_duelle_werte_sensor[0] = (x - 240)/80;
    } else if (tvoc_stoff == 2) {
      image(Stoff2_bild, x, 510);
      tvoc_duelle_werte_sensor[1] = (x - 240)/80;
    } else if (tvoc_stoff == 3) {
      image(Stoff3_bild, x, 510);
      tvoc_duelle_werte_sensor[2] = (x - 240)/80;
    } else if (tvoc_stoff == 4) {
      image(Stoff4_bild, x, 510);
      tvoc_duelle_werte_sensor[3] = (x - 240)/80;
    } else if (tvoc_stoff == 5) {
      image(Stoff5_bild, x, 510);
      tvoc_duelle_werte_sensor[4] = (x - 240)/80;
    } else if (tvoc_stoff == 6) {
      image(Stoff6_bild, x, 510);
      tvoc_duelle_werte_sensor[5] = (x - 240)/80;
    } else if (tvoc_stoff == 7) {
      image(Stoff7_bild, x, 510);
      tvoc_duelle_werte_sensor[6] = (x - 240)/80;
    } else if (tvoc_stoff == 8) {
      image(Stoff8_bild, x, 510);
      tvoc_duelle_werte_sensor[7] = (x - 240)/80;
    } else if (tvoc_stoff == 9) {
      image(Stoff9_bild, x, 510);
      tvoc_duelle_werte_sensor[8] = (x - 240)/80;
    } else if (tvoc_stoff == 10) {
      image(Stoff10_bild, x, 510);
      tvoc_duelle_werte_sensor[9] = (x - 240)/80;
    }
    imageMode(CORNER);
    float r_sensor = 255*(x - 240)/800;
    float g_sensor = 255 - r_sensor;
    strokeWeight(4);
    stroke(r_sensor, g_sensor, 0);
    line(x, 560, x, 600);
    line(x - 20, 580, x, 600);
    line(x, 600, x + 20, 580);
  }
  strokeWeight(1);
}


void Auswertung_Station3() {

  fill(0);
  textFont(bold);
  text("TVOC - Emission", 570, 50);
  textFont(normal);
  image(Stoff1_bild, 340, 80);
  image(Stoff2_bild, 840, 80);

  image(Stoff3_bild, 340, 200);
  image(Stoff4_bild, 840, 200);

  image(Stoff5_bild, 340, 320);
  image(Stoff6_bild, 840, 320);

  image(Stoff7_bild, 340, 440);
  image(Stoff8_bild, 840, 440);

  image(Stoff9_bild, 340, 560);
  image(Stoff10_bild, 840, 560);


  fill(255);
  stroke(0);
  rect(440, 80, 400, 100);
  rect(440, 200, 400, 100);
  rect(440, 320, 400, 100);
  rect(440, 440, 400, 100);
  rect(440, 560, 400, 100);

  stroke(0);
  line(440, 130, 840, 130);
  line(440, 250, 840, 250);
  line(440, 370, 840, 370);
  line(440, 490, 840, 490);
  line(440, 610, 840, 610);


  line(640, 80, 640, 180);
  line(640, 200, 640, 300);
  line(640, 320, 640, 420);
  line(640, 440, 640, 540);
  line(640, 560, 640, 660);

  fill(0);
  textAlign(CENTER);
  for (int i = 0; i < 10; i+=2) {
    text(nf(tvoc_duelle_werte_mensch[i], 0, 1), 540, 110 + 60*i); 
    text(nf(tvoc_duelle_werte_mensch[i+1], 0, 1), 740, 110 + 60*i);
    text(nf(6*tvoc_duelle_werte_sensor[i]/10, 0, 1), 540, 160 + 60*i); 
    text(nf(6*tvoc_duelle_werte_sensor[i+1]/10, 0, 1), 740, 160 + 60*i);
  }
  textAlign(CORNER);
  text("Deine Vorhersage", 150, 110);
  text("Sensor", 190, 160);
}
