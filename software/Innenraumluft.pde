void Innenraumluft() {
  one.active = false;
  two.active = false;
  three.active = false;
  four.active = false;
  two_three.active = false;
  fill(0);
  textSize(20);
  text("Station 4 - Innenraumluftqualität", 20, 50);
  text("In diesem Experiment werden wir die Innenraumluftqualität bestimmen. Setze dich jeweils für 5 Minuten in eine Messkammer\nund nimm den Verlauf der Parameter Temperatur, Luftfeuchte, TVOC, CO  und eCO  auf.\nVariiere die Belüftung, indem du den integrierten Ventilator \n\n\n\n\nlaufen lässt. Warte nach jeder Runde, bis sich die Werte wieder normalisiert haben.", 20, 100);
  text("a) ausgeschaltet\nb) auf halber Kraft\nc) auf voller Kraft", 500, 200);

  textSize(14);
  text("2                    2", 730, 140);
  stroke(0);
  Station4a.show();
  Station4agestartet = false;
  indexInnenraumlufta = 0;
}

int t = 300;



float[][] Innenraumlufta = new float[7][5000];
boolean Station4agestartet = false;
boolean Station4aFertig = false;
int indexInnenraumlufta = 0;
int indexInnenraumluftaMax = 0;
float currentTime4a = -10000000;
boolean reset_bool_station4 = false;
int scale_Innenraum1 = 0;
int scale_Innenraum2 = 0;

void Innenraumluft_a() {
  fill(0);
  textSize(20);

  int Rot = -1;
  int Blau = -1;

  float maxRot = 0;
  float minRot = 0;
  float maxBlau = 0;
  float minBlau = 0;

  if (Station4_Rot.name == "Temperatur") {
    Rot = 0;
    maxRot = 10*(scale_Innenraum1+1);
  } else if (Station4_Rot.name == "Luftfeuchte") {
    Rot = 1;
    maxRot = 20*(scale_Innenraum1+1);
  } else if (Station4_Rot.name == "CO2") {
    Rot = 2;
    maxRot = 400*(scale_Innenraum1+1);
  } else if (Station4_Rot.name == "TVOC") {
    Rot = 3;
    maxRot = 100*(scale_Innenraum1+1);
  } else if (Station4_Rot.name == "eCO2") {
    Rot = 4;
    maxRot = 400*(scale_Innenraum1+1);
  }

  if (Station4_Blau.name == "Temperatur") {
    Blau = 0;
    maxBlau = 10*(scale_Innenraum2+1);
  } else if (Station4_Blau.name == "Luftfeuchte") {
    Blau = 1;
    maxBlau = 20*(scale_Innenraum2+1);
  } else if (Station4_Blau.name == "CO2") {
    Blau = 2;
    maxBlau = 400*(scale_Innenraum2+1);
  } else if (Station4_Blau.name == "TVOC") {
    Blau = 3;
    maxBlau = 100*(scale_Innenraum2+1);
  } else if (Station4_Blau.name == "eCO2") {
    Blau = 4;
    maxBlau = 400*(scale_Innenraum2+1);
  }


  if (up1.isClicked()) {
    scale_Innenraum1 += 1;
    if (scale_Innenraum1 > 4) {
      scale_Innenraum1 = 0;
    }
  }
  if (down1.isClicked()) {
    scale_Innenraum1 -= 1;
    if (scale_Innenraum1 < 0) {
      scale_Innenraum1 = 4;
    }
  }
  if (up2.isClicked()) {
    scale_Innenraum2 += 1;
    if (scale_Innenraum2 > 4) {
      scale_Innenraum2 = 0;
    }
  }
  if (down2.isClicked()) {
    scale_Innenraum2 -= 1;
    if (scale_Innenraum2 < 0) {
      scale_Innenraum2 = 4;
    }
  }

  if (Station4Start.isClicked()) {
    Station4agestartet = true;
    if (page == 4.1) {
      currentTime4a = millis();
      indexInnenraumlufta = 0;
    } else if (page == 4.11) {
      currentTime4b = millis();
      indexInnenraumlufta = 0;
    } else if (page == 4.111) {
      currentTime4c = millis();
      indexInnenraumluftc = 0;
    }
  }
  if (station4_MessungWiederholen.isClicked()) {
    if (page == 4.1) {
      currentTime4a = millis();
      indexInnenraumlufta = 0;
    } else if (page == 4.11) {
      currentTime4a = millis();
      indexInnenraumlufta = 0;
    } else if (page == 4.111) {
      currentTime4c = millis();
      indexInnenraumluftc = 0;
    }
  }

  // Zeichne den Hintergrund
  fill(255);
  stroke(0);
  rect(120, 140, 830, 500);
  fill(230);
  rect(1080, -1, 200, 720);
  stroke(100, 100);


  stroke(200);
  for (int i = 0; i < 4; i++) {
    line(120, 240 +100*i, 950, 240 + 100*i);
  }
  fill(0);
  textAlign(CENTER);
  if (Rot != -1) {
    for (int i = 5; i> -1; i--) {
      text(nf((5-i)*maxRot/(5), 0, 0), 85, 150 + 100*i);
    }
  }

  if (Blau != -1) {
    for (int i = 5; i> -1; i--) {
      text(nf((5-i)*maxBlau/(5), 0, 0), 985, 150 + 100*i);
    }
  }
  textAlign(CORNER);
  fill(0);
  noStroke();
  textSize(30);
  text("Optionen", 1120, 50);
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
  textAlign(CORNER);
  plotStation4(Innenraumlufta, 4, minRot, maxRot, color(255, 0, 0));
  plotStation4(Innenraumlufta, Blau, minBlau, maxBlau, color(0, 0, 255));

  fill(0);
  textSize(20);
  text("0", 115, 660);
  text(nf(time_Station4, 0, 0), 938, 660);

  text("Zeit in Sekunden", 455, 700);
  fill(0);
  back.show();
  zumObermenu.show();
  if (Blau != -1) {
    up2.show();
    down2.show();
  } else {
    up2.hide();
    down2.hide();
  }

  if (Rot != -1) {
    up1.show();
    down1.show();
  } else {
    up1.hide();
    down1.hide();
  }

  if (!Station4agestartet) {
    Station4Start.show();

    station4_MessungWiederholen.hide();
  } else {
    Station4Start.hide();
    station4_MessungWiederholen.show();
  }
  Station4_Rot.show();
  Station4_Blau.show();
  aktualisierung_right.show();
  aktualisierung_left.show();

  for (int i = 0; i < 5000; i++) {
    if (Innenraumlufta[6][i] > time_Station4) {
      Station4aFertig = true;
      break;
    } else {
      Station4aFertig = false;
    }
  }
  if (Station4aFertig) {
    Station4b.show();
  } else {
    Station4b.hide();
  }
}

float time_Station4 = 2;

void plotStation4(float[][] array, int index, float min, float max, color c) {
  // 1 Sekunde entspricht "830/time_Station4" Pixel
  stroke(c);
  fill(c);
  strokeWeight(2);
  //rect(120, 140, 830, 500);
  float oneSecond = 830/time_Station4;
  float xOff = array[6][0];

  if (index != -1) {
    for (int i = 1; i < 5000; i++) {
      float x1 = 120 + (array[6][i] - xOff)*oneSecond;
      float x2 = 120 + (array[6][i-1] - xOff)*oneSecond;
      float y1 = 640 - 500*(array[index][i]-min)/(max-min);
      float y2 = 640 - 500*(array[index][i-1]-min)/(max-min);
      if (x2 < 950) {
        if (x1 < 950) {
          float m = (y2 - y1)/(x2-x1);
          float b = y1 - m*x1;
          if (y1 > 640 && y2 < 640 && y2 > 140) {
            y1 = 640;
            x1 = -(b - y1)/m;
          } else if (y2 > 640 && y1 < 640 && y1 > 140) {
            y2 = 640;
            x1 = -(b-y2)/m;
          } else if (y1 < 140 && y2 > 140 && y2 < 640) {

            y1 = 140;
            x1 = (y1-b)/m;
          } else if (y2 < 140 && y1 > 140 && y1 < 640) {
            y2 = 140;
            x2 = -(b-y2)/m;
          } else if (y1 < 140 && y2 > 640) {
            y1 = 140;
            x1 = (y1-b)/m;
            y2 = 640;
            x2 = -(b-y2)/m;
          } else if (y2 < 140 && y1> 640) {
            y2 = 140;
            x2 = (y1-b)/m;
            y1 = 640;
            x1 = -(b-y2)/m;
          }
          if (y1 >= 140 && y2>= 140 && y1 < 640 && y2< 640) {
            line(x1, y1, x2, y2);
          }
        } else {
          float m = (y2 - y1)/(x2-x1);
          float b = y1 - m*x1;
          x1 = 950;
          y1 = m*x2 + b;
          line(x1, y1, x2, y2);
        }
      }
    }
  }
}





float findMax(float[] array) {
  float max = -999;
  for (int i = 0; i < array.length; i++) {
    if (array[i] > max) {
      max = array[i];
    }
  }
  return max;
}

float findMin(float[] array) {
  float min = 99999;
  for (int i = 0; i < array.length; i++) {
    if (array[i] < min && array[i] != 0) {
      min = array[i];
    }
  }
  return min;
}


float[][] Innenraumluftb = new float[7][5000];
boolean Station4bgestartet = false;
boolean Station4bFertig = false;
int indexInnenraumluftb = 0;
int indexInnenraumluftbMax = 0;
float currentTime4b = -10000000;


void Innenraumluft_b() {
  fill(0);
  textSize(20);

  int Rot = -1;
  int Blau = -1;

  float maxRot = 0;
  float minRot = 0;
  float maxBlau = 0;
  float minBlau = 0;

  if (Station4_Rot.name == "Temperatur") {
    Rot = 0;
    maxRot = 10*(scale_Innenraum1+1);
  } else if (Station4_Rot.name == "Luftfeuchte") {
    Rot = 1;
    maxRot = 20*(scale_Innenraum1+1);
  } else if (Station4_Rot.name == "CO2") {
    Rot = 2;
    maxRot = 400*(scale_Innenraum1+1);
  } else if (Station4_Rot.name == "TVOC") {
    Rot = 3;
    maxRot = 100*(scale_Innenraum1+1);
  } else if (Station4_Rot.name == "eCO2") {
    Rot = 4;
    maxRot = 400*(scale_Innenraum1+1);
  }

  if (Station4_Blau.name == "Temperatur") {
    Blau = 0;
    maxBlau = 10*(scale_Innenraum2+1);
  } else if (Station4_Blau.name == "Luftfeuchte") {
    Blau = 1;
    maxBlau = 20*(scale_Innenraum2+1);
  } else if (Station4_Blau.name == "CO2") {
    Blau = 2;
    maxBlau = 400*(scale_Innenraum2+1);
  } else if (Station4_Blau.name == "TVOC") {
    Blau = 3;
    maxBlau = 100*(scale_Innenraum2+1);
  } else if (Station4_Blau.name == "eCO2") {
    Blau = 4;
    maxBlau = 400*(scale_Innenraum2+1);
  }


  if (up1.isClicked()) {
    scale_Innenraum1 += 1;
    if (scale_Innenraum1 > 4) {
      scale_Innenraum1 = 0;
    }
  }
  if (down1.isClicked()) {
    scale_Innenraum1 -= 1;
    if (scale_Innenraum1 < 0) {
      scale_Innenraum1 = 4;
    }
  }
  if (up2.isClicked()) {
    scale_Innenraum2 += 1;
    if (scale_Innenraum2 > 4) {
      scale_Innenraum2 = 0;
    }
  }
  if (down2.isClicked()) {
    scale_Innenraum2 -= 1;
    if (scale_Innenraum2 < 0) {
      scale_Innenraum2 = 4;
    }
  }

  if (Station4Start.isClicked()) {
    Station4bgestartet = true;
    currentTime4b = millis();
    indexInnenraumluftb = 0;
  }
  if (station4_MessungWiederholen.isClicked()) {
    currentTime4b = millis();
    indexInnenraumluftb = 0;
  }

  // Zeichne den Hintergrund
  fill(255);
  stroke(0);
  rect(120, 140, 830, 500);
  fill(230);
  rect(1080, -1, 200, 720);
  stroke(100, 100);


  stroke(200);
  for (int i = 0; i < 4; i++) {
    line(120, 240 +100*i, 950, 240 + 100*i);
  }
  fill(0);
  textAlign(CENTER);
  if (Rot != -1) {
    for (int i = 5; i> -1; i--) {
      text(nf((5-i)*maxRot/(5), 0, 0), 85, 150 + 100*i);
    }
  }

  if (Blau != -1) {
    for (int i = 5; i> -1; i--) {
      text(nf((5-i)*maxBlau/(5), 0, 0), 985, 150 + 100*i);
    }
  }
  textAlign(CORNER);
  fill(0);
  noStroke();
  textSize(30);
  text("Optionen", 1120, 50);
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
  textAlign(CORNER);
  plotStation4(Innenraumluftb, Rot, minRot, maxRot, color(255, 0, 0));
  plotStation4(Innenraumluftb, Blau, minBlau, maxBlau, color(0, 0, 255));

  fill(0);
  textSize(20);
  text("0", 115, 660);
  text(nf(time_Station4, 0, 0), 938, 660);

  text("Zeit in Sekunden", 455, 700);
  fill(0);
  back.show();
  zumObermenu.show();
  if (Blau != -1) {
    up2.show();
    down2.show();
  } else {
    up2.hide();
    down2.hide();
  }

  if (Rot != -1) {
    up1.show();
    down1.show();
  } else {
    up1.hide();
    down1.hide();
  }

  if (!Station4bgestartet) {
    Station4Start.show();

    station4_MessungWiederholen.hide();
  } else {
    Station4Start.hide();
    station4_MessungWiederholen.show();
  }
  Station4_Rot.show();
  Station4_Blau.show();
  aktualisierung_right.show();
  aktualisierung_left.show();

  for (int i = 0; i < 5000; i++) {
    if (Innenraumluftb[6][i] > time_Station4) {
      Station4bFertig = true;
      break;
    } else {
      Station4bFertig = false;
    }
  }
  if (Station4bFertig) {
    Station4c.show();
  } else {
    Station4c.hide();
  }
}




float[][] Innenraumluftc = new float[7][5000];
boolean Station4cgestartet = false;
boolean Station4cFertig = false;
int indexInnenraumluftc = 0;
int indexInnenraumluftcMax = 0;
float currentTime4c = -10000000;


void Innenraumluft_c() {
  fill(0);
  textSize(20);
  int Rot = -1;
  int Blau = -1;

  float maxRot = 0;
  float minRot = 0;
  float maxBlau = 0;
  float minBlau = 0;

  if (Station4_Rot.name == "Temperatur") {
    Rot = 0;
    maxRot = 10*(scale_Innenraum1+1);
  } else if (Station4_Rot.name == "Luftfeuchte") {
    Rot = 1;
    maxRot = 20*(scale_Innenraum1+1);
  } else if (Station4_Rot.name == "CO2") {
    Rot = 2;
    maxRot = 400*(scale_Innenraum1+1);
  } else if (Station4_Rot.name == "TVOC") {
    Rot = 3;
    maxRot = 100*(scale_Innenraum1+1);
  } else if (Station4_Rot.name == "eCO2") {
    Rot = 4;
    maxRot = 400*(scale_Innenraum1+1);
  }

  if (Station4_Blau.name == "Temperatur") {
    Blau = 0;
    maxBlau = 10*(scale_Innenraum2+1);
  } else if (Station4_Blau.name == "Luftfeuchte") {
    Blau = 1;
    maxBlau = 20*(scale_Innenraum2+1);
  } else if (Station4_Blau.name == "CO2") {
    Blau = 2;
    maxBlau = 400*(scale_Innenraum2+1);
  } else if (Station4_Blau.name == "TVOC") {
    Blau = 3;
    maxBlau = 100*(scale_Innenraum2+1);
  } else if (Station4_Blau.name == "eCO2") {
    Blau = 4;
    maxBlau = 400*(scale_Innenraum2+1);
  }


  if (up1.isClicked()) {
    scale_Innenraum1 += 1;
    if (scale_Innenraum1 > 4) {
      scale_Innenraum1 = 0;
    }
  }
  if (down1.isClicked()) {
    scale_Innenraum1 -= 1;
    if (scale_Innenraum1 < 0) {
      scale_Innenraum1 = 4;
    }
  }
  if (up2.isClicked()) {
    scale_Innenraum2 += 1;
    if (scale_Innenraum2 > 4) {
      scale_Innenraum2 = 0;
    }
  }
  if (down2.isClicked()) {
    scale_Innenraum2 -= 1;
    if (scale_Innenraum2 < 0) {
      scale_Innenraum2 = 4;
    }
  }

  if (Station4Start.isClicked()) {
    Station4cgestartet = true;
    currentTime4c = millis();
    indexInnenraumluftc = 0;
  }
  if (station4_MessungWiederholen.isClicked()) {
    currentTime4c = millis();
    indexInnenraumluftc = 0;
  }

  // Zeichne den Hintergrund
  fill(255);
  stroke(0);
  rect(120, 140, 830, 500);
  fill(230);
  rect(1080, -1, 200, 720);
  stroke(100, 100);


  stroke(200);
  for (int i = 0; i < 4; i++) {
    line(120, 240 +100*i, 950, 240 + 100*i);
  }
  fill(0);
  textAlign(CENTER);
  if (Rot != -1) {
    for (int i = 5; i> -1; i--) {
      text(nf((5-i)*maxRot/(5), 0, 0), 85, 150 + 100*i);
    }
  }

  if (Blau != -1) {
    for (int i = 5; i> -1; i--) {
      text(nf((5-i)*maxBlau/(5), 0, 0), 985, 150 + 100*i);
    }
  }
  textAlign(CORNER);
  fill(0);
  noStroke();
  textSize(30);
  text("Optionen", 1120, 50);
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
  textAlign(CORNER);
  plotStation4(Innenraumluftc, Rot, minRot, maxRot, color(255, 0, 0));
  plotStation4(Innenraumluftc, Blau, minBlau, maxBlau, color(0, 0, 255));

  fill(0);
  textSize(20);
  text("0", 115, 660);
  text(nf(time_Station4, 0, 0), 938, 660);

  text("Zeit in Sekunden", 455, 700);
  fill(0);
  back.show();
  zumObermenu.show();
  if (Blau != -1) {
    up2.show();
    down2.show();
  } else {
    up2.hide();
    down2.hide();
  }

  if (Rot != -1) {
    up1.show();
    down1.show();
  } else {
    up1.hide();
    down1.hide();
  }

  if (!Station4cgestartet) {
    Station4Start.show();

    station4_MessungWiederholen.hide();
  } else {
    Station4Start.hide();
    station4_MessungWiederholen.show();
  }
  Station4_Rot.show();
  Station4_Blau.show();
  aktualisierung_right.show();
  aktualisierung_left.show();

  for (int i = 0; i < 5000; i++) {
    if (Innenraumluftc[6][i] > time_Station4) {
      Station4cFertig = true;
      break;
    } else {
      Station4cFertig = false;
    }
  }
  if (Station4cFertig) {
    Station4Auswertung.show();
  } else {
    Station4Auswertung.hide();
  }
}







void AuswertungInnenraum() {

  fill(0);
  textSize(20);
  int Rot = -1;
  int Blau = -1;
  int Gruen = -1;

  boolean Rot0 = false;
  boolean Rot50 = false;
  boolean Rot100 = false;

  boolean Gruen0 = false;
  boolean Gruen50 = false;
  boolean Gruen100 = false;


  boolean Blau0 = false;
  boolean Blau50 = false;
  boolean Blau100 = false;


  float maxRot = 0;
  float minRot = 0;
  float maxBlau = 0;
  float minBlau = 0;
  float maxGruen = 0;
  float minGruen = 0;

  if (Station4_Auswertung_Rot.name == "Temperatur (0%)") {
    Rot = 0;
    Rot0 = true;
    maxRot = 10*(scale_Innenraum1+1);
  } else if (Station4_Auswertung_Rot.name == "Luftfeuchte (0%)") {
    Rot = 1;
    Rot0 = true;
    maxRot = 20*(scale_Innenraum1+1);
  } else if (Station4_Auswertung_Rot.name == "CO2 (0%)") {
    Rot = 2;
    Rot0 = true;
    maxRot = 400*(scale_Innenraum1+1);
  } else if (Station4_Auswertung_Rot.name == "TVOC (0%)") {
    Rot = 3;
    Rot0 = true;
    maxRot = 100*(scale_Innenraum1+1);
  } else if (Station4_Auswertung_Rot.name == "eCO2 (0%)") {
    Rot = 4;
    Rot0 = true;
    maxRot = 400*(scale_Innenraum1+1);
  }

  if (Station4_Auswertung_Rot.name == "Temperatur (50%)" || Station4_Auswertung_Rot.name == "Luftfeuchte (50%)" || Station4_Auswertung_Rot.name == "CO2 (50%)" || Station4_Auswertung_Rot.name == "TVOC (50%)" || Station4_Auswertung_Rot.name == "eCO2 (50%)") {
    Rot50 = true;
  }
  if (Station4_Auswertung_Rot.name == "Temperatur (100%)" || Station4_Auswertung_Rot.name == "Luftfeuchte (100%)" || Station4_Auswertung_Rot.name == "CO2 (100%)" || Station4_Auswertung_Rot.name == "TVOC (100%)" || Station4_Auswertung_Rot.name == "eCO2 (100%)") {
    Rot100 = true;
  }

  if (Station4_Auswertung_Gruen.name == "Temperatur (0%)") {
    Gruen = 0;
    Gruen0 = true;
    maxGruen = 10*(scale_Innenraum1+1);
  } else if (Station4_Auswertung_Gruen.name == "Luftfeuchte (0%)") {
    Gruen = 1;
    Gruen0 = true;
    maxGruen = 20*(scale_Innenraum1+1);
  } else if (Station4_Auswertung_Gruen.name == "CO2 (0%)") {
    Gruen = 2;
    Gruen0 = true;
    maxGruen = 400*(scale_Innenraum1+1);
  } else if (Station4_Auswertung_Gruen.name == "TVOC (0%)") {
    Gruen = 3;
    Gruen0 = true;
    maxGruen = 100*(scale_Innenraum1+1);
  } else if (Station4_Auswertung_Gruen.name == "eCO2 (0%)") {
    Gruen = 4;
    Gruen0 = true;
    maxGruen = 400*(scale_Innenraum1+1);
  }

  if (Station4_Auswertung_Gruen.name == "Temperatur (50%)" || Station4_Auswertung_Gruen.name == "Luftfeuchte (50%)" || Station4_Auswertung_Gruen.name == "CO2 (50%)" || Station4_Auswertung_Gruen.name == "TVOC (50%)" || Station4_Auswertung_Gruen.name == "eCO2 (50%)") {
    Gruen50 = true;
  }
  if (Station4_Auswertung_Gruen.name == "Temperatur (100%)" || Station4_Auswertung_Gruen.name == "Luftfeuchte (100%)" || Station4_Auswertung_Gruen.name == "CO2 (100%)" || Station4_Auswertung_Gruen.name == "TVOC (100%)" || Station4_Auswertung_Gruen.name == "eCO2 (100%)") {
    Gruen100 = true;
  }




  if (Station4_Auswertung_Blau.name == "Temperatur (0%)") {
    Blau = 0;
    Blau0 = true;
    maxBlau = 10*(scale_Innenraum2+1);
  } else if (Station4_Auswertung_Blau.name == "Luftfeuchte (0%)") {
    Blau = 1;
    Blau0 = true;
    maxBlau = 20*(scale_Innenraum2+1);
  } else if (Station4_Auswertung_Blau.name == "CO2 (0%)") {
    Blau = 2;
    Blau0 = true;
    maxBlau = 400*(scale_Innenraum2+1);
  } else if (Station4_Auswertung_Blau.name == "TVOC (0%)") {
    Blau = 3;
    Blau0 = true;
    maxBlau = 100*(scale_Innenraum2+1);
  } else if (Station4_Auswertung_Blau.name == "eCO2 (0%)") {
    Blau = 4;
    Blau0 = true;
    maxBlau = 400*(scale_Innenraum2+1);
  }
  if (Station4_Auswertung_Blau.name == "Temperatur (50%)" || Station4_Auswertung_Blau.name == "Luftfeuchte (50%)" || Station4_Auswertung_Blau.name == "CO2 (50%)" || Station4_Auswertung_Blau.name == "TVOC (50%)" || Station4_Auswertung_Blau.name == "eCO2 (50%)") {
    Blau50 = true;
  }
  if (Station4_Auswertung_Blau.name == "Temperatur (100%)" || Station4_Auswertung_Blau.name == "Luftfeuchte (100%)" || Station4_Auswertung_Blau.name == "CO2 (100%)" || Station4_Auswertung_Blau.name == "TVOC (100%)" || Station4_Auswertung_Blau.name == "eCO2 (100%)") {
    Blau100 = true;
  }

  if (up1.isClicked()) {
    scale_Innenraum1 += 1;
    if (scale_Innenraum1 > 4) {
      scale_Innenraum1 = 0;
    }
  }
  if (down1.isClicked()) {
    scale_Innenraum1 -= 1;
    if (scale_Innenraum1 < 0) {
      scale_Innenraum1 = 4;
    }
  }
  if (up2.isClicked()) {
    scale_Innenraum2 += 1;
    if (scale_Innenraum2 > 4) {
      scale_Innenraum2 = 0;
    }
  }
  if (down2.isClicked()) {
    scale_Innenraum2 -= 1;
    if (scale_Innenraum2 < 0) {
      scale_Innenraum2 = 4;
    }
  }

  if (Station4Start.isClicked()) {
    Station4cgestartet = true;
    currentTime4c = millis();
    indexInnenraumluftc = 0;
  }
  if (station4_MessungWiederholen.isClicked()) {
    currentTime4c = millis();
    indexInnenraumluftc = 0;
  }

  // Zeichne den Hintergrund
  fill(255);
  stroke(0);
  rect(120, 140, 830, 500);
  fill(230);
  rect(1080, -1, 200, 720);
  stroke(100, 100);


  stroke(200);
  for (int i = 0; i < 4; i++) {
    line(120, 240 +100*i, 950, 240 + 100*i);
  }
  fill(0);
  textAlign(CENTER);
  if (Rot != -1) {
    for (int i = 5; i> -1; i--) {
      text(nf((5-i)*maxRot/(5), 0, 0), 85, 150 + 100*i);
    }
  }

  if (Blau != -1) {
    for (int i = 5; i> -1; i--) {
      text(nf((5-i)*maxBlau/(5), 0, 0), 985, 150 + 100*i);
    }
  }
  textAlign(CORNER);
  fill(0);
  noStroke();
  textSize(30);
  text("Optionen", 1120, 50);
  fill(0);
  noStroke();
  textSize(20);


  if (Rot0) {
    plotStation4(Innenraumlufta, Rot, minRot, maxRot, color(255, 0, 0));
  } else if (Rot50) {
    plotStation4(Innenraumluftb, Rot, minRot, maxRot, color(255, 0, 0));
  } else if (Rot100) {
    plotStation4(Innenraumluftc, Rot, minRot, maxRot, color(255, 0, 0));
  }

  if (Gruen0) {
    plotStation4(Innenraumlufta, Gruen, minGruen, maxGruen, color(0, 255, 0));
  } else if (Gruen50) {
    plotStation4(Innenraumluftb, Gruen, minGruen, maxGruen, color(0, 255, 0));
  } else if (Gruen100) {
    plotStation4(Innenraumluftc, Gruen, minGruen, maxGruen, color(0, 255, 0));
  }

  if (Blau0) {
    plotStation4(Innenraumlufta, Blau, minBlau, maxBlau, color(0, 0, 255));
  } else if (Blau50) {
    plotStation4(Innenraumluftb, Blau, minBlau, maxBlau, color(0, 0, 255));
  } else if (Blau100) {
    plotStation4(Innenraumluftc, Blau, minBlau, maxBlau, color(0, 0, 255));
  }

  fill(0);
  textSize(20);
  text("0", 115, 660);
  text(nf(time_Station4, 0, 0), 938, 660);

  text("Zeit in Sekunden", 455, 700);
  fill(0);
  back.show();
  zumObermenu.show();
  if (Blau != -1) {
    up2.show();
    down2.show();
  } else {
    up2.hide();
    down2.hide();
  }

  if (Rot != -1) {
    up1.show();
    down1.show();
  } else {
    up1.hide();
    down1.hide();
  }
  Station4_Auswertung_Rot.show();
  Station4_Auswertung_Gruen.show();
  Station4_Auswertung_Blau.show();
}














void onlyTwo2(CheckBox check, String state1, String state2, String state3) {
  boolean st1 = check.getState(state1);
  boolean st2 = check.getState(state2);
  boolean st3 = check.getState(state3);
  if (st1 && st2) {
    check.deactivate(state3);
  }
  if (st1 && st3) {
    check.deactivate(state2);
  }
  if (st2 && st3) {
    check.deactivate(state1);
  }
}


void onlyOne(CheckBox check, String state1, String state2, String state3, String state4, String state5) {
  boolean st1 = check.getState(state1);
  boolean st2 = check.getState(state2);
  boolean st3 = check.getState(state3);
  boolean st4 = check.getState(state4);
  boolean st5 = check.getState(state5);


  if (st1) {
    check.deactivate(state2);
    check.deactivate(state3);
    check.deactivate(state4);
    check.deactivate(state5);
  }
  if (st2) {
    check.deactivate(state1);
    check.deactivate(state3);
    check.deactivate(state4);
    check.deactivate(state5);
  }
  if (st3) {
    check.deactivate(state1);
    check.deactivate(state2);
    check.deactivate(state4);
    check.deactivate(state5);
  }
  if (st4) {
    check.deactivate(state1);
    check.deactivate(state2);
    check.deactivate(state3);
    check.deactivate(state5);
  }
  if (st5) {
    check.deactivate(state1);
    check.deactivate(state2);
    check.deactivate(state3);
    check.deactivate(state4);
  }
}
