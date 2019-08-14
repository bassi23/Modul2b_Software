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
int indexInnenraumlufta = 0;
int indexInnenraumluftaMax = 0;
float currentTime4a = -10000000;
boolean reset_bool_station4 = false;
int scale_Innenraum1 = 0;
int scale_Innenraum2 = 0;

void Innenraumluft_a() {
  fill(0);
  textSize(20);
  text("Station 4 - Innenraumluftqualität", 20, 50);
  text("a) Lasse den Ventilator ausgeschaltet und lüfte die Messkammer zunächst gut durch. Starte dann die Messung. Sobald 30 Se-\nkunden abgelaufen sind, setze dich in die Messkammer, schließe die Tür und warte bis 5 Minuten abgelaufen ist.", 20, 100);
  up1.show();
  down1.show();
  up2.show();
  down2.show();


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
  String textBlau = "";
  String textRot = "";
  int wasZeichnenRot = int(Sensoren_Station4_Rot.getValue()-1);
  int wasZeichnenBlau = int(Sensoren_Station4_Blau.getValue()-1);
  if (Sensoren_Station4_Rot.getValue() == 1) {
    T_left = true;
    textRot = "Temperatur in °C";
  } else if (Sensoren_Station4_Rot.getValue() == 2) {
    H_left = true;
    textRot = "Luftfeuchte in %";
  } else if (Sensoren_Station4_Rot.getValue() == 3) {
    CO2_left = true;
    textRot = "CO2 in ppm";
  } else if (Sensoren_Station4_Rot.getValue() == 4) {
    tvoc_left = true;
    textRot = "TVOC in ppb";
  } else if (Sensoren_Station4_Rot.getValue() == 5) {
    eco2_left = true;
    textRot = "eCO2 in ppm";
  }
  if (Sensoren_Station4_Blau.getValue() == 1) {
    T_right = true;
    textBlau =  "Temperatur in °C";
  } else if (Sensoren_Station4_Blau.getValue() == 2) {
    H_right = true;
    textBlau = "Luftfeuchte in %";
  } else if (Sensoren_Station4_Blau.getValue() == 3) {
    CO2_right = true;
    textBlau =  "CO2 in ppm";
  } else if (Sensoren_Station4_Blau.getValue() == 4) {
    tvoc_right = true;
    textBlau = "TVOC in ppb";
  } else if (Sensoren_Station4_Blau.getValue() == 5) {
    eco2_right = true;
    textBlau = "eCO2 in ppm";
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
  fill(255);
  stroke(0);
  rect(175, 200, 930, 450);
  fill(0);

  textSize(20);
  if ((millis() - currentTime4a)/1000 < t) {
    text(nf((millis() - currentTime4a)/1000, 0, 1), 1100, 690);
  }


  if (Station4agestartet == false) {
    Station4Start.show();
    reset_innenraum.hide();
  } else {
    Station4Start.hide();
    reset_innenraum.show();
  }

  if (Station4Start.isClicked()) {
    Station4agestartet = true;
    currentTime4a = millis();
    indexInnenraumlufta = 0;
  }
  if (scale_Innenraum1 != 0 || scale_Innenraum2 != 0) {
    stroke(200);
    for (int i = 0; i < 4; i++) {
      line(175, 290 + 90*i, 1105, 290 + 90*i);
    }
  }


  stroke(0);
  line(175 + 30*930/t, 200, 175 + 30*930/t, 650);
  line(175 + 30*930/t, 200, 175 + 30*930/t, 650);

  fill(200, 255, 200, 200);
  rect(175, 200, 30*930/t, 450);
  fill(255, 200, 200, 200);
  rect(175 + 30*930/t, 200, 240*930/t, 450);
  fill(255, 255, 200, 200);
  rect(175 + 270*930/t, 200, 30*930/t, 450);


  float maxRot = 0;
  float minRot = 0;
  float maxBlau = 0;
  float minBlau = 0;

  if (scale_Innenraum1 == 0) {
    if (wasZeichnenRot != -1) {
      maxRot = findMax(Innenraumlufta[wasZeichnenRot]);
      minRot = findMin(Innenraumlufta[wasZeichnenRot]);
    }
  } else if (scale_Innenraum1 == 1) {
    if (eco2_left) {
      maxRot = 500;
    } else if (tvoc_left) {
      maxRot = 100;
    } else if (T_left) {
      maxRot = 20;
    } else if (H_left) {
      maxRot = 25;
    } else if (CO2_left) {
      maxRot = 500;
    }
  } else if (scale_Innenraum1 == 2) {
    if (eco2_left) {
      maxRot = 1000;
    } else if (tvoc_left) {
      maxRot = 250;
    } else if (T_left) {
      maxRot = 30;
    } else if (H_left) {
      maxRot = 50;
    } else if (CO2_left) {
      maxRot = 1000;
    }
  } else if (scale_Innenraum1 == 3) {
    if (eco2_left) {
      maxRot = 2000;
    } else if (tvoc_left) {
      maxRot = 500;
    } else if (T_left) {
      maxRot = 40;
    } else if (H_left) {
      maxRot = 75;
    } else if (CO2_left) {
      maxRot = 2000;
    }
  } else if (scale_Innenraum1 == 4) {
    if (eco2_left) {
      maxRot = 5000;
    } else if (tvoc_left) {
      maxRot = 1000;
    } else if (T_left) {
      maxRot = 50;
    } else if (H_left) {
      maxRot = 100;
    } else if (CO2_left) {
      maxRot = 5000;
    }
  }

  if (scale_Innenraum2 == 0) {
    if (wasZeichnenBlau != -1) {
      maxBlau = findMax(Innenraumlufta[wasZeichnenBlau]);
      minBlau = findMin(Innenraumlufta[wasZeichnenBlau]);
    }
  } else if (scale_Innenraum2 == 1) {
    if (eco2_right) {
      maxBlau = 500;
    } else if (tvoc_right) {
      maxBlau = 100;
    } else if (T_right) {
      maxBlau = 20;
    } else if (H_right) {
      maxBlau = 25;
    } else if (CO2_right) {
      maxBlau = 500;
    }
  } else if (scale_Innenraum2 == 2) {
    if (eco2_right) {
      maxBlau = 1000;
    } else if (tvoc_right) {
      maxBlau = 250;
    } else if (T_right) {
      maxBlau = 30;
    } else if (H_right) {
      maxBlau = 50;
    } else if (CO2_right) {
      maxBlau = 1000;
    }
  } else if (scale_Innenraum2== 3) {
    if (eco2_right) {
      maxBlau = 2000;
    } else if (tvoc_right) {
      maxBlau = 500;
    } else if (T_right) {
      maxBlau = 40;
    } else if (H_right) {
      maxBlau = 75;
    } else if (CO2_right) {
      maxBlau = 2000;
    }
  } else if (scale_Innenraum2 == 4) {
    if (eco2_right) {
      maxBlau = 5000;
    } else if (tvoc_right) {
      maxBlau = 1000;
    } else if (T_right) {
      maxBlau = 50;
    } else if (H_right) {
      maxBlau = 100;
    } else if (CO2_right) {
      maxBlau = 5000;
    }
  }
  innenraumluft_graph(Innenraumlufta, wasZeichnenRot, color(255, 0, 0), indexInnenraumlufta, minRot, maxRot, textRot);
  innenraumluft_graph(Innenraumlufta, wasZeichnenBlau, color(0, 0, 255), indexInnenraumlufta, minBlau, maxBlau, textBlau);
  text("0", 160, 680);
  text("Zeit in Sekunden", 580, 700);
  strokeWeight(4);

  if (scale_Innenraum1 != 0) {
    if (maxRot != 0 && minRot != 99999) {
      fill(255, 0, 0);
      for (int i = 1; i < 5; i++) {
        text(nf(i*maxRot/5, 0, 0), 120, 650 - 90 * (i));
      }
    }
  }

  if (scale_Innenraum2 != 0) {
    fill(0, 0, 255);
    if (maxBlau != 0 && minBlau != 99999) {
      for (int i = 1; i < 5; i++) {
        text(nf(i*maxBlau/5, 0, 0), 1120, 650 - 90 * (i));
      }
    }
  }
  if ((millis() - currentTime4a)/1000 > t && currentTime4a > 0) {
    Station4b.show();
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


void innenraumluft_graph(float[][] array, int chosen, color c, int index, float min, float max, String text) {
  if (chosen != -1) {
    for (int i = 1; i < index; i++) {
      float x1 = 175 + 930*array[6][i]/t; 
      float x2 = 175 + 930*array[6][(i-1)]/t;
      float y1 = 650 - (array[chosen][i]-min)*450/(max-min);
      float y2 = 650 - (array[chosen][i-1]-min)*450/(max-min);   
      stroke(c);
      if (y1 <= 650 && y2 <= 650 && y1 >= 200 && y2>= 200) {
        if (x1 <= 1105 && x2 <= 1105 && x1 >= 175 && x2 >= 175) {
          line(x1, y1, x2, y2);
        }
      }
    }
    textAlign(CENTER);
    if (c ==  color(255, 0, 0)) {
      pushMatrix();
      fill(c);
      if (max != 0 && min != 99999) {
        text(nf(max, 0, 0), 140, 208);
        text(nf(min, 0, 0), 140, 650);
      }
      translate(width/2, height/2);
      rotate(3*PI/2);

      text(text, -75, -550);
      popMatrix();
    } else if (c == color(0, 0, 255)) {
      pushMatrix();
      fill(c);
      if (max != 0 && min != 99999) {
        text(nf(max, 0, 0), 1140, 208);
        text(nf(min, 0, 0), 1140, 650);
      }
      translate(width/2, height/2);
      rotate(PI/2);
      text(text, 75, -550);
      popMatrix();
    }
  }
  fill(0);
  textAlign(CORNER);
}









float[][] Innenraumluftb = new float[7][5000];
boolean Station4bgestartet = false;
int indexInnenraumluftb = 0;
int indexInnenraumluftbMax = 0;
float currentTime4b = -10000000;


void Innenraumluft_b() {
  fill(0);
  textSize(20);
  text("Station 4 - Innenraumluftqualität", 20, 50);
  text("b) Lasse nun den Ventilator auf 50% laufen und wiederhole den Versuch. Setze dich nach 30 Sekunden in die Messkammer,\nschließe die Tür und warte bis 5 Minuten abgelaufen sind.", 20, 100);
  up1.show();
  down1.show();
  up2.show();
  down2.show();
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
  String textBlau = "";
  String textRot = "";
  int wasZeichnenRot = int(Sensoren_Station4_Rot.getValue()-1);
  int wasZeichnenBlau = int(Sensoren_Station4_Blau.getValue()-1);
  if (Sensoren_Station4_Rot.getValue() == 1) {
    T_left = true;
    textRot = "Temperatur in °C";
  } else if (Sensoren_Station4_Rot.getValue() == 2) {
    H_left = true;
    textRot = "Luftfeuchte in %";
  } else if (Sensoren_Station4_Rot.getValue() == 3) {
    CO2_left = true;
    textRot = "CO2 in ppm";
  } else if (Sensoren_Station4_Rot.getValue() == 4) {
    tvoc_left = true;
    textRot = "TVOC in ppb";
  } else if (Sensoren_Station4_Rot.getValue() == 5) {
    eco2_left = true;
    textRot = "eCO2 in ppm";
  }
  if (Sensoren_Station4_Blau.getValue() == 1) {
    T_right = true;
    textBlau =  "Temperatur in °C";
  } else if (Sensoren_Station4_Blau.getValue() == 2) {
    H_right = true;
    textBlau = "Luftfeuchte in %";
  } else if (Sensoren_Station4_Blau.getValue() == 3) {
    CO2_right = true;
    textBlau =  "CO2 in ppm";
  } else if (Sensoren_Station4_Blau.getValue() == 4) {
    tvoc_right = true;
    textBlau = "TVOC in ppb";
  } else if (Sensoren_Station4_Blau.getValue() == 5) {
    eco2_right = true;
    textBlau = "eCO2 in ppm";
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
  fill(255);
  stroke(0);
  rect(175, 200, 930, 450);
  fill(0);

  textSize(20);
  if ((millis() - currentTime4b)/1000 < t) {
    text(nf((millis() - currentTime4b)/1000, 0, 1), 1100, 690);
  }


  if (Station4bgestartet == false) {
    Station4Start.show();
    reset_innenraum.hide();
  } else {
    Station4Start.hide();
    reset_innenraum.show();
  }

  if (Station4Start.isClicked()) {
    Station4bgestartet = true;
    currentTime4b = millis();
    indexInnenraumluftb = 0;
  }
  if (scale_Innenraum1 != 0 || scale_Innenraum2 != 0) {
    stroke(200);
    for (int i = 0; i < 4; i++) {
      line(175, 290 + 90*i, 1105, 290 + 90*i);
    }
  }


  stroke(0);
  line(175 + 30*930/t, 200, 175 + 30*930/t, 650);
  line(175 + 30*930/t, 200, 175 + 30*930/t, 650);

  fill(200, 255, 200, 200);
  rect(175, 200, 30*930/t, 450);
  fill(255, 200, 200, 200);
  rect(175 + 30*930/t, 200, 240*930/t, 450);
  fill(255, 255, 200, 200);
  rect(175 + 270*930/t, 200, 30*930/t, 450);


  float maxRot = 0;
  float minRot = 0;
  float maxBlau = 0;
  float minBlau = 0;

  if (scale_Innenraum1 == 0) {
    if (wasZeichnenRot != -1) {
      maxRot = findMax(Innenraumluftb[wasZeichnenRot]);
      minRot = findMin(Innenraumluftb[wasZeichnenRot]);
    }
  } else if (scale_Innenraum1 == 1) {
    if (eco2_left) {
      maxRot = 500;
    } else if (tvoc_left) {
      maxRot = 100;
    } else if (T_left) {
      maxRot = 20;
    } else if (H_left) {
      maxRot = 25;
    } else if (CO2_left) {
      maxRot = 500;
    }
  } else if (scale_Innenraum1 == 2) {
    if (eco2_left) {
      maxRot = 1000;
    } else if (tvoc_left) {
      maxRot = 250;
    } else if (T_left) {
      maxRot = 30;
    } else if (H_left) {
      maxRot = 50;
    } else if (CO2_left) {
      maxRot = 1000;
    }
  } else if (scale_Innenraum1 == 3) {
    if (eco2_left) {
      maxRot = 2000;
    } else if (tvoc_left) {
      maxRot = 500;
    } else if (T_left) {
      maxRot = 40;
    } else if (H_left) {
      maxRot = 75;
    } else if (CO2_left) {
      maxRot = 2000;
    }
  } else if (scale_Innenraum1 == 4) {
    if (eco2_left) {
      maxRot = 5000;
    } else if (tvoc_left) {
      maxRot = 1000;
    } else if (T_left) {
      maxRot = 50;
    } else if (H_left) {
      maxRot = 100;
    } else if (CO2_left) {
      maxRot = 5000;
    }
  }

  if (scale_Innenraum2 == 0) {
    if (wasZeichnenBlau != -1) {
      maxBlau = findMax(Innenraumluftb[wasZeichnenBlau]);
      minBlau = findMin(Innenraumluftb[wasZeichnenBlau]);
    }
  } else if (scale_Innenraum2 == 1) {
    if (eco2_right) {
      maxBlau = 500;
    } else if (tvoc_right) {
      maxBlau = 100;
    } else if (T_right) {
      maxBlau = 20;
    } else if (H_right) {
      maxBlau = 25;
    } else if (CO2_right) {
      maxBlau = 500;
    }
  } else if (scale_Innenraum2 == 2) {
    if (eco2_right) {
      maxBlau = 1000;
    } else if (tvoc_right) {
      maxBlau = 250;
    } else if (T_right) {
      maxBlau = 30;
    } else if (H_right) {
      maxBlau = 50;
    } else if (CO2_right) {
      maxBlau = 1000;
    }
  } else if (scale_Innenraum2== 3) {
    if (eco2_right) {
      maxBlau = 2000;
    } else if (tvoc_right) {
      maxBlau = 500;
    } else if (T_right) {
      maxBlau = 40;
    } else if (H_right) {
      maxBlau = 75;
    } else if (CO2_right) {
      maxBlau = 2000;
    }
  } else if (scale_Innenraum2 == 4) {
    if (eco2_right) {
      maxBlau = 5000;
    } else if (tvoc_right) {
      maxBlau = 1000;
    } else if (T_right) {
      maxBlau = 50;
    } else if (H_right) {
      maxBlau = 100;
    } else if (CO2_right) {
      maxBlau = 5000;
    }
  }
  innenraumluft_graph(Innenraumluftb, wasZeichnenRot, color(255, 0, 0), indexInnenraumluftb, minRot, maxRot, textRot);
  innenraumluft_graph(Innenraumluftb, wasZeichnenBlau, color(0, 0, 255), indexInnenraumluftb, minBlau, maxBlau, textBlau);
  text("0", 160, 680);
  text("Zeit in Sekunden", 580, 700);
  strokeWeight(4);

  if (scale_Innenraum1 != 0) {
    if (maxRot != 0 && minRot != 99999) {
      fill(255, 0, 0);
      for (int i = 1; i < 5; i++) {
        text(nf(i*maxRot/5, 0, 0), 120, 650 - 90 * (i));
      }
    }
  }

  if (scale_Innenraum2 != 0) {
    fill(0, 0, 255);
    if (maxBlau != 0 && minBlau != 99999) {
      for (int i = 1; i < 5; i++) {
        text(nf(i*maxBlau/5, 0, 0), 1120, 650 - 90 * (i));
      }
    }
  }
  if ((millis() - currentTime4b)/1000 > t && currentTime4b > 0) {
    Station4c.show();
  }
}
float[][] Innenraumluftc = new float[7][5000];
boolean Station4cgestartet = false;
int indexInnenraumluftc = 0;
int indexInnenraumluftcMax = 0;
float currentTime4c = -10000000;


void Innenraumluft_c() {
  fill(0);
  textSize(20);
  text("Station 4 - Innenraumluftqualität", 20, 50);
  text("c) Lasse nun den Ventilator auf 100% laufen und wiederhole den Versuch. Setze dich nach 30 Sekunden in die Messkammer,\nschließe die Tür und warte bis 5 Minuten abgelaufen sind.", 20, 100);

  up1.show();
  down1.show();
  up2.show();
  down2.show();
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
  String textBlau = "";
  String textRot = "";
  int wasZeichnenRot = int(Sensoren_Station4_Rot.getValue()-1);
  int wasZeichnenBlau = int(Sensoren_Station4_Blau.getValue()-1);
  if (Sensoren_Station4_Rot.getValue() == 1) {
    T_left = true;
    textRot = "Temperatur in °C";
  } else if (Sensoren_Station4_Rot.getValue() == 2) {
    H_left = true;
    textRot = "Luftfeuchte in %";
  } else if (Sensoren_Station4_Rot.getValue() == 3) {
    CO2_left = true;
    textRot = "CO2 in ppm";
  } else if (Sensoren_Station4_Rot.getValue() == 4) {
    tvoc_left = true;
    textRot = "TVOC in ppb";
  } else if (Sensoren_Station4_Rot.getValue() == 5) {
    eco2_left = true;
    textRot = "eCO2 in ppm";
  }
  if (Sensoren_Station4_Blau.getValue() == 1) {
    T_right = true;
    textBlau =  "Temperatur in °C";
  } else if (Sensoren_Station4_Blau.getValue() == 2) {
    H_right = true;
    textBlau = "Luftfeuchte in %";
  } else if (Sensoren_Station4_Blau.getValue() == 3) {
    CO2_right = true;
    textBlau =  "CO2 in ppm";
  } else if (Sensoren_Station4_Blau.getValue() == 4) {
    tvoc_right = true;
    textBlau = "TVOC in ppb";
  } else if (Sensoren_Station4_Blau.getValue() == 5) {
    eco2_right = true;
    textBlau = "eCO2 in ppm";
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
  fill(255);
  stroke(0);
  rect(175, 200, 930, 450);
  fill(0);

  textSize(20);
  if ((millis() - currentTime4c)/1000 < t) {
    text(nf((millis() - currentTime4c)/1000, 0, 1), 1100, 690);
  }


  if (Station4cgestartet == false) {
    Station4Start.show();
    reset_innenraum.hide();
  } else {
    Station4Start.hide();
    reset_innenraum.show();
  }

  if (Station4Start.isClicked()) {
    Station4cgestartet = true;
    currentTime4c = millis();
    indexInnenraumluftc = 0;
  }
  if (scale_Innenraum1 != 0 || scale_Innenraum2 != 0) {
    stroke(200);
    for (int i = 0; i < 4; i++) {
      line(175, 290 + 90*i, 1105, 290 + 90*i);
    }
  }


  stroke(0);
  line(175 + 30*930/t, 200, 175 + 30*930/t, 650);
  line(175 + 30*930/t, 200, 175 + 30*930/t, 650);

  fill(200, 255, 200, 200);
  rect(175, 200, 30*930/t, 450);
  fill(255, 200, 200, 200);
  rect(175 + 30*930/t, 200, 240*930/t, 450);
  fill(255, 255, 200, 200);
  rect(175 + 270*930/t, 200, 30*930/t, 450);


  float maxRot = 0;
  float minRot = 0;
  float maxBlau = 0;
  float minBlau = 0;

  if (scale_Innenraum1 == 0) {
    if (wasZeichnenRot != -1) {
      maxRot = findMax(Innenraumluftc[wasZeichnenRot]);
      minRot = findMin(Innenraumluftc[wasZeichnenRot]);
    }
  } else if (scale_Innenraum1 == 1) {
    if (eco2_left) {
      maxRot = 500;
    } else if (tvoc_left) {
      maxRot = 100;
    } else if (T_left) {
      maxRot = 20;
    } else if (H_left) {
      maxRot = 25;
    } else if (CO2_left) {
      maxRot = 500;
    }
  } else if (scale_Innenraum1 == 2) {
    if (eco2_left) {
      maxRot = 1000;
    } else if (tvoc_left) {
      maxRot = 250;
    } else if (T_left) {
      maxRot = 30;
    } else if (H_left) {
      maxRot = 50;
    } else if (CO2_left) {
      maxRot = 1000;
    }
  } else if (scale_Innenraum1 == 3) {
    if (eco2_left) {
      maxRot = 2000;
    } else if (tvoc_left) {
      maxRot = 500;
    } else if (T_left) {
      maxRot = 40;
    } else if (H_left) {
      maxRot = 75;
    } else if (CO2_left) {
      maxRot = 2000;
    }
  } else if (scale_Innenraum1 == 4) {
    if (eco2_left) {
      maxRot = 5000;
    } else if (tvoc_left) {
      maxRot = 1000;
    } else if (T_left) {
      maxRot = 50;
    } else if (H_left) {
      maxRot = 100;
    } else if (CO2_left) {
      maxRot = 5000;
    }
  }

  if (scale_Innenraum2 == 0) {
    if (wasZeichnenBlau != -1) {
      maxBlau = findMax(Innenraumluftc[wasZeichnenBlau]);
      minBlau = findMin(Innenraumluftc[wasZeichnenBlau]);
    }
  } else if (scale_Innenraum2 == 1) {
    if (eco2_right) {
      maxBlau = 500;
    } else if (tvoc_right) {
      maxBlau = 100;
    } else if (T_right) {
      maxBlau = 20;
    } else if (H_right) {
      maxBlau = 25;
    } else if (CO2_right) {
      maxBlau = 500;
    }
  } else if (scale_Innenraum2 == 2) {
    if (eco2_right) {
      maxBlau = 1000;
    } else if (tvoc_right) {
      maxBlau = 250;
    } else if (T_right) {
      maxBlau = 30;
    } else if (H_right) {
      maxBlau = 50;
    } else if (CO2_right) {
      maxBlau = 1000;
    }
  } else if (scale_Innenraum2== 3) {
    if (eco2_right) {
      maxBlau = 2000;
    } else if (tvoc_right) {
      maxBlau = 500;
    } else if (T_right) {
      maxBlau = 40;
    } else if (H_right) {
      maxBlau = 75;
    } else if (CO2_right) {
      maxBlau = 2000;
    }
  } else if (scale_Innenraum2 == 4) {
    if (eco2_right) {
      maxBlau = 5000;
    } else if (tvoc_right) {
      maxBlau = 1000;
    } else if (T_right) {
      maxBlau = 50;
    } else if (H_right) {
      maxBlau = 100;
    } else if (CO2_right) {
      maxBlau = 5000;
    }
  }
  innenraumluft_graph(Innenraumluftc, wasZeichnenRot, color(255, 0, 0), indexInnenraumluftc, minRot, maxRot, textRot);
  innenraumluft_graph(Innenraumluftc, wasZeichnenBlau, color(0, 0, 255), indexInnenraumluftc, minBlau, maxBlau, textBlau);
  text("0", 160, 680);
  text("Zeit in Sekunden", 580, 700);
  strokeWeight(4);

  if (scale_Innenraum1 != 0) {
    if (maxRot != 0 && minRot != 99999) {
      fill(255, 0, 0);
      for (int i = 1; i < 5; i++) {
        text(nf(i*maxRot/5, 0, 0), 120, 650 - 90 * (i));
      }
    }
  }

  if (scale_Innenraum2 != 0) {
    fill(0, 0, 255);
    if (maxBlau != 0 && minBlau != 99999) {
      for (int i = 1; i < 5; i++) {
        text(nf(i*maxBlau/5, 0, 0), 1120, 650 - 90 * (i));
      }
    }
  }
  if ((millis() - currentTime4c)/1000 > t && currentTime4c > 0) {
    Station4Auswertung.show();
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
