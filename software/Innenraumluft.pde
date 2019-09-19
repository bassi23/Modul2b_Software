void Innenraumluft() {
  one.active = false;
  two.active = false;
  three.active = false;
  four.active = false;
  two_three.active = false;
  fill(0);
  textSize(20);
  textFont(bold);
  text("Station 4 - Dicke Luft", 20, 50);
  textFont(normal);
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
    maxRot = 10*(scale_Innenraum1);
  } else if (Station4_Rot.name == "Luftfeuchte") {
    Rot = 1;
    maxRot = 20*(scale_Innenraum1);
  } else if (Station4_Rot.name == "CO") {
    Rot = 2;
    maxRot = 500*(scale_Innenraum1);
  } else if (Station4_Rot.name == "TVOC") {
    Rot = 3;
    maxRot = 100*(scale_Innenraum1);
  } else if (Station4_Rot.name == "eCO") {
    Rot = 4;
    maxRot = 500*(scale_Innenraum1);
  }

  if (Station4_Blau.name == "Temperatur") {
    Blau = 0;
    maxBlau = 10*(scale_Innenraum2);
  } else if (Station4_Blau.name == "Luftfeuchte") {
    Blau = 1;
    maxBlau = 20*(scale_Innenraum2);
  } else if (Station4_Blau.name == "CO") {
    Blau = 2;
    maxBlau = 500*(scale_Innenraum2);
  } else if (Station4_Blau.name == "TVOC") {
    Blau = 3;
    maxBlau = 100*(scale_Innenraum2);
  } else if (Station4_Blau.name == "eCO") {
    Blau = 4;
    maxBlau = 500*(scale_Innenraum2);
  }



  if (up1.isClicked()) {
    scale_Innenraum1 += 1;
    if (scale_Innenraum1 > 5) {
      scale_Innenraum1 = 0;
    }
  }
  if (down1.isClicked()) {
    scale_Innenraum1 -= 1;
    if (scale_Innenraum1 < 0) {
      scale_Innenraum1 = 5;
    }
  }
  if (up2.isClicked()) {
    scale_Innenraum2 += 1;
    if (scale_Innenraum2 > 5) {
      scale_Innenraum2 = 0;
    }
  }
  if (down2.isClicked()) {
    scale_Innenraum2 -= 1;
    if (scale_Innenraum2 < 0) {
      scale_Innenraum2 = 5;
    }
  }
  if (Station4Start.isClicked()) {
    for (int i = 0; i < 5000; i++) {
      for (int j = 0; j < 7; j++) {
        Innenraumlufta[j][i] = 0;
      }
    }
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
      for (int i = 0; i < 5000; i++) {
        for (int j = 0; j < 7; j++) {
          Innenraumlufta[j][i] = 0;
        }
      }
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
  if (scale_Innenraum1 == 0 && Rot!=-1) {
    minRot = 99999;
    maxRot = 0;
    for (int i = 0; i < 5000; i++) {
      if (Innenraumlufta[Rot][i] < minRot && Innenraumlufta[Rot][i] != 0) {
        minRot = Innenraumlufta[Rot][i];
      }
      if (Innenraumlufta[Rot][i] > maxRot) {
        maxRot = Innenraumlufta[Rot][i];
      }
    }
  }
  if (scale_Innenraum2 == 0 &&Blau != -1) {
    minBlau = 99999;
    maxBlau = 0;
    for (int i = 0; i < 5000; i++) {
      if (Innenraumlufta[Blau][i] < minBlau && Innenraumlufta[Blau][i] != 0) {
        minBlau = Innenraumlufta[Blau][i];
      }
      if (Innenraumlufta[Blau][i] > maxBlau) {
        maxBlau = Innenraumlufta[Blau][i];
      }
    }
  }

  stroke(200);
  for (int i = 0; i < 4; i++) {
    line(120, 240 +100*i, 950, 240 + 100*i);
  }
  fill(0);
  textAlign(CENTER);
  if (Rot != -1 && maxRot != 0) {

    for (int i = 0; i< 6; i++) {
      if (Rot != 0 && Rot != 1) {
        text(round(minRot + i*(maxRot-minRot)/(5)), 85, 650 - 100*i);
      } else {
        text(nf(minRot + i*(maxRot-minRot)/(5), 0, 1), 85, 650 - 100*i);
      }
    }
  }

  if (Blau != -1 && maxBlau != 0) {
    for (int i = 0; i< 6; i++) {
      if (Blau != 0 && Blau != 1) {
        text(round(minBlau + i*(maxBlau-minBlau)/(5)), 985, 650 - 100*i);
      } else {
        text(nf(minBlau + i*(maxBlau-minBlau)/(5), 0, 1), 985, 650 - 100*i);
      }
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




  plotStation4(Innenraumlufta, Rot, minRot, maxRot, color(255, 0, 0), verbinde_innenraum.checked, fehler_innenraum.checked, "a");
  plotStation4(Innenraumlufta, Blau, minBlau, maxBlau, color(0, 0, 255), verbinde_innenraum.checked, fehler_innenraum.checked, "a");

  fill(0);
  textSize(20);
  text("0", 115, 670);
  text(nf(time_Station4, 0, 0), 938, 670);
  textSize(15);
  strokeWeight(1);
  fill(240);
  stroke(0);
  rect(1105, 190, 155, 85);
  fill(0);
  textAlign(LEFT);
  text("Fehlerbalken", 1110, 217);
  text("verbinden", 1110, 260);
  textAlign(CENTER);
  textSize(20);
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
  fehler_innenraum.show();
  verbinde_innenraum.show();

  for (int i = 0; i < 5000; i++) {
    if (Innenraumlufta[6][i] > time_Station4) {
      Station4aFertig = true;
      Station4agestartet = false;
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
  if (freie_stationen.name == "freigeben") {
    Station4b.show();
  }

  pushMatrix();
  translate(width/2, height/2);
  rotate(3*PI/2);
  fill(255, 0, 0);
  if (Rot == 6) {
    text(nf(time_Station4, 0, 0), 938, 660);
    text("Zeit in Sekunden", -100, -595);
  } else if (Rot == 0) {
    text("Temperatur in °C", height/2 -490, -width/2 + 50);
  } else if (Rot == 1) {
    text("Luftfeuchte in %", height/2 -490, -width/2 + 50);
  } else if (Rot == 2) {
    text("CO  in ppm", height/2 -490, -width/2 + 50);
    textSize(16);
    text("2", height/2 -462, -width/2 + 60);
    textSize(20);
  } else if (Rot == 3) {
    text("TVOC in ppb", height/2 -490, -width/2 + 50);
  } else if (Rot == 4) {
    text("eCO  in ppm", height/2 -490, -width/2 + 50);
    textSize(16);
    text("2", height/2 -455, -width/2 + 60);
    textSize(20);
  }
  popMatrix();
  pushMatrix();
  translate(width/2, height/2);
  rotate(PI/2);
  fill(0, 0, 255);
  if (Blau == 0) {
    text("Temperatur in °C", -height/2 +300, width/2 - 1050);
  } else if (Blau == 1) {
    text("Luftfeuchte in %", -height/2 +300, width/2 - 1050);
  } else if (Blau == 2) {
    text("CO  in ppm", -height/2 +300, width/2 - 1050);
    textSize(16);
    text("2", -height/2 +330, width/2 - 1040);
    textSize(20);
  } else if (Blau == 3) {
    text("TVOC in ppb", -height/2 +300, width/2 - 1050);
  } else if (Blau == 4) {
    text("eCO  in ppm", -height/2 +300, width/2 - 1050);
    textSize(16);
    text("2", -height/2 +343, width/2 - 1040);
    textSize(20);
  }
  popMatrix();
}


void plotStation4(float[][] array, int index, float min, float max, color c, boolean connect, boolean error, String aufgabe) {
  // 1 Sekunde entspricht "830/time_Station4" Pixel
  stroke(c);
  fill(c);
  strokeWeight(1);
  //rect(120, 140, 830, 500);
  float oneSecond = 830/time_Station4;
  float xOff = array[6][0];

  boolean plot_first = true;

  float e = 0;


  // Aktueller Messwert
  String Einheit = "";

  if (index != -1) {
    for (int i = 1; i < 5000; i++) {

      if (index == 0) {
        e = 0.5;
        Einheit = "°C";
      } else if (index == 1) {
        e = 2;
        Einheit = "%";
      } else if (index == 2) {
        e = 30 + 0.03*array[2][i];
        Einheit = "ppm";
      } else if (index == 3) {
        e =  0.15*array[3][i];
        Einheit = "ppb";
      } else if (index == 4) {
        e = 0.1*array[3][i];
        Einheit = "ppm";
      }



      float x1 = 120 + (array[6][i] - xOff)*oneSecond;
      float x2 = 120 + (array[6][i-1] - xOff)*oneSecond;
      float y1 = 640 - 500*(array[index][i]-min)/(max-min);
      float y2 = 640 - 500*(array[index][i-1]-min)/(max-min);

      float e12 =  640 - 500*(array[index][i-1] - e -min)/(max-min);
      float e22 =  640 - 500*(array[index][i-1] + e -min)/(max-min);

      float e11 =  640 - 500*(array[index][i] - e -min)/(max-min);
      float e21 =  640 - 500*(array[index][i] + e -min)/(max-min);


      if (e11 < 140) {
        e11 = 140;
      }
      if (e21 < 140) {
        e21 = 140;
      }
      if (e21 > 640) {
        e21 = 640;
      }
      if (e11 > 640) {
        e11 = 640;
      }
      if (e12 < 140) {
        e12 = 140;
      }
      if (e22 < 140) {
        e22 = 101400;
      }
      if (e22 > 640) {
        e22 = 640;
      }
      if (e12 > 640) {
        e12 = 640;
      }

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
          } else if (y2 < 140 && y1 > 640) {
            y2 = 140;
            x2 = (y1-b)/m;
            y1 = 640;
            x1 = -(b-y2)/m;
          }
          if (y1 >= 140 && y2>= 140 && y1 <= 640 && y2<= 640 && array[index][i] != 0) {
            if (connect) {
              line(x1, y1, x2, y2);
              if (error) {
                line(x1, e11, x1, e21);
                line(x1-2, e11, x1+2, e11);
                line(x1-2, e21, x1+2, e21);
              }
            } else {
              if (error) {
                line(x1, e11, x1, e21);
                line(x1-2, e11, x1+2, e11);
                line(x1-2, e21, x1+2, e21);
              }
              if (plot_first) {
                plot_first = false;
                line(x2-2, y2, x2+2, y2);
                line(x2, y2-2, x2, y2+2);
              }
              line(x1-2, y1, x1+2, y1);
              line(x1, y1-2, x1, y1+2);
            }
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
  textSize(16);

  if (index != -1) {
    if (c == color(255, 0, 0)) {
      textAlign(LEFT);
      if (aufgabe == "a") {
        if (e != 0.5 && indexInnenraumlufta > 1) {
          text("Aktueller Wert: (" + str(round(array[index][indexInnenraumlufta-1])).replace(".", ",") + " +/- " + round(e) + ") " + Einheit, 120, 80);
        } else {
          if (indexInnenraumlufta > 1) {
            text("Aktueller Wert: (" + str(round(array[index][indexInnenraumlufta-1])).replace(".", ",") + " +/- 0,5) " + Einheit, 120, 80);
          }
        }
      } else if (aufgabe == "b") {
        if (e != 0.5 && indexInnenraumluftb > 1) {
          text("Aktueller Wert: (" + str(round(array[index][indexInnenraumluftb-1])).replace(".", ",") + " +/- " + round(e) + ") " + Einheit, 120, 80);
        } else {
          if (indexInnenraumluftb > 1) {
            text("Aktueller Wert: (" + str(round(array[index][indexInnenraumluftb-1])).replace(".", ",") + " +/- 0,5) " + Einheit, 120, 80);
          }
        }
      } else if (aufgabe == "c") {
        if (e != 0.5 && indexInnenraumluftc > 1) {
          text("Aktueller Wert: (" + str(round(array[index][indexInnenraumluftc-1])).replace(".", ",") + " +/- " + round(e) + ") " + Einheit, 120, 80);
        } else {
          if (indexInnenraumluftc > 1) {
            text("Aktueller Wert: (" + str(round(array[index][indexInnenraumluftc-1])).replace(".", ",") + " +/- 0,5) " + Einheit, 120, 80);
          }
        }
      }
    } else if (c == color(0, 0, 255)) {
      textAlign(RIGHT);
      if (aufgabe == "a") {
        if (e != 0.5 && indexInnenraumlufta > 1) {
          text("Aktueller Wert: (" + str(round(array[index][indexInnenraumlufta-1])).replace(".", ",") + " +/- " + round(e) + ") " + Einheit, 950, 80);
        } else {
          if (indexInnenraumlufta > 1) {
            text("Aktueller Wert: (" + str(round(array[index][indexInnenraumlufta-1])).replace(".", ",") + " +/- 0,5) " + Einheit, 950, 80);
          }
        }
      } else if (aufgabe == "b") {
        if (e != 0.5 && indexInnenraumluftb > 1) {
          text("Aktueller Wert: (" + str(round(array[index][indexInnenraumluftb-1])).replace(".", ",") + " +/- " + round(e) + ") " + Einheit, 950, 80);
        } else {
          if (indexInnenraumluftb > 1) {
            text("Aktueller Wert: (" + str(round(array[index][indexInnenraumluftb-1])).replace(".", ",") + " +/- 0,5) " + Einheit, 950, 80);
          }
        }
      } else if (aufgabe == "c") {
        if (e != 0.5 && indexInnenraumluftc > 1) {
          text("Aktueller Wert: (" + str(round(array[index][indexInnenraumluftc-1])).replace(".", ",") + " +/- " + round(e) + ") " + Einheit, 950, 80);
        } else {
          if (indexInnenraumluftc > 1) {
            text("Aktueller Wert: (" + str(round(array[index][indexInnenraumluftc-1])).replace(".", ",") + " +/- 0,5) " + Einheit, 950, 80);
          }
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
    maxRot = 10*(scale_Innenraum1);
  } else if (Station4_Rot.name == "Luftfeuchte") {
    Rot = 1;
    maxRot = 20*(scale_Innenraum1);
  } else if (Station4_Rot.name == "CO") {
    Rot = 2;
    maxRot = 500*(scale_Innenraum1);
  } else if (Station4_Rot.name == "TVOC") {
    Rot = 3;
    maxRot = 100*(scale_Innenraum1);
  } else if (Station4_Rot.name == "eCO") {
    Rot = 4;
    maxRot = 500*(scale_Innenraum1);
  }

  if (Station4_Blau.name == "Temperatur") {
    Blau = 0;
    maxBlau = 10*(scale_Innenraum2);
  } else if (Station4_Blau.name == "Luftfeuchte") {
    Blau = 1;
    maxBlau = 20*(scale_Innenraum2);
  } else if (Station4_Blau.name == "CO") {
    Blau = 2;
    maxBlau = 500*(scale_Innenraum2);
  } else if (Station4_Blau.name == "TVOC") {
    Blau = 3;
    maxBlau = 100*(scale_Innenraum2);
  } else if (Station4_Blau.name == "eCO") {
    Blau = 4;
    maxBlau = 500*(scale_Innenraum2);
  }



  if (up1.isClicked()) {
    scale_Innenraum1 += 1;
    if (scale_Innenraum1 > 5) {
      scale_Innenraum1 = 0;
    }
  }
  if (down1.isClicked()) {
    scale_Innenraum1 -= 1;
    if (scale_Innenraum1 < 0) {
      scale_Innenraum1 = 5;
    }
  }
  if (up2.isClicked()) {
    scale_Innenraum2 += 1;
    if (scale_Innenraum2 > 5) {
      scale_Innenraum2 = 0;
    }
  }
  if (down2.isClicked()) {
    scale_Innenraum2 -= 1;
    if (scale_Innenraum2 < 0) {
      scale_Innenraum2 = 5;
    }
  }


  if (Station4Start.isClicked()) {
    for (int i = 0; i < 5000; i++) {
      for (int j = 0; j < 7; j++) {
        Innenraumluftb[j][i] = 0;
      }
    }
    Station4bgestartet = true;
    currentTime4b = millis();
    indexInnenraumluftb = 0;
  }
  if (station4_MessungWiederholen.isClicked()) {
    for (int i = 0; i < 5000; i++) {
      for (int j = 0; j < 7; j++) {
        Innenraumluftb[j][i] = 0;
      }
    }
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
  if (scale_Innenraum1 == 0 && Rot!=-1) {
    minRot = 99999;
    maxRot = 0;
    for (int i = 0; i < 5000; i++) {
      if (Innenraumluftb[Rot][i] < minRot && Innenraumluftb[Rot][i] != 0) {
        minRot = Innenraumluftb[Rot][i];
      }
      if (Innenraumluftb[Rot][i] > maxRot) {
        maxRot = Innenraumluftb[Rot][i];
      }
    }
  }
  if (scale_Innenraum2 == 0 && Blau != -1) {
    minBlau = 99999;
    maxBlau = 0;
    for (int i = 0; i < 5000; i++) {
      if (Innenraumluftb[Blau][i] < minBlau && Innenraumluftb[Blau][i] != 0) {
        minBlau = Innenraumluftb[Blau][i];
      }
      if (Innenraumluftb[Blau][i] > maxBlau) {
        maxBlau = Innenraumluftb[Blau][i];
      }
    }
  }


  stroke(200);
  for (int i = 0; i < 4; i++) {
    line(120, 240 +100*i, 950, 240 + 100*i);
  }
  fill(0);
  textAlign(CENTER);
  if (Rot != -1 && maxRot != 0) {

    for (int i = 0; i< 6; i++) {
      if (Rot != 0 && Rot != 1) {
        text(round(minRot + i*(maxRot-minRot)/(5)), 85, 650 - 100*i);
      } else {
        text(nf(minRot + i*(maxRot-minRot)/(5), 0, 1), 85, 650 - 100*i);
      }
    }
  }

  if (Blau != -1 && maxBlau != 0) {
    for (int i = 0; i< 6; i++) {
      if (Blau != 0 && Blau != 1) {
        text(round(minBlau + i*(maxBlau-minBlau)/(5)), 985, 650 - 100*i);
      } else {
        text(nf(minBlau + i*(maxBlau-minBlau)/(5), 0, 1), 985, 650 - 100*i);
      }
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



  plotStation4(Innenraumluftb, Rot, minRot, maxRot, color(255, 0, 0), verbinde_innenraum.checked, fehler_innenraum.checked, "b");
  plotStation4(Innenraumluftb, Blau, minBlau, maxBlau, color(0, 0, 255), verbinde_innenraum.checked, fehler_innenraum.checked, "b");

  fill(0);
  textSize(20);
  text("0", 115, 670);
  text(nf(time_Station4, 0, 0), 938, 670);
  strokeWeight(1);
  fill(240);
  stroke(0);
  rect(1105, 190, 155, 85);
  fill(0);
  textAlign(LEFT);
  textSize(15);
  text("Fehlerbalken", 1110, 217);
  text("verbinden", 1110, 260);
  textSize(20);
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
  fehler_innenraum.show();
  verbinde_innenraum.show();


  for (int i = 0; i < 5000; i++) {
    if (Innenraumluftb[6][i] > time_Station4) {
      Station4bFertig = true;
      Station4bgestartet = false;
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

  if (freie_stationen.name == "freigeben") {
    Station4c.show();
  }
  pushMatrix();
  translate(width/2, height/2);
  rotate(3*PI/2);
  fill(255, 0, 0);
  if (Rot == 6) {
    text(nf(time_Station4, 0, 0), 938, 660);
    text("Zeit in Sekunden", -100, -595);
  } else if (Rot == 0) {
    text("Temperatur in °C", height/2 -490, -width/2 + 50);
  } else if (Rot == 1) {
    text("Luftfeuchte in %", height/2 -490, -width/2 + 50);
  } else if (Rot == 2) {
    text("CO  in ppm", height/2 -490, -width/2 + 50);
    textSize(16);
    text("2", height/2 -462, -width/2 + 60);
    textSize(20);
  } else if (Rot == 3) {
    text("TVOC in ppb", height/2 -490, -width/2 + 50);
  } else if (Rot == 4) {
    text("eCO  in ppm", height/2 -490, -width/2 + 50);
    textSize(16);
    text("2", height/2 -455, -width/2 + 60);
    textSize(20);
  }
  popMatrix();
  pushMatrix();
  translate(width/2, height/2);
  rotate(PI/2);
  fill(0, 0, 255);
  if (Blau == 0) {
    text("Temperatur in °C", -height/2 +300, width/2 - 1050);
  } else if (Blau == 1) {
    text("Luftfeuchte in %", -height/2 +300, width/2 - 1050);
  } else if (Blau == 2) {
    text("CO  in ppm", -height/2 +300, width/2 - 1050);
    textSize(16);
    text("2", -height/2 +330, width/2 - 1040);
    textSize(20);
  } else if (Blau == 3) {
    text("TVOC in ppb", -height/2 +300, width/2 - 1050);
  } else if (Blau == 4) {
    text("eCO  in ppm", -height/2 +300, width/2 - 1050);
    textSize(16);
    text("2", -height/2 +343, width/2 - 1040);
    textSize(20);
  }
  popMatrix();
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
    maxRot = 10*(scale_Innenraum1);
  } else if (Station4_Rot.name == "Luftfeuchte") {
    Rot = 1;
    maxRot = 20*(scale_Innenraum1);
  } else if (Station4_Rot.name == "CO") {
    Rot = 2;
    maxRot = 500*(scale_Innenraum1);
  } else if (Station4_Rot.name == "TVOC") {
    Rot = 3;
    maxRot = 100*(scale_Innenraum1);
  } else if (Station4_Rot.name == "eCO") {
    Rot = 4;
    maxRot = 500*(scale_Innenraum1);
  }

  if (Station4_Blau.name == "Temperatur") {
    Blau = 0;
    maxBlau = 10*(scale_Innenraum2);
  } else if (Station4_Blau.name == "Luftfeuchte") {
    Blau = 1;
    maxBlau = 20*(scale_Innenraum2);
  } else if (Station4_Blau.name == "CO") {
    Blau = 2;
    maxBlau = 500*(scale_Innenraum2);
  } else if (Station4_Blau.name == "TVOC") {
    Blau = 3;
    maxBlau = 100*(scale_Innenraum2);
  } else if (Station4_Blau.name == "eCO") {
    Blau = 4;
    maxBlau = 500*(scale_Innenraum2);
  }



  if (up1.isClicked()) {
    scale_Innenraum1 += 1;
    if (scale_Innenraum1 > 5) {
      scale_Innenraum1 = 0;
    }
  }
  if (down1.isClicked()) {
    scale_Innenraum1 -= 1;
    if (scale_Innenraum1 < 0) {
      scale_Innenraum1 = 5;
    }
  }
  if (up2.isClicked()) {
    scale_Innenraum2 += 1;
    if (scale_Innenraum2 > 5) {
      scale_Innenraum2 = 0;
    }
  }
  if (down2.isClicked()) {
    scale_Innenraum2 -= 1;
    if (scale_Innenraum2 < 0) {
      scale_Innenraum2 = 5;
    }
  }

  if (Station4Start.isClicked()) {
    for (int i = 0; i < 5000; i++) {
      for (int j = 0; j < 7; j++) {
        Innenraumluftc[j][i] = 0;
      }
    }
    Station4cgestartet = true;
    currentTime4c = millis();
    indexInnenraumluftc = 0;
  }
  if (station4_MessungWiederholen.isClicked()) {
    for (int i = 0; i < 5000; i++) {
      for (int j = 0; j < 7; j++) {
        Innenraumluftc[j][i] = 0;
      }
    }
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


  if (scale_Innenraum1 == 0 && Rot!=-1) {
    minRot = 99999;
    maxRot = 0;
    for (int i = 0; i < 5000; i++) {
      if (Innenraumluftc[Rot][i] < minRot && Innenraumluftc[Rot][i] != 0) {
        minRot = Innenraumluftc[Rot][i];
      }
      if (Innenraumluftc[Rot][i] > maxRot) {
        maxRot = Innenraumluftc[Rot][i];
      }
    }
  }
  if (scale_Innenraum2 == 0 && Blau != -1) {
    minBlau = 99999;
    maxBlau = 0;
    for (int i = 0; i < 5000; i++) {
      if (Innenraumluftc[Blau][i] < minBlau && Innenraumluftc[Blau][i] != 0) {
        minBlau = Innenraumluftc[Blau][i];
      }
      if (Innenraumluftc[Blau][i] > maxBlau && Blau!=-1) {
        maxBlau = Innenraumluftc[Blau][i];
      }
    }
  }
  if (Rot != -1 && maxRot != 0) {

    for (int i = 0; i< 6; i++) {
      if (Rot != 0 && Rot != 1) {
        text(round(minRot + i*(maxRot-minRot)/(5)), 85, 650 - 100*i);
      } else {
        text(nf(minRot + i*(maxRot-minRot)/(5), 0, 1), 85, 650 - 100*i);
      }
    }
  }

  if (Blau != -1 && maxBlau != 0) {
    for (int i = 0; i< 6; i++) {
      if (Blau != 0 && Blau != 1) {
        text(round(minBlau + i*(maxBlau-minBlau)/(5)), 985, 650 - 100*i);
      } else {
        text(nf(minBlau + i*(maxBlau-minBlau)/(5), 0, 1), 985, 650 - 100*i);
      }
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





  plotStation4(Innenraumluftc, Rot, minRot, maxRot, color(255, 0, 0), verbinde_innenraum.checked, fehler_innenraum.checked, "c");
  plotStation4(Innenraumluftc, Blau, minBlau, maxBlau, color(0, 0, 255), verbinde_innenraum.checked, fehler_innenraum.checked, "c");

  fill(0);
  textSize(20);
  text("0", 115, 670);
  text(nf(time_Station4, 0, 0), 938, 670);
  strokeWeight(1);
  fill(240);
  stroke(0);
  rect(1105, 190, 155, 85);
  fill(0);
  textSize(15);
  textAlign(LEFT);
  text("Fehlerbalken", 1110, 217);
  text("verbinden", 1110, 260);
  textSize(20);
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
  fehler_innenraum.show();
  verbinde_innenraum.show();

  for (int i = 0; i < 5000; i++) {
    if (Innenraumluftc[6][i] > time_Station4) {
      Station4cFertig = true;
      Station4cgestartet = false;
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
  if (freie_stationen.name == "freigeben") {
    Station4Auswertung.show();
  }
  pushMatrix();
  translate(width/2, height/2);
  rotate(3*PI/2);
  fill(255, 0, 0);
  if (Rot == 6) {
    text(nf(time_Station4, 0, 0), 938, 660);
    text("Zeit in Sekunden", -100, -595);
  } else if (Rot == 0) {
    text("Temperatur in °C", height/2 -490, -width/2 + 50);
  } else if (Rot == 1) {
    text("Luftfeuchte in %", height/2 -490, -width/2 + 50);
  } else if (Rot == 2) {
    text("CO  in ppm", height/2 -490, -width/2 + 50);
    textSize(16);
    text("2", height/2 -462, -width/2 + 60);
    textSize(20);
  } else if (Rot == 3) {
    text("TVOC in ppb", height/2 -490, -width/2 + 50);
  } else if (Rot == 4) {
    text("eCO  in ppm", height/2 -490, -width/2 + 50);
    textSize(16);
    text("2", height/2 -455, -width/2 + 60);
    textSize(20);
  }
  popMatrix();
  pushMatrix();
  translate(width/2, height/2);
  rotate(PI/2);
  fill(0, 0, 255);
  if (Blau == 0) {
    text("Temperatur in °C", -height/2 +300, width/2 - 1050);
  } else if (Blau == 1) {
    text("Luftfeuchte in %", -height/2 +300, width/2 - 1050);
  } else if (Blau == 2) {
    text("CO  in ppm", -height/2 +300, width/2 - 1050);
    textSize(16);
    text("2", -height/2 +330, width/2 - 1040);
    textSize(20);
  } else if (Blau == 3) {
    text("TVOC in ppb", -height/2 +300, width/2 - 1050);
  } else if (Blau == 4) {
    text("eCO  in ppm", -height/2 +300, width/2 - 1050);
    textSize(16);
    text("2", -height/2 +343, width/2 - 1040);
    textSize(20);
  }
  popMatrix();
}




boolean zeroPercent = true;
boolean fiftyPercent = true;
boolean hundredPercent = true;
int indexX = 6;
int indexY = 6;



void AuswertungInnenraum() {
  zero.show();
  fifty.show();
  hundred.show();

  if (zero.isClicked()) {
    if (zeroPercent) {
      zeroPercent = false;
    } else {
      zeroPercent = true;
    }
  }
  if (fifty.isClicked()) {
    if (fiftyPercent) {
      fiftyPercent = false;
    } else {
      fiftyPercent = true;
    }
  }
  if (hundred.isClicked()) {
    if (hundredPercent) {
      hundredPercent = false;
    } else {
      hundredPercent = true;
    }
  }
  fill(0);
  textSize(20);
  indexX = 6;
  indexY = 6;

  float absoluteMaxX = 0;
  float absoluteMinX = 99999;
  float absoluteMaxY = 0;
  float absoluteMinY = 99999;

  if (scale_Innenraum2 != 0) {
    absoluteMinX = 0;
    absoluteMinY = 0;
  }
  if (scale_Innenraum1 != 0) {
    absoluteMinX = 0;
    absoluteMinY = 0;
  }

  if (Station4_Auswertung_Rot.name == "Zeit") {
    indexX = 6;
    absoluteMaxX = 300;
    absoluteMinX = 0;
  } else if (Station4_Auswertung_Rot.name == "Temperatur") {
    indexX = 0;
    if (scale_Innenraum2 == 1) {
      absoluteMaxX = 10;
    } else if (scale_Innenraum2 == 2) {
      absoluteMaxX = 15;
    } else if (scale_Innenraum2 == 3) {
      absoluteMaxX = 20;
    } else if (scale_Innenraum2 == 4) {
      absoluteMaxX = 25;
    } else if (scale_Innenraum2 == 5) {
      absoluteMaxX = 30;
    }
  } else if (Station4_Auswertung_Rot.name == "Luftfeuchte") {
    indexX = 1;
    absoluteMaxX = 20*scale_Innenraum2;
  } else if (Station4_Auswertung_Rot.name == "CO") {
    indexX = 2;
    absoluteMaxX = 500*scale_Innenraum2;
  } else if (Station4_Auswertung_Rot.name == "TVOC") {
    indexX = 3;
    absoluteMaxX = 50*scale_Innenraum2;
  } else if (Station4_Auswertung_Rot.name == "eCO") {
    indexX = 4;
    absoluteMaxX = 500*scale_Innenraum2;
  }

  if (Station4_Auswertung_Blau.name == "Temperatur") {
    indexY = 0;
    absoluteMaxY = 10 + 5*scale_Innenraum1;
  } else if (Station4_Auswertung_Blau.name == "Luftfeuchte") {
    indexY = 1;
    absoluteMaxY = 20*scale_Innenraum1;
  } else if (Station4_Auswertung_Blau.name == "CO") {
    indexY = 2;
    absoluteMaxY = 500*scale_Innenraum1;
  } else if (Station4_Auswertung_Blau.name == "TVOC") {
    indexY = 3;
    absoluteMaxY = 50*scale_Innenraum1;
  } else if (Station4_Auswertung_Blau.name == "eCO") {
    indexY = 4;
    absoluteMaxY = 500*scale_Innenraum1;
  }



  up1.show();
  down1.show();


  if (up1.isClicked()) {
    scale_Innenraum1 += 1;
    if (scale_Innenraum1 > 5) {
      scale_Innenraum1 = 0;
    }
  }
  if (down1.isClicked()) {
    scale_Innenraum1 -= 1;
    if (scale_Innenraum1 < 0) {
      scale_Innenraum1 = 5;
    }
  }

  if (up2_Station4.isClicked()) {
    scale_Innenraum2 += 1;
    if (scale_Innenraum2 > 5) {
      scale_Innenraum2 = 0;
    }
  }
  if (down2_Station4.isClicked()) {
    scale_Innenraum2 -= 1;
    if (scale_Innenraum2 < 0) {
      scale_Innenraum2 = 5;
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


  textAlign(CORNER);
  fill(0);
  noStroke();
  textSize(30);
  text("Optionen", 1120, 50);
  fill(0);
  noStroke();
  textSize(20);

  if (scale_Innenraum2 == 0) {
    for (int i = 0; i < indexInnenraumlufta + 5; i++) {
      if (Innenraumlufta[indexX][i] > absoluteMaxX) {
        absoluteMaxX =  Innenraumlufta[indexX][i];
      }
      if (Innenraumluftb[indexX][i] > absoluteMaxX) {
        absoluteMaxX =  Innenraumluftb[indexX][i];
      }
      if (Innenraumluftc[indexX][i] > absoluteMaxX) {
        absoluteMaxX =  Innenraumluftc[indexX][i];
      }


      if (Innenraumlufta[indexX][i] < absoluteMinX && Innenraumlufta[indexX][i] != 0) {
        absoluteMinX =  Innenraumlufta[indexX][i];
      }
      if (Innenraumluftb[indexX][i] < absoluteMinX && Innenraumluftb[indexX][i] != 0) {
        absoluteMinX =  Innenraumluftb[indexX][i];
      }
      if (Innenraumluftc[indexX][i] < absoluteMinX && Innenraumluftc[indexX][i] != 0) {
        absoluteMinX =  Innenraumluftc[indexX][i];
      }
    }
  }

  if (scale_Innenraum1 == 0) {
    absoluteMinY = 9999999;
    for (int i = 0; i < indexInnenraumlufta + 5; i++) {
      if (Innenraumlufta[indexY][i] > absoluteMaxY) {
        absoluteMaxY =  Innenraumlufta[indexY][i];
      }
      if (Innenraumluftb[indexY][i] > absoluteMaxY) {
        absoluteMaxY =  Innenraumluftb[indexY][i];
      }
      if (Innenraumluftc[indexY][i] > absoluteMaxY) {
        absoluteMaxY =  Innenraumluftc[indexY][i];
      }   

      if (Innenraumlufta[indexY][i] < absoluteMinY && Innenraumlufta[indexY][i] != 0) {
        absoluteMinY =  Innenraumlufta[indexY][i];
      }
      if (Innenraumluftb[indexY][i] < absoluteMinY && Innenraumluftb[indexY][i] != 0) {
        absoluteMinY =  Innenraumluftb[indexY][i];
      }
      if (Innenraumluftc[indexY][i] < absoluteMinY && Innenraumluftc[indexY][i] != 0) {
        absoluteMinY =  Innenraumluftc[indexY][i];
      }
    }
  }

  textSize(18);

  if (absoluteMaxY != 0 && Station4_Auswertung_Rot.name == "Zeit") {
    for (int i = 0; i< 6; i++) {
      text(nf(absoluteMinY + i*(absoluteMaxY-absoluteMinY)/(5), 0, 1), 80, 650 - 100*i);
    }
  }
  textSize(20);


  //Luftfeuchtigkeit - TVOC
  if (zeroPercent) {
    plot4(Innenraumlufta[indexX], Innenraumlufta[indexY], color(255, 0, 0), absoluteMaxX, absoluteMinX, absoluteMaxY, absoluteMinY);
  }
  if (fiftyPercent) {
    plot4(Innenraumluftb[indexX], Innenraumluftb[indexY], color(0, 255, 0), absoluteMaxX, absoluteMinX, absoluteMaxY, absoluteMinY);
  }
  if (hundredPercent) {
    plot4(Innenraumluftc[indexX], Innenraumluftc[indexY], color(0, 0, 255), absoluteMaxX, absoluteMinX, absoluteMaxY, absoluteMinY);
  }


  fill(0);
  textSize(20);
  if (indexX == 6) {
    text(nf(time_Station4, 0, 0), 938, 660);
    text("Zeit in Sekunden", 455, 700);
  } else if (indexX == 0) {
    text("Temperatur in °C", 455, 700);
  } else if (indexX == 1) {
    text("Luftfeuchte in %", 455, 700);
  } else if (indexX == 2) {
    text("CO  in ppm", 455, 700);
    textSize(16);
    text("2", 485, 710);
  } else if (indexX == 3) {
    text("TVOC in ppb", 455, 700);
  } else if (indexX == 4) {
    text("eCO  in ppm", 455, 700);
    textSize(16);
    text("2", 493, 710);
  }
  pushMatrix();
  textSize(20);
  translate(width/2, height/2);
  rotate(3*PI/2);
  fill(0);
  if (indexY == 0) {
    text("Temperatur in °C", height/2 -490, -width/2 + 60);
  } else if (indexY == 1) {
    text("Luftfeuchte in %", height/2 -490, -width/2 + 60);
  } else if (indexY == 2) {
    text("CO  in ppm", height/2 -490, -width/2 + 60);
    textSize(16);
    text("2", height/2 -462, -width/2 + 70);
    textSize(20);
  } else if (indexY == 3) {
    text("TVOC in ppb", height/2 -490, -width/2 + 60);
  } else if (indexY == 4) {
    text("eCO  in ppm", height/2 -490, -width/2 + 60);
    textSize(16);
    text("2", height/2 -455, -width/2 + 70);
    textSize(20);
  }
  popMatrix();





  back.show();
  zumObermenu.show();

  fill(0);
  text("Ordinate", 640, 35);
  text("Abszisse", 340, 35);
  if (zeroPercent) {
    stroke(255, 0, 0);
    fill(255, 0, 0);
  } else {
    fill(255);
    stroke(255, 0, 0);
  }
  ellipse(310, 110, 20, 20);

  if (fiftyPercent) {
    fill(0, 255, 0);
    stroke(0, 255, 0);
  } else {
    fill(255);
    stroke(0, 255, 0);
  }
  ellipse(600, 110, 20, 20);

  if (hundredPercent) {
    fill(0, 0, 255);
    stroke(0, 0, 255);
  } else {
    fill(255);
    stroke(0, 0, 255);
  }
  ellipse(925, 110, 20, 20);
  if (analyse_bool) {
    s.show();
    s.move();
    analyse();
  } else {
    fill(240);
    stroke(0);
    rect(1105, 190, 155, 85);
    fill(0);
    textSize(15);
    textAlign(LEFT);
    text("Fehlerbalken", 1110, 217);
    text("verbinden", 1110, 260);
    textSize(20);
    fehler_innenraum.show();
    verbinde_innenraum.show();
  }
  Station4_Auswertung_Rot.show();
  Station4_Auswertung_Blau.show();


  if (indexX != 6) {
    up2_Station4.show();
    down2_Station4.show();
  }
  if (indexX == 6) {
    genaueAnalyse.show();
  }

  if (genaueAnalyse.isClicked()) {
    if (analyse_bool) {
      analyse_bool = false;
    } else {
      analyse_bool = true;
    }
  }


  if (indexX != 6) {
    analyse_bool = false;
  }
}






void plot4(float[] arrX, float[] arrY, color c, float maxX, float minX, float maxY, float minY) {
  int maxIndex = 0;
  for (int i = arrX.length-1; i > 0; i--) {
    if (arrX[i] != 0) {
      maxIndex = i-1;
      break;
    }
  }


  boolean schonmalgezeichnet = false;
  stroke(c);
  if (verbinde_innenraum.checked) {
    for (int i = 1; i < maxIndex; i++) {
      float x1 = 120 + 830*(arrX[i-1]-minX)/(maxX-minX);
      float y1 = 640 - 500*(arrY[i-1]-minY)/(maxY-minY);

      float x2 = 120 + 830*(arrX[i]-minX)/(maxX-minX);
      float y2 = 640 - 500*(arrY[i]-minY)/(maxY-minY);

      if (x1 >= 120 && x1 <= 950 && x2 >= 120 && x2 <= 950 && y1 > 140 && y2 <= 640 && y2 > 140 && y1 <= 640) {
        line(x1, y1, x2, y2);
      }
    }
  } else {
    for (int i = 0; i < maxIndex; i++) {

      float x = 120 + 830*(arrX[i]-minX)/(maxX-minX);
      float y = 640 - 500*(arrY[i]-minY)/(maxY-minY);
      if (x >= 120 && x <= 950 && y > 140 && y <= 640) {
        line(x-3, y, x+3, y);
        line(x, y-3, x, y+3);
      }
    }
  }

  if (!schonmalgezeichnet) {
    strokeWeight(1);
    text(nf(maxX, 0, 1), 938, 660);
    text(nf(minX, 0, 1), 105, 660);
    text(nf(maxY, 0, 1), 65, 140);
    text(nf(minY, 0, 1), 65, 650);
    schonmalgezeichnet = true;
  }
}







void plotStation4_Auswertung(float[][] array, color c, int indexX, int indexY, int maxIndex, float absMinX, float absMaxX, float absMinY, float absMaxY) {
  // 1 Sekunde entspricht "830/time_Station4" Pixel
  stroke(c);
  fill(c);
  strokeWeight(2);
  //rect(120, 140, 830, 500);
  boolean schonmalgezeichnet = false;
  for (int i = 0; i < maxIndex; i++) {
    fill(c);
    float x = 120 + 830*(array[indexX][i]-absMinX)/(absMaxX-absMinX);
    float y = 640 - 500*(array[indexY][i]-absMinY)/(absMaxY-absMinY);
    ellipse(x, y, 5, 5);
    fill(0);
    if (!schonmalgezeichnet) {
      strokeWeight(1);
      text(nf(absMaxX, 0, 1), 938, 660);
      text(nf(absMinX, 0, 1), 105, 660);
      text(nf(absMaxY, 0, 1), 65, 140);
      text(nf(absMinY, 0, 1), 65, 650);
      schonmalgezeichnet = true;
    }
  }
}











//float m = (y2 - y1)/(x2-x1);
//float b = y1 - m*x1;
//if (y1 > 640 && y2 < 640 && y2 > 140) {
//  y1 = 640;
//  x1 = -(b - y1)/m;
//} else if (y2 > 640 && y1 < 640 && y1 > 140) {
//  y2 = 640;
//  x1 = -(b-y2)/m;
//} else if (y1 < 140 && y2 > 140 && y2 < 640) {

//  y1 = 140;
//  x1 = (y1-b)/m;
//} else if (y2 < 140 && y1 > 140 && y1 < 640) {
//  y2 = 140;
//  x2 = -(b-y2)/m;
//} else if (y1 < 140 && y2 > 640) {
//  y1 = 140;
//  x1 = (y1-b)/m;
//  y2 = 640;
//  x2 = -(b-y2)/m;
//} else if (y2 < 140 && y1> 640) {
//  y2 = 140;
//  x2 = (y1-b)/m;
//  y1 = 640;
//  x1 = -(b-y2)/m;
//}






void analyse() {
  float x1 = s.x1-120;
  float x2 = s.x2-120;

  // 1. Schritt: Finde die entsprechenden Array Indizes
  // Es gibt "indexInnenraumluftabc" Daten im Array, die auf 830 Pixel verteilt sind

  float dichteA = float(indexInnenraumlufta)/830;
  float dichteB = float(indexInnenraumluftb)/830;
  float dichteC = float(indexInnenraumluftc)/830;

  // Entsprechender Index zu x1, x2

  int indexX1A = round(x1*dichteA);
  int indexX2A = floor(x2*dichteA);

  int indexX1B = round(x1*dichteB);
  int indexX2B = floor(x2*dichteB);

  int indexX1C = round(x1*dichteC);
  int indexX2C = floor(x2*dichteC);


  // 2. Schritt: Merkmale Maximum, Minimum, Steigung und Mittelwert in diesem Intervall berechnen

  float MaxA = 0;
  float MinA = 99999;
  float MWA = 0;
  float SteigungA = 0;

  float MaxB = 0;
  float MinB = 99999;
  float MWB = 0;
  float SteigungB = 0;

  float MaxC = 0;
  float MinC = 99999;
  float MWC = 0;
  float SteigungC = 0;


  float MWA_fuerSteigung = 0;
  float MWB_fuerSteigung = 0;
  float MWC_fuerSteigung = 0;
  //Merkmale A
  if (indexX1A >= 0) {
    for (int i = indexX1A; i < indexX2A + 1; i++) {
      if (Innenraumlufta[indexY][i] > MaxA) {
        MaxA = Innenraumlufta[indexY][i];
      }
      if (Innenraumlufta[indexY][i] < MinA && Innenraumlufta[indexY][i] != 0) {
        MinA =  Innenraumlufta[indexY][i];
      }
      MWA += Innenraumlufta[indexY][i];

      // Für die Steigung
      MWA_fuerSteigung += Innenraumlufta[6][i];
    }
    MWA = MWA/(indexX2A+ 1 - indexX1A);
    MWA_fuerSteigung = MWA_fuerSteigung/(indexX2A+ 1 - indexX1A);

    float Steigung_Zaehler_A = 0;
    float Steigung_Nenner_A = 0;
    for (int i = indexX1A; i < indexX2A + 1; i++) {
      Steigung_Zaehler_A += (Innenraumlufta[6][i] - MWA_fuerSteigung)*(Innenraumlufta[indexY][i] - MWA);
      Steigung_Nenner_A += (Innenraumlufta[6][i] - MWA_fuerSteigung)*(Innenraumlufta[6][i] - MWA_fuerSteigung);
    }
    SteigungA = Steigung_Zaehler_A/Steigung_Nenner_A;
  }

  //Merkmale B
  if (indexX1B >= 0) {
    for (int i = indexX1B; i < indexX2B + 1; i++) {
      if (Innenraumluftb[indexY][i] > MaxB) {
        MaxB = Innenraumluftb[indexY][i];
      }
      if (Innenraumluftb[indexY][i] < MinB && Innenraumluftb[indexY][i] != 0) {
        MinB =  Innenraumluftb[indexY][i];
      }
      MWB += Innenraumluftb[indexY][i];
      MWB_fuerSteigung += Innenraumluftb[6][i];
    }
    MWB = MWB/(indexX2B + 1 - indexX1B);
    MWB_fuerSteigung = MWB_fuerSteigung/(indexX2B+ 1 - indexX1B);

    float Steigung_Zaehler_B = 0;
    float Steigung_Nenner_B = 0;
    for (int i = indexX1B; i < indexX2B + 1; i++) {
      Steigung_Zaehler_B += (Innenraumluftb[6][i] - MWB_fuerSteigung)*(Innenraumluftb[indexY][i] - MWB);
      Steigung_Nenner_B += (Innenraumluftb[6][i] - MWB_fuerSteigung)*(Innenraumluftb[6][i] - MWB_fuerSteigung);
    }
    SteigungB = Steigung_Zaehler_B/Steigung_Nenner_B;
  }
  // Merkmale C
  if (indexX1C >= 0) {
    for (int i = indexX1C; i < indexX2C + 1; i++) {
      if (Innenraumluftc[indexY][i] > MaxC) {
        MaxC = Innenraumluftc[indexY][i];
      }
      if (Innenraumluftc[indexY][i] < MinC && Innenraumluftc[indexY][i] != 0) {
        MinC =  Innenraumluftc[indexY][i];
      }
      MWC += Innenraumluftc[indexY][i];
      MWC_fuerSteigung += Innenraumluftc[6][i];
    }
    MWC = MWC/(indexX2C + 1 - indexX1C);
    MWC_fuerSteigung = MWC_fuerSteigung/(indexX2C+ 1 - indexX1C);

    float Steigung_Zaehler_C = 0;
    float Steigung_Nenner_C = 0;
    for (int i = indexX1C; i < indexX2C + 1; i++) {
      Steigung_Zaehler_C += (Innenraumluftc[6][i] - MWC_fuerSteigung)*(Innenraumluftc[indexY][i] - MWC);
      Steigung_Nenner_C += (Innenraumluftc[6][i] - MWC_fuerSteigung)*(Innenraumluftc[6][i] - MWC_fuerSteigung);
    }
    SteigungC = Steigung_Zaehler_C/Steigung_Nenner_C;
  }
  fill(255, 100, 100, 100);
  stroke(0);
  rect(1080, 100, 200, 25);
  fill(100, 255, 100, 100);
  rect(1080, 250, 200, 25);

  fill(100, 100, 255, 100);
  rect(1080, 400, 200, 25);
  fill(255);
  rect(1080, 425, 200, 115);
  rect(1080, 275, 200, 115);
  rect(1080, 125, 200, 115);
  fill(0);
  stroke(0);
  line(1080, 125, 1280, 125);
  line(1080, 275, 1280, 275);
  line(1080, 425, 1280, 425);

  noStroke();

  String Einheit = "";



  if (indexY == 0) {
    Einheit = "°C";
  } else if (indexY == 1) {
    Einheit = "%";
  } else if (indexY == 2) {
    Einheit = "ppm";
  } else if (indexY == 3) {
    Einheit = "ppb";
  } else if (indexY == 4) {
    Einheit = "ppm";
  }

  textSize(16);
  textAlign(CENTER);
  text("0% Lüfter", 1180, 120);
  text("50% Lüfter", 1180, 270);
  text("100% Lüfter", 1180, 420);

  text("Maximum: " + nf(MaxA, 0, 1) + " in " + Einheit, 1180, 150);
  text("Minimum: " + nf(MinA, 0, 1) + " in " + Einheit, 1180, 175);
  text("Mittelwert: " + nf(MWA, 0, 1) + " in " + Einheit, 1180, 200);
  text("Steigung: " + nf(SteigungA, 0, 1) + " in " + Einheit + "/s", 1180, 225);

  text("Maximum: " + nf(MaxB, 0, 1) + " in " + Einheit, 1180, 300);
  text("Minimum: " + nf(MinB, 0, 1) + " in " + Einheit, 1180, 325);
  text("Mittelwert: " + nf(MWB, 0, 1) + " in " + Einheit, 1180, 350);
  text("Steigung: " + nf(SteigungB, 0, 1)+ " in " + Einheit + "/s", 1180, 375);

  text("Maximum: " + nf(MaxC, 0, 1) + " in " + Einheit, 1180, 450);
  text("Minimum: " + nf(MinC, 0, 1) + " in " + Einheit, 1180, 475);
  text("Mittelwert: " + nf(MWC, 0, 1) + " in " + Einheit, 1180, 500);
  text("Steigung: " + nf(SteigungC, 0, 1)+ " in " + Einheit + "/s", 1180, 525);
  textAlign(CORNER);
}



boolean analyse_bool = false;

class slider {
  float x1;
  float x2;
  boolean active1;
  boolean active2;

  slider(float x1_, float x2_, boolean active1_, boolean active2_) {
    x1 = x1_;
    x2 = x2_;
    active1 = active1_;
    active2 = active2_;
  }


  void show() {
    //Boden = Dreieck
    stroke(100, 100, 255);
    fill(100, 100, 255);
    beginShape();
    vertex(x1-10, 650);
    vertex(x1, 640);
    vertex(x1+10, 650);
    vertex(x1-10, 650);
    endShape();
    strokeWeight(3);
    stroke(200);
    line(x1, 140, x1, 637);

    stroke(100, 100, 255);
    fill(100, 100, 255);
    beginShape();
    vertex(x2-10, 650);
    vertex(x2, 640);
    vertex(x2+10, 650);
    vertex(x2-10, 650);
    endShape();
    strokeWeight(3);
    stroke(200);
    line(x2, 140, x2, 637);
    strokeWeight(1);

    fill(200, 200, 255, 100);
    rect(x1, 140, (x2-x1), 500);
  }


  void move() {
    if (mouseX > (x1 - 10)*scale_factor && mouseX < (x1 + 10)*scale_factor && mousePressed) {
      active1 = true;
    }
    if (mouseX > (x2 - 10)*scale_factor && mouseX < (x2 + 10)*scale_factor && mousePressed) {
      active2 = true;
    }

    if (!mousePressed) {
      active1 = false;
      active2 = false;
    }

    if (active1) {
      x1 = mouseX; 
      if (x1 < 120) {
        x1 = 120;
      }
      if (x1 > 930) {
        x1 = 930;
      }
    }
    if (active2) {
      x2 = mouseX; 
      if (x2 < 170) {
        x2 = 170;
      }
      if (x2 > 950) {
        x2 = 950;
      }
    }

    if (abs(x1 - x2) < 50) {
      x1 = x2- 50;
      x2 = x1 + 50;
    }
  }
}



void mouseReleased() {
  if (mouseX > (s.x1 - 10)*scale_factor && mouseX < (s.x1 + 10)*scale_factor) {
    s.active1 = false;
  }
  if (mouseX > (s.x2 - 10)*scale_factor && mouseX < (s.x2 + 10)*scale_factor) {
    s.active2 = false;
  }
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
