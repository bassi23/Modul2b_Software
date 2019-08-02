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

int t = 10;



float[][] Innenraumlufta = new float[7][5000];
boolean Station4agestartet = false;
int indexInnenraumlufta = 0;
int indexInnenraumluftaMax = 0;
float currentTime4a = -10000000;
boolean reset_bool_station4 = false;
int scale_Innenraum = 0;

void Innenraumluft_a() {
  fill(0);
  textSize(20);
  text("Station 4 - Innenraumluftqualität", 20, 50);
  text("a) Lasse den Ventilator ausgeschaltet und lüfte die Messkammer zunächst gut durch. Starte dann die Messung. Sobald 30 Se-\nkunden abgelaufen sind, setze dich in die Messkammer, schließe die Tür und warte bis 5 Minuten abgelaufen ist.", 20, 100);
  up1.show();
  down1.show();
  innenraumluft.show();


  if (up1.isClicked()) {
    scale_Innenraum += 1;
    if (scale_Innenraum > 4) {
      scale_Innenraum = 0;
    }
  }

  if (down1.isClicked()) {
    scale_Innenraum -= 1;
    if (scale_Innenraum < 0) {
      scale_Innenraum = 4;
    }
  }




  fill(255);
  stroke(0);
  rect(175, 200, 930, 450);
  fill(0);
  textSize(25);
  text("T", 190, 172);
  text("H", 380, 172);
  text("TVOC", 560, 172);
  text("CO", 770, 172);
  text("eCO", 970, 172);

  textSize(16);
  text("2                                        2", 802, 185);
  textSize(25);
  onlyOne(innenraumluft, "T", "H", "TVOC", "CO2", "eCO2");
  boolean Innenraum_T = innenraumluft.getState("T");
  boolean Innenraum_H = innenraumluft.getState("H");
  boolean Innenraum_TVOC = innenraumluft.getState("TVOC");
  boolean Innenraum_CO2 = innenraumluft.getState("CO2");
  boolean Innenraum_eCO2 = innenraumluft.getState("eCO2");


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

  float max = 0;
  float min = 9999999;
  int wasZeichnen = 5;

  if (Innenraum_T) {
    wasZeichnen = 0;
  } else if (Innenraum_H) {
    wasZeichnen = 1;
  } else if (Innenraum_CO2) {
    wasZeichnen = 2;
  } else if (Innenraum_TVOC) {
    wasZeichnen = 3;
  } else if (Innenraum_eCO2) {
    wasZeichnen = 4;
  }

  if (scale_Innenraum != 0) {
    stroke(200);
    for (int i = 0; i < 4; i++) {
      line(175, 290 + 90*i, 1105, 290 + 90*i);
    }
  }


  if (scale_Innenraum == 0) {
    for (int i = 0; i < indexInnenraumlufta; i++) {
      if (Innenraumlufta[wasZeichnen][i] > max) {
        max = Innenraumlufta[wasZeichnen][i];
      }
      if (Innenraumlufta[wasZeichnen][i] < min) {
        min = Innenraumlufta[wasZeichnen][i];
      }
    }
  } else if (scale_Innenraum == 1) {
    min = 0;
    if (wasZeichnen == 0) {
      max = 10;
    } else if (wasZeichnen == 1) {
      max = 20;
    } else if (wasZeichnen == 2 || wasZeichnen == 4) {
      max = 500;
    } else {
      max = 100;
    }
  } else if (scale_Innenraum == 2) {
    min = 0;
    if (wasZeichnen == 0) {
      max = 20;
    } else if (wasZeichnen == 1) {
      max = 40;
    } else if (wasZeichnen == 2 || wasZeichnen == 4) {
      max = 1000;
    } else {
      max = 200;
    }
  } else if (scale_Innenraum == 3) {
    min = 0;
    if (wasZeichnen == 0) {
      max = 30;
    } else if (wasZeichnen == 1) {
      max = 60;
    } else if (wasZeichnen == 2 || wasZeichnen == 4) {
      max = 2000;
    } else {
      max = 500;
    }
  } else if (scale_Innenraum == 3) {
    min = 0;
    if (wasZeichnen == 0) {
      max = 40;
    } else if (wasZeichnen == 1) {
      max = 80;
    } else if (wasZeichnen == 2 || wasZeichnen == 4) {
      max = 5000;
    } else {
      max = 1000;
    }
  } else if (scale_Innenraum == 4) {
    min = 0;
    if (wasZeichnen == 0) {
      max = 50;
    } else if (wasZeichnen == 1) {
      max = 100;
    } else if (wasZeichnen == 2 || wasZeichnen == 4) {
      max = 10000;
    } else {
      max = 5000;
    }
  }

  if (scale_Innenraum != 0) {
    for (int i = 1; i < 5; i++) {
      float y = max/5;
      text(nf(i*y, 0, 0), 120, 650 - 90*i);
    }
  }

  if (min != 9999999 && max != 0) {
    text(nf(max, 0, 0), 120, 200);
    text(nf(min, 0, 0), 120, 650);
  }
  text("0", 160, 680);
  text("Zeit in Sekunden", 580, 700);

  strokeWeight(4);
  for (int i = 1; i < indexInnenraumlufta; i++) {

    float x1 = 175 + (i)*930/(indexInnenraumlufta-1); 
    float x2 = 175 + (i-1)*930/(indexInnenraumlufta-1);
    float y1 = 650 - (Innenraumlufta[wasZeichnen][i]-min)*450/(max-min);
    float y2 = 650 - (Innenraumlufta[wasZeichnen][i-1]-min)*450/(max-min);   

    if (wasZeichnen == 0) {
      stroke(255, 0, 0);
    } else if (wasZeichnen == 1) {
      stroke(0, 0, 255);
    } else if (wasZeichnen == 2) {
      stroke(255, 0, 255);
    } else if (wasZeichnen == 3) {
      stroke(0, 155, 0);
    } else if (wasZeichnen == 4) {
      stroke(0);
    }
    if (Innenraumlufta[wasZeichnen][i]<= max && Innenraumlufta[wasZeichnen][i] >= min && Innenraumlufta[wasZeichnen][i-1] <=max && Innenraumlufta[wasZeichnen][i-1] >= min) {
      line(x1, y1, x2, y2);
    }
  }

  if ((millis() - currentTime4a)/1000 > t && currentTime4a > 0) {
    text(t, 1100, 690);
    Station4b.show();
  }
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
  innenraumluft.show();

  if (up1.isClicked()) {
    scale_Innenraum += 1;
    if (scale_Innenraum > 4) {
      scale_Innenraum = 0;
    }
  }

  if (down1.isClicked()) {
    scale_Innenraum -= 1;
    if (scale_Innenraum < 0) {
      scale_Innenraum = 4;
    }
  }




  fill(255);
  stroke(0);
  rect(175, 200, 930, 450);
  fill(0);
  textSize(25);
  text("T", 190, 172);
  text("H", 380, 172);
  text("TVOC", 560, 172);
  text("CO", 770, 172);
  text("eCO", 970, 172);

  textSize(16);
  text("2                                        2", 802, 185);
  textSize(25);

  onlyOne(innenraumluft, "T", "H", "TVOC", "CO2", "eCO2");
  boolean Innenraum_T = innenraumluft.getState("T");
  boolean Innenraum_H = innenraumluft.getState("H");
  boolean Innenraum_TVOC = innenraumluft.getState("TVOC");
  boolean Innenraum_CO2 = innenraumluft.getState("CO2");
  boolean Innenraum_eCO2 = innenraumluft.getState("eCO2");

  textSize(20);
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

  float max = 0;
  float min = 9999999;
  int wasZeichnen = 5;

  if (Innenraum_T) {
    wasZeichnen = 0;
  } else if (Innenraum_H) {
    wasZeichnen = 1;
  } else if (Innenraum_CO2) {
    wasZeichnen = 2;
  } else if (Innenraum_TVOC) {
    wasZeichnen = 3;
  } else if (Innenraum_eCO2) {
    wasZeichnen = 4;
  }





  if (scale_Innenraum == 0) {
    for (int i = 0; i < indexInnenraumlufta; i++) {
      if (Innenraumluftb[wasZeichnen][i] > max) {
        max = Innenraumluftb[wasZeichnen][i];
      }
      if (Innenraumlufta[wasZeichnen][i] > max) {
        max = Innenraumlufta[wasZeichnen][i];
      }
      if (Innenraumluftb[wasZeichnen][i] < min && Innenraumluftb[wasZeichnen][i]!=0) {
        min = Innenraumluftb[wasZeichnen][i];
      }
      if (Innenraumlufta[wasZeichnen][i] < min && Innenraumlufta[wasZeichnen][i]!=0) {
        min = Innenraumlufta[wasZeichnen][i];
      }
    }
  } else if (scale_Innenraum == 1) {
    min = 0;
    if (wasZeichnen == 0) {
      max = 10;
    } else if (wasZeichnen == 1) {
      max = 20;
    } else if (wasZeichnen == 2 || wasZeichnen == 4) {
      max = 500;
    } else {
      max = 100;
    }
  } else if (scale_Innenraum == 2) {
    min = 0;
    if (wasZeichnen == 0) {
      max = 20;
    } else if (wasZeichnen == 1) {
      max = 40;
    } else if (wasZeichnen == 2 || wasZeichnen == 4) {
      max = 1000;
    } else {
      max = 200;
    }
  } else if (scale_Innenraum == 3) {
    min = 0;
    if (wasZeichnen == 0) {
      max = 30;
    } else if (wasZeichnen == 1) {
      max = 60;
    } else if (wasZeichnen == 2 || wasZeichnen == 4) {
      max = 2000;
    } else {
      max = 500;
    }
  } else if (scale_Innenraum == 3) {
    min = 0;
    if (wasZeichnen == 0) {
      max = 40;
    } else if (wasZeichnen == 1) {
      max = 80;
    } else if (wasZeichnen == 2 || wasZeichnen == 4) {
      max = 5000;
    } else {
      max = 1000;
    }
  } else if (scale_Innenraum == 4) {
    min = 0;
    if (wasZeichnen == 0) {
      max = 50;
    } else if (wasZeichnen == 1) {
      max = 100;
    } else if (wasZeichnen == 2 || wasZeichnen == 4) {
      max = 10000;
    } else {
      max = 5000;
    }
  }

  if (scale_Innenraum != 0) {
    for (int i = 1; i < 5; i++) {
      float y = max/5;
      text(nf(i*y, 0, 0), 120, 650 - 90*i);
    }
  }
  if (min != 9999999 && max != 0) {
    text(nf(max, 0, 0), 120, 200);
    text(nf(min, 0, 0), 120, 650);
  }
  text("0", 160, 680);
  text("Zeit in Sekunden", 580, 700);


  for (int i = 1; i < indexInnenraumluftb; i++) {

    float x1 = 175 + (i)*930/(indexInnenraumlufta-1); 
    float x2 = 175 + (i-1)*930/(indexInnenraumlufta-1);
    float y1 = 650 - (Innenraumluftb[wasZeichnen][i]-min)*450/(max-min);
    float y2 = 650 - (Innenraumluftb[wasZeichnen][i-1]-min)*450/(max-min);   

    if (wasZeichnen == 0) {
      stroke(255, 0, 0);
    } else if (wasZeichnen == 1) {
      stroke(0, 0, 255);
    } else if (wasZeichnen == 2) {
      stroke(255, 0, 255);
    } else if (wasZeichnen == 3) {
      stroke(0, 155, 0);
    } else if (wasZeichnen == 4) {
      stroke(0);
    }
    strokeWeight(4);
    if (Innenraumluftb[wasZeichnen][i]<= max && Innenraumluftb[wasZeichnen][i]>= min && Innenraumluftb[wasZeichnen][i-1]<= max && Innenraumluftb[wasZeichnen][i-1]>= min) {
      line(x1, y1, x2, y2);
    }
  }


  for (int i = 1; i < indexInnenraumlufta; i++) {
    float x1 = 175 + (i)*930/(indexInnenraumlufta-1); 
    float x2 = 175 + (i-1)*930/(indexInnenraumlufta-1);
    float y1 = 650 - (Innenraumlufta[wasZeichnen][i]-min)*450/(max-min);
    float y2 = 650 - (Innenraumlufta[wasZeichnen][i-1]-min)*450/(max-min);   
    strokeWeight(1);
    if (wasZeichnen == 0) {
      stroke(255, 0, 0);
    } else if (wasZeichnen == 1) {
      stroke(0, 0, 255);
    } else if (wasZeichnen == 2) {
      stroke(255, 0, 255);
    } else if (wasZeichnen == 3) {
      stroke(0, 155, 0);
    } else if (wasZeichnen == 4) {
      stroke(0);
    }
    if (Innenraumlufta[wasZeichnen][i] <= max && Innenraumlufta[wasZeichnen][i] >= min && Innenraumlufta[wasZeichnen][i-1] <= max && Innenraumlufta[wasZeichnen][i-1] >= min) {
      line(x1, y1, x2, y2);
    }
  }

  float x1 = 175 + (indexInnenraumluftb-1)*930/(indexInnenraumlufta-1); 
  //indexInnenraumlufta = t Sekunden
  float t1 = float(indexInnenraumluftb)*t/float(indexInnenraumlufta);
  if ((millis() - currentTime4b)/1000 < t && x1 > 175 && x1 < 1105) {
    text(nf(round(t1), 0, 0), x1-20, 675);
  }
  text(t, 1100, 690);

  if ((millis() - currentTime4b)/1000 > t  && currentTime4b > 0) {
    Station4c.show();
  }
  strokeWeight(1);
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
  innenraumluft.show();

  if (up1.isClicked()) {
    scale_Innenraum += 1;
    if (scale_Innenraum > 4) {
      scale_Innenraum = 0;
    }
  }

  if (down1.isClicked()) {
    scale_Innenraum -= 1;
    if (scale_Innenraum < 0) {
      scale_Innenraum = 4;
    }
  }




  fill(255);
  stroke(0);
  rect(175, 200, 930, 450);
  fill(0);
  textSize(25);
  text("T", 190, 172);
  text("H", 380, 172);
  text("TVOC", 560, 172);
  text("CO", 770, 172);
  text("eCO", 970, 172);

  textSize(16);
  text("2                                        2", 802, 185);
  textSize(25);

  onlyOne(innenraumluft, "T", "H", "TVOC", "CO2", "eCO2");
  boolean Innenraum_T = innenraumluft.getState("T");
  boolean Innenraum_H = innenraumluft.getState("H");
  boolean Innenraum_TVOC = innenraumluft.getState("TVOC");
  boolean Innenraum_CO2 = innenraumluft.getState("CO2");
  boolean Innenraum_eCO2 = innenraumluft.getState("eCO2");

  textSize(20);
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

  float max = 0;
  float min = 9999999;
  int wasZeichnen = 5;

  if (Innenraum_T) {
    wasZeichnen = 0;
  } else if (Innenraum_H) {
    wasZeichnen = 1;
  } else if (Innenraum_CO2) {
    wasZeichnen = 2;
  } else if (Innenraum_TVOC) {
    wasZeichnen = 3;
  } else if (Innenraum_eCO2) {
    wasZeichnen = 4;
  }




  if (scale_Innenraum == 0) {
    for (int i = 0; i < indexInnenraumlufta; i++) {
      if (Innenraumluftc[wasZeichnen][i] > max) {
        max = Innenraumluftc[wasZeichnen][i];
      }
      if (Innenraumluftc[wasZeichnen][i] < min && Innenraumluftc[wasZeichnen][i]!=0) {
        min = Innenraumluftc[wasZeichnen][i];
      }
      if (Innenraumluftb[wasZeichnen][i] > max) {
        max = Innenraumluftb[wasZeichnen][i];
      }
      if (Innenraumlufta[wasZeichnen][i] > max) {
        max = Innenraumlufta[wasZeichnen][i];
      }
      if (Innenraumluftb[wasZeichnen][i] < min && Innenraumluftb[wasZeichnen][i]!=0) {
        min = Innenraumluftb[wasZeichnen][i];
      }
      if (Innenraumlufta[wasZeichnen][i] < min && Innenraumlufta[wasZeichnen][i]!=0) {
        min = Innenraumlufta[wasZeichnen][i];
      }
    }
  } else if (scale_Innenraum == 1) {
    min = 0;
    if (wasZeichnen == 0) {
      max = 10;
    } else if (wasZeichnen == 1) {
      max = 20;
    } else if (wasZeichnen == 2 || wasZeichnen == 4) {
      max = 500;
    } else {
      max = 100;
    }
  } else if (scale_Innenraum == 2) {
    min = 0;
    if (wasZeichnen == 0) {
      max = 20;
    } else if (wasZeichnen == 1) {
      max = 40;
    } else if (wasZeichnen == 2 || wasZeichnen == 4) {
      max = 1000;
    } else {
      max = 200;
    }
  } else if (scale_Innenraum == 3) {
    min = 0;
    if (wasZeichnen == 0) {
      max = 30;
    } else if (wasZeichnen == 1) {
      max = 60;
    } else if (wasZeichnen == 2 || wasZeichnen == 4) {
      max = 2000;
    } else {
      max = 500;
    }
  } else if (scale_Innenraum == 3) {
    min = 0;
    if (wasZeichnen == 0) {
      max = 40;
    } else if (wasZeichnen == 1) {
      max = 80;
    } else if (wasZeichnen == 2 || wasZeichnen == 4) {
      max = 5000;
    } else {
      max = 1000;
    }
  } else if (scale_Innenraum == 4) {
    min = 0;
    if (wasZeichnen == 0) {
      max = 50;
    } else if (wasZeichnen == 1) {
      max = 100;
    } else if (wasZeichnen == 2 || wasZeichnen == 4) {
      max = 10000;
    } else {
      max = 5000;
    }
  }

  if (scale_Innenraum != 0) {
    for (int i = 1; i < 5; i++) {
      float y = max/5;
      text(nf(i*y, 0, 0), 120, 650 - 90*i);
    }
  }

  if (min != 9999999 && max != 0) {
    text(nf(max, 0, 0), 120, 200);
    text(nf(min, 0, 0), 120, 650);
  }
  text("0", 160, 680);
  text("Zeit in Sekunden", 580, 700);


  for (int i = 1; i < indexInnenraumluftc; i++) {
    float x1 = 175 + (i)*930/(indexInnenraumlufta-1); 
    float x2 = 175 + (i-1)*930/(indexInnenraumlufta-1);
    float y1 = 650 - (Innenraumluftc[wasZeichnen][i]-min)*450/(max-min);
    float y2 = 650 - (Innenraumluftc[wasZeichnen][i-1]-min)*450/(max-min);   
    if (wasZeichnen == 0) {
      stroke(255, 0, 0);
    } else if (wasZeichnen == 1) {
      stroke(0, 0, 255);
    } else if (wasZeichnen == 2) {
      stroke(255, 0, 255);
    } else if (wasZeichnen == 3) {
      stroke(0, 155, 0);
    } else if (wasZeichnen == 4) {
      stroke(0);
    }
    strokeWeight(4);
    if (Innenraumluftc[wasZeichnen][i]<= max && Innenraumluftc[wasZeichnen][i]>= min && Innenraumluftc[wasZeichnen][i-1]<= max && Innenraumluftc[wasZeichnen][i-1]>= min) {
      line(x1, y1, x2, y2);
    }
  }


  for (int i = 1; i < indexInnenraumlufta; i++) {
    float x1 = 175 + (i)*930/(indexInnenraumlufta-1); 
    float x2 = 175 + (i-1)*930/(indexInnenraumlufta-1);
    float y1 = 650 - (Innenraumluftb[wasZeichnen][i]-min)*450/(max-min);
    float y2 = 650 - (Innenraumluftb[wasZeichnen][i-1]-min)*450/(max-min);   

    if (wasZeichnen == 0) {
      stroke(255, 0, 0);
    } else if (wasZeichnen == 1) {
      stroke(0, 0, 255);
    } else if (wasZeichnen == 2) {
      stroke(255, 0, 255);
    } else if (wasZeichnen == 3) {
      stroke(0, 155, 0);
    } else if (wasZeichnen == 4) {
      stroke(0);
    }
    strokeWeight(1);
    if (Innenraumluftb[wasZeichnen][i]<= max && Innenraumluftb[wasZeichnen][i] >= min && Innenraumluftb[wasZeichnen][i-1] <= max && Innenraumluftb[wasZeichnen][i-1] >= min) {
      line(x1, y1, x2, y2);
    }


    x1 = 175 + (i)*930/(indexInnenraumlufta-1); 
    x2 = 175 + (i-1)*930/(indexInnenraumlufta-1);
    y1 = 650 - (Innenraumlufta[wasZeichnen][i]-min)*450/(max-min);
    y2 = 650 - (Innenraumlufta[wasZeichnen][i-1]-min)*450/(max-min);   
    strokeWeight(1);
    if (wasZeichnen == 0) {
      stroke(255, 0, 0);
    } else if (wasZeichnen == 1) {
      stroke(0, 0, 255);
    } else if (wasZeichnen == 2) {
      stroke(255, 0, 255);
    } else if (wasZeichnen == 3) {
      stroke(0, 155, 0);
    } else if (wasZeichnen == 4) {
      stroke(0);
    }
    if (Innenraumlufta[wasZeichnen][i] <= max && Innenraumlufta[wasZeichnen][i] >= min && Innenraumlufta[wasZeichnen][i-1] <= max && Innenraumlufta[wasZeichnen][i-1] >= min) {
      line(x1, y1, x2, y2);
    }
  }

  float x1 = 175 + (indexInnenraumluftc-1)*930/(indexInnenraumlufta-1); 

  float t1 = float(indexInnenraumluftc)*t/float(indexInnenraumlufta);
  if ((millis() - currentTime4c)/1000 < t && x1 > 175 && x1 < 1105) {
    text(nf(round(t1), 0, 0), x1-20, 675);
  }

  text(t, 1100, 690);
  if ((millis() - currentTime4c)/1000 > t  && currentTime4c > 0) {
    Station4Auswertung.show();
  }
  strokeWeight(1);
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
