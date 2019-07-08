void graph(float[] array, int zeitskala1, String name, int x_scale, int[] y_scale, boolean left) {
  // 2. Wenn y-scale == 0 --> Bereich zwischen minimum und Maximum
  // 1: 0 und 20
  // 2: 0 und 30
  // 3: 0 und 40
  float[] zeitskala = new float[999999];
  if (zeitskala1 == 0) {
    for (int i = 0; i < 999999; i++) {
      zeitskala[i] = zeit[i];
    }
  } else if (zeitskala1 == 1) {
    for (int i = 0; i < 999999; i++) {
      zeitskala[i] = Station1_zeit[i];
    }
  } else if (zeitskala1 == 2) {
    for (int i = 0; i < 999999; i++) {
      zeitskala[i] = Station1_zeit_trocken[i];
    }
  } else if (zeitskala1 == 3) {
    for (int i = 0; i < 999999; i++) {
      zeitskala[i] = Station1_zeit_nass[i];
    }
  }

  // --> Minimum und Maximum des Arrays bestimmen
  float min = 0;
  float max = 0;
  int y = 0;
  if (left) {
    y = y_scale[0];
  } else {
    y = y_scale[1];
  }


  //////////////////ANFANG Zeitskala Beschriftung und Hilfslinien //////////////////////////

  int xValues = 0;
  textAlign(CENTER);
  if (x_scale == 0) {
    if (index > 0) {
      if (zeitskala1 == 0) {
        xValues = index;
      } else if (zeitskala1 == 1) {
        if (indexStation1 > 0) {
          xValues =  indexStation1;
        }
      } else if (zeitskala1 == 2) {
        if (indexStation1_trocken > 0) {
          xValues =  indexStation1_trocken;
        }
      } else if (zeitskala1 == 3) {
        if (indexStation1_nass > 0) {
          xValues =  indexStation1_nass;
        }
      }
    }
  } else if (x_scale == 1) {
    xValues = time(60, zeitskala, zeitskala1);
  } else if (x_scale == 2) {
    xValues = time(180, zeitskala, zeitskala1);
  } else if (x_scale == 3) {
    xValues = time(360, zeitskala, zeitskala1);
  } else if (x_scale == 4) {
    xValues = time(720, zeitskala, zeitskala1);
  } else if (x_scale == 5) {
    xValues = time(3600, zeitskala, zeitskala1);
  } else if (x_scale == 6) {
    xValues = time(10800, zeitskala, zeitskala1);
  } else if (x_scale == 7) {
    xValues = time(21600, zeitskala, zeitskala1);
  } else if (x_scale == 8) {
    xValues = time(43200, zeitskala, zeitskala1);
  } else if (x_scale == 9) {
    xValues = time(86400, zeitskala, zeitskala1);
  } else if (x_scale == 10) {
    xValues = time(259200, zeitskala, zeitskala1);
  } else {
    xValues = index;
  }

  if (xValues == 0) {
    xValues = 1;
  }

  textSize(20);
  fill(0);
  text("0", 150, 640);
  if (zeitskala[xValues-1] < 60) {
    for (int i = 0; i < 12; i++) {
      if (zeitskala[xValues - 1] > (5*i + 5)) {
        float x = 175 + (5*i + 5)*930/zeitskala[xValues-1]; 
        if (i%2 == 1) {
          strokeWeight(2);
          stroke(0, 100);
        } else {
          strokeWeight(1);
          stroke(200, 100);
        }
        line(x, 100, x, 600);
        if (i%2 == 1) {
          noStroke();
          fill(0);
          textSize(20);
          text(nf((5*i + 5), 0, 0), x, 620);
        }
      }
    }
  } else if (zeitskala[xValues- 1] < 180) { //3 Minuten
    for (int i = 0; i < 12; i++) {
      float temp = 15*i + 15;
      if (zeitskala[xValues - 1] > temp) {
        float x = 175 + temp*930/zeitskala[xValues-1]; 
        if (i%2 == 1) {
          strokeWeight(2);
          stroke(0, 100);
        } else {
          strokeWeight(1);
          stroke(200, 100);
        }
        line(x, 100, x, 600);
        if (i%2 == 1) {
          noStroke();
          fill(0);
          textSize(20);
          text(nf(temp, 0, 0), x, 620);
        }
      }
    }
  } else if (zeitskala[xValues- 1] < 360) {//6 Minuten
    for (int i = 0; i < 12; i++) {
      float temp = 30*i + 30;
      if (zeitskala[xValues - 1] > temp) {
        float x = 175 + temp*930/zeitskala[xValues-1]; 
        if (i%2 == 1) {
          strokeWeight(2);
          stroke(0, 100);
        } else {
          strokeWeight(1);
          stroke(200, 100);
        }
        line(x, 100, x, 600);
        if (i%2 == 1) {
          noStroke();
          fill(0);
          textSize(20);
          text(nf(temp, 0, 0), x, 620);
        }
      }
    }
  } else if (zeitskala[xValues- 1] < 720) {//12 Minuten
    for (int i = 0; i < 12; i++) {
      float temp = 60*i + 60;
      if (zeitskala[xValues - 1] > temp) {
        float x = 175 + temp*930/zeitskala[xValues-1]; 
        if (i%2 == 1) {
          strokeWeight(2);
          stroke(0, 100);
        } else {
          strokeWeight(1);
          stroke(200, 100);
        }
        line(x, 100, x, 600);
        if (i%2 == 1) {
          noStroke();
          fill(0);
          textSize(20);
          text(nf(temp/60, 0, 0), x, 620);
        }
      }
    }
  } else if (zeitskala[xValues- 1] < 3600) {//60 Minuten
    for (int i = 0; i < 12; i++) {
      float temp = 300* i + 300;
      if (zeitskala[xValues - 1] > temp) {
        float x = 175 + temp*930/zeitskala[xValues-1]; 
        if (i%2 == 1) {
          strokeWeight(2);
          stroke(0, 100);
        } else {
          strokeWeight(1);
          stroke(200, 100);
        }
        line(x, 100, x, 600);
        if (i%2 == 1) {
          noStroke();
          fill(0);
          textSize(20);
          text(nf(temp/60, 0, 0), x, 620);
        }
      }
    }
  } else if (zeitskala[xValues- 1] < 10800) {//3 Stunden
    for (int i = 0; i < 12; i++) {
      float temp = 900*i + 900;
      if (zeitskala[xValues - 1] > temp) {
        float x = 175 + temp*930/zeitskala[xValues-1]; 
        if (i%2 == 1) {
          strokeWeight(2);
          stroke(0, 100);
        } else {
          strokeWeight(1);
          stroke(200, 100);
        }
        line(x, 100, x, 600);
        if (i%2 == 1) {
          noStroke();
          fill(0);
          textSize(20);
          text(nf(temp/3600, 0, 0), x, 620);
        }
      }
    }
  } else if (zeitskala[xValues- 1] < 21600) {//6 Stunden
    for (int i = 0; i < 12; i++) {
      float temp = 1800*i + 1800;
      if (zeitskala[xValues - 1] > temp) {
        float x = 175 + temp*930/zeitskala[xValues-1]; 
        if (i%2 == 1) {
          strokeWeight(2);
          stroke(0, 100);
        } else {
          strokeWeight(1);
          stroke(200, 100);
        }
        line(x, 100, x, 600);
        if (i%2 == 1) {
          noStroke();
          fill(0);
          textSize(20);
          text(nf(temp/3600, 0, 0), x, 620);
        }
      }
    }
  } else if (zeitskala[xValues- 1] < 43200) {//12 Stunden
    for (int i = 0; i < 12; i++) {
      float temp = 3600*i + 3600;
      if (zeitskala[xValues - 1] > temp) {
        float x = 175 + temp*930/zeitskala[xValues-1]; 
        if (i%2 == 1) {
          strokeWeight(2);
          stroke(0, 100);
        } else {
          strokeWeight(1);
          stroke(200, 100);
        }
        line(x, 100, x, 600);
        if (i%2 == 1) {
          noStroke();
          fill(0);
          textSize(20);
          text(nf(temp/3600, 0, 0), x, 620);
        }
      }
    }
  } else if (zeitskala[xValues- 1] < 86400) {// 24 Stunden
    for (int i = 0; i < 12; i++) {
      float temp = 7200*i + 7200;
      if (zeitskala[xValues - 1] > temp) {
        float x = 175 + temp*930/zeitskala[xValues-1]; 
        if (i%2 == 1) {
          strokeWeight(2);
          stroke(0, 100);
        } else {
          strokeWeight(1);
          stroke(200, 100);
        }
        line(x, 100, x, 600);
        if (i%2 == 1) {
          noStroke();
          fill(0);
          textSize(20);
          text(nf(temp/3600, 0, 0), x, 620);
        }
      }
    }
  } else { // 72 Stunden und mehr
    for (int i = 0; i < 12; i++) {
      float temp = 21600*i + 21600;
      if (zeitskala[xValues - 1] > temp) {
        float x = 175 + temp*930/zeitskala[xValues-1]; 
        if (i%2 == 1) {
          strokeWeight(2);
          stroke(0, 100);
        } else {
          strokeWeight(1);
          stroke(200, 100);
        }
        line(x, 100, x, 600);
        if (i%2 == 1) {
          noStroke();
          fill(0);
          textSize(20);
          text(nf(temp/3600, 0, 0), x, 620);
        }
      }
    }
  }



  //////////////////ENDE Zeitskala Beschriftung und Hilfslinien //////////////////////////

  strokeWeight(1);

  //////////////////// Minimum und Maximum definieren ////////////////////////////
  if (y == 0) {
    min = minValue(array, xValues, zeitskala1);
    max = maxValue(array, xValues, zeitskala1);
  } else if (y == 1) {
    if (name == "Temperatur in °C") {
      max = 20;
    } else if (name == "CO2 in ppm" || name == "eCO2 in ppm") {
      max = 500;
    } else if (name == "relative Luftfeuchte in %") {
      max = 25;
    } else if (name == "Feinstaub PM1 in μg/m³" || name == "Feinstaub PM2.5 in μg/m³" || name == "Feinstaub PM4 in μg/m³" || name == "Feinstaub PM10 in μg/m³") {
      max = 10;
    } else if (name == "TVOC in ppb") {
      max = 100;
    }
  } else if (y == 2) {
    if (name == "Temperatur in °C") {
      max = 30;
    } else if (name == "CO2 in ppm" || name == "eCO2 in ppm") {
      max = 1000;
    } else if (name == "relative Luftfeuchte in %") {
      max = 50;
    } else if (name == "Feinstaub PM1 in μg/m³" || name == "Feinstaub PM2.5 in μg/m³" || name == "Feinstaub PM4 in μg/m³" || name == "Feinstaub PM10 in μg/m³") {
      max = 20;
    } else if (name == "TVOC in ppb") {
      max = 500;
    }
  } else if (y == 3) {
    if (name == "Temperatur in °C") {
      max = 40;
    } else if (name == "CO2 in ppm" || name == "eCO2 in ppm") {
      max = 2000;
    } else if (name == "relative Luftfeuchte in %") {
      max = 75;
    } else if (name == "Feinstaub PM1 in μg/m³" || name == "Feinstaub PM2.5 in μg/m³" || name == "Feinstaub PM4 in μg/m³" || name == "Feinstaub PM10 in μg/m³") {
      max = 50;
    } else if (name == "TVOC in ppb") {
      max = 1000;
    }
  } else if (y == 4) {
    if (name == "Temperatur in °C") {
      max = 50;
    } else if (name == "CO2 in ppm" || name == "eCO2 in ppm") {
      max = 5000;
    } else if (name == "relative Luftfeuchte in %") {
      max = 100;
    } else if (name == "Feinstaub PM1 in μg/m³" || name == "Feinstaub PM2.5 in μg/m³" || name == "Feinstaub PM4 in μg/m³" || name == "Feinstaub PM10 in μg/m³") {
      max = 200;
    } else if (name == "TVOC in ppb") {
      max = 10000;
    }
  }
  //////////////////// Minimum und Maximum definieren ENDE ////////////////////////////



  ////////////////// Zwischenlinien definieren ////////////////////////////
  textSize(20);
  textAlign(CENTER);
  if (left) {
    fill(255, 0, 0);
  } else {
    fill(0, 0, 255);
  }

  float pos_x = 0;

  if (left) {
    pos_x = 135;
  } else {
    pos_x = 1135;
  }

  if (y == 1) {
    if (name == "Temperatur in °C") {
      text("4", pos_x, 507);
      text("8", pos_x, 407);
      text("12", pos_x, 307);
      text("16", pos_x, 207);
    } else if (name == "CO2 in ppm" || name == "eCO2 in ppm") {
      text("100", pos_x, 507);
      text("200", pos_x, 407);
      text("300", pos_x, 307);
      text("400", pos_x, 207);
    } else if (name == "Feinstaub PM1 in μg/m³" || name == "Feinstaub PM2.5 in μg/m³" || name == "Feinstaub PM4 in μg/m³" || name == "Feinstaub PM10 in μg/m³") {
      text("2", pos_x, 507);
      text("4", pos_x, 407);
      text("6", pos_x, 307);
      text("8", pos_x, 207);
    } else if (name == "relative Luftfeuchte in %") {
      text("5", pos_x, 507);
      text("10", pos_x, 407);
      text("15", pos_x, 307);
      text("20", pos_x, 207);
    } else if (name == "TVOC in ppb") {
      text("20", pos_x, 507);
      text("40", pos_x, 407);
      text("60", pos_x, 307);
      text("80", pos_x, 207);
    }
  } else if (y == 2) {
    if (name == "Temperatur in °C") {
      text("6", pos_x, 507);
      text("12", pos_x, 407);
      text("18", pos_x, 307);
      text("24", pos_x, 207);
    } else if (name == "CO2 in ppm"|| name == "eCO2 in ppm") {
      text("200", pos_x, 507);
      text("400", pos_x, 407);
      text("600", pos_x, 307);
      text("800", pos_x, 207);
    } else if (name == "Feinstaub PM1 in μg/m³" || name == "Feinstaub PM2.5 in μg/m³" || name == "Feinstaub PM4 in μg/m³" || name == "Feinstaub PM10 in μg/m³") {
      text("4", pos_x, 507);
      text("8", pos_x, 407);
      text("12", pos_x, 307);
      text("16", pos_x, 207);
    } else if (name == "relative Luftfeuchte in %") {
      text("10", pos_x, 507);
      text("20", pos_x, 407);
      text("30", pos_x, 307);
      text("40", pos_x, 207);
    } else if (name == "TVOC in ppb") {
      text("100", pos_x, 507);
      text("200", pos_x, 407);
      text("300", pos_x, 307);
      text("400", pos_x, 207);
    }
  } else if (y == 3) {
    if (name == "Temperatur in °C") {
      text("8", pos_x, 507);
      text("16", pos_x, 407);
      text("24", pos_x, 307);
      text("32", pos_x, 207);
    } else if (name == "CO2 in ppm"|| name == "eCO2 in ppm") {
      text("300", pos_x, 507);
      text("600", pos_x, 407);
      text("900", pos_x, 307);
      text("1200", pos_x, 207);
    } else if (name == "Feinstaub PM1 in μg/m³" || name == "Feinstaub PM2.5 in μg/m³" || name == "Feinstaub PM4 in μg/m³" || name == "Feinstaub PM10 in μg/m³") {
      text("10", pos_x, 507);
      text("20", pos_x, 407);
      text("30", pos_x, 307);
      text("40", pos_x, 207);
    } else if (name == "relative Luftfeuchte in %") {
      text("15", pos_x, 507);
      text("30", pos_x, 407);
      text("45", pos_x, 307);
      text("60", pos_x, 207);
    } else if (name == "TVOC in ppb") {
      text("200", pos_x, 507);
      text("400", pos_x, 407);
      text("600", pos_x, 307);
      text("800", pos_x, 207);
    }
  } else if (y == 4) {
    if (name == "Temperatur in °C") {
      text("10", pos_x, 507);
      text("20", pos_x, 407);
      text("30", pos_x, 307);
      text("40", pos_x, 207);
    } else if (name == "CO2 in ppm"|| name == "eCO2 in ppm") {
      text("1000", pos_x, 507);
      text("2000", pos_x, 407);
      text("3000", pos_x, 307);
      text("4000", pos_x, 207);
    } else if (name == "Feinstaub PM1 in μg/m³" || name == "Feinstaub PM2.5 in μg/m³" || name == "Feinstaub PM4 in μg/m³" || name == "Feinstaub PM10 in μg/m³") {
      text("40", pos_x, 507);
      text("80", pos_x, 407);
      text("120", pos_x, 307);
      text("160", pos_x, 207);
    } else if (name == "relative Luftfeuchte in %") {
      text("20", pos_x, 507);
      text("40", pos_x, 407);
      text("60", pos_x, 307);
      text("80", pos_x, 207);
    } else if (name == "TVOC in ppb") {
      text("2000", pos_x, 507);
      text("4000", pos_x, 407);
      text("6000", pos_x, 307);
      text("8000", pos_x, 207);
    }
  }
  ////////////////// Zwischenlinien definieren ENDE ////////////////////////////




  textAlign(CENTER);
  textSize(20);
  if (left) {
    stroke(255, 0, 0);
    fill(255, 0, 0);
    if (min != 99999999) {
      if (y == 0) {
        text(nf(min, 0, 1), 135, 600);
        text(nf(max, 0, 1), 135, 100);
      } else {
        text(nf(min, 0, 0), 135, 600);
        text(nf(max, 0, 0), 135, 100);
      }
    }
    pushMatrix();
    translate(width/2, height/2);
    rotate(3*PI/2);
    if (name == "CO2 in ppm") {
      text("CO   in ppm", 0, -575);
      textSize(16);
      text("2", -17, -570);
    } else {
      text(name, 0, -575);
    }
    popMatrix();
  } else {
    textSize(20);
    fill(0, 0, 255);
    stroke(0, 0, 255);
    if (min != 99999999) {
      if (y == 0) {
        text(nf(min, 0, 1), 1135, 600);
        text(nf(max, 0, 1), 1135, 100);
      } else {
        text(nf(min, 0, 0), 1135, 600);
        text(nf(max, 0, 0), 1135, 100);
      }
    }
    pushMatrix();
    translate(width/2, height/2);
    rotate(PI/2);
    if (name == "CO2 in ppm") {
      text("CO   in ppm", 0, -575);
      textSize(16);
      text("2", -17, -570);
      textSize(20);
    } else {
      text(name, 0, -575);
    }
    popMatrix();
  }

  fill(0);
  if (zeitskala[xValues-1] < 360) {
    text("Zeit in Sekunden", 640, 645);
    text(nf(ceil(zeitskala[xValues-1]), 0, 0), 1120, 640);
  } else if (zeitskala[xValues - 1] < 21600) {
    text("Zeit in Minuten", 640, 645);
    text(nf(ceil(zeitskala[xValues-1]/60), 0, 0), 1120, 640);
  } else {
    text("Zeit in Stunden", 640, 645);
    text(nf(ceil(zeitskala[xValues-1]/3600), 0, 0), 1120, 640);
  }


  ///////////////// MESSWERTE ZEICHNEN //////////////////////////////////////////
  textAlign(CORNER);

  if (zeitskala1 == 0) {
    if (xValues > 0 && xValues < 930) {
      for (int i = (index - xValues); i < index - 1; i++) {
        float x_anfang = zeitskala[index - xValues];
        float  x_ende = zeitskala[index - 1];
        float x_intervall = x_ende - x_anfang;
        float x1 = 175 + (zeitskala[i] - x_anfang)*930/x_intervall;
        float x2 = 175 + (zeitskala[i+1] - x_anfang)*930/x_intervall;
        float y1 = 600 - 500*(array[i]-min)/(max - min);
        float y2 = 600 - 500*(array[i+1] - min)/(max - min);
        if (array[i] <= max && array[i+1] <= max) {
          line(x1, y1, x2, y2);
        }
      }
    } else if (xValues >= 930) {
      float[] newArray = kuerzen(array, xValues, 930);
      float[] newArray_time = kuerzen(zeitskala, xValues, 930);
      if (y == 0) {
        min = 99999999;
        max = 0;
        for (int i = 0; i < 930; i++) {
          if (newArray[i] < min) {
            min = newArray[i];
          }
          if (newArray[i] > max) {
            max = newArray[i];
          }
        }
      }
      for (int i = 0; i < 929; i++) {
        float x_anfang = newArray_time[0];
        float x_ende = newArray_time[929];
        float x_intervall = x_ende - x_anfang;
        float x1 = 175 + (newArray_time[i] - x_anfang)*930/x_intervall;
        float x2 = 175 + (newArray_time[i+1] - x_anfang)*930/x_intervall;
        float y1 = 600 - 500*(newArray[i]-min)/(max - min);
        float y2 = 600 - 500*(newArray[i+1] - min)/(max - min);
        if (newArray[i] <= max && newArray[i+1] <= max) {
          line(x1, y1, x2, y2);
        }
      }
    }
  } else if (zeitskala1 == 1) {
    for (int i = (indexStation1 - xValues); i < indexStation1 - 1; i++) {
      float x_anfang = zeitskala[indexStation1 - xValues];
      float x_ende = zeitskala[indexStation1 - 1];
      float x_intervall = x_ende - x_anfang;
      float x1 = 175 + (zeitskala[i] - x_anfang)*930/x_intervall;
      float x2 = 175 + (zeitskala[i+1] - x_anfang)*930/x_intervall;
      float y1 = 600 - 500*(array[i]-min)/(max - min);
      float y2 = 600 - 500*(array[i+1] - min)/(max - min);
      if (array[i] <= max && array[i+1] <= max) {
        line(x1, y1, x2, y2);
      }
    }
  }else if (zeitskala1 == 2) {
    for (int i = (indexStation1_trocken - xValues); i < indexStation1_trocken - 1; i++) {
      float x_anfang = zeitskala[indexStation1_trocken - xValues];
      float x_ende = zeitskala[indexStation1_trocken - 1];
      float x_intervall = x_ende - x_anfang;
      float x1 = 175 + (zeitskala[i] - x_anfang)*930/x_intervall;
      float x2 = 175 + (zeitskala[i+1] - x_anfang)*930/x_intervall;
      float y1 = 600 - 500*(array[i]-min)/(max - min);
      float y2 = 600 - 500*(array[i+1] - min)/(max - min);
      if (array[i] <= max && array[i+1] <= max) {
        line(x1, y1, x2, y2);
      }
      ;
    }
  }else if (zeitskala1 == 3) {
    for (int i = (indexStation1_nass - xValues); i < indexStation1_nass - 1; i++) {
      float x_anfang = zeitskala[indexStation1_nass - xValues];
      float x_ende = zeitskala[indexStation1_nass - 1];
      float x_intervall = x_ende - x_anfang;
      float x1 = 175 + (zeitskala[i] - x_anfang)*930/x_intervall;
      float x2 = 175 + (zeitskala[i+1] - x_anfang)*930/x_intervall;
      float y1 = 600 - 500*(array[i]-min)/(max - min);
      float y2 = 600 - 500*(array[i+1] - min)/(max - min);
      if (array[i] <= max && array[i+1] <= max) {
        line(x1, y1, x2, y2);
      }
    }
  }
  ///////////////////////////////////////////////////////////////////////////////////

  // Aktueller Messwert
  String Einheit = "";

  if (name == "Temperatur in °C") {
    Einheit = "°C";
  } else if (name == "CO2 in ppm") {
    Einheit = "ppm";
  } else if (name == "Feinstaub PM1 in μg/m³" || name == "Feinstaub PM2.5 in μg/m³" || name == "Feinstaub PM4 in μg/m³" || name == "Feinstaub PM10 in μg/m³") {
    Einheit = "μg/m³";
  } else if (name == "relative Luftfeuchte in %") {
    Einheit = "%";
  } else if (name == "TVOC in ppb") {
    Einheit = "ppb";
  } else if (name == "eCO2 in ppm") {
    Einheit = "ppm";
  }


  textSize(16);
  if (left) {
    fill(255, 0, 0);
    text("Aktueller Wert: " + nf(array[xValues-1], 0, 1).replace(".", ",") + " " + Einheit, 50, 50);
  } else {
    fill(0, 0, 255);
    text("Aktueller Wert:" + nf(array[xValues-1], 0, 1).replace(".", ",") + " " + Einheit, 1050, 50);
  }
}




float[] kuerzen(float[] arr1, int sizeArr1, int sizeArr2) {
  //1. neues Array initialisieren
  float[] newArray = new float[sizeArr2];
  //2. wie oft passt array 2 in array 1?
  float temp = sizeArr1/float(sizeArr2);
  //3. Mittelwert der einzelnen Sektoren bilden
  for (int j = 0; j < sizeArr2; j++) {
    float mittelwert = 0;
    for (int i = 0; i < temp; i++) {
      mittelwert += arr1[index - sizeArr1 + floor(j*temp) + i];
    }
    newArray[j] = mittelwert/ceil(temp);
  }
  return newArray;
}


void arrLog(float[] m) {
  int reihen = m.length;
  println();
  for (int i = 0; i < reihen; i++) {
    println(m[i] + " ");
  }
}






float minValue(float[] array, int xVals, int zeitskala) {
  float min = 99999999;
  int temp = 1;
  if (index > 0) {
    if (zeitskala == 0) {
      temp = index;
    } else if (zeitskala == 1) {
      temp = indexStation1;
    } else if (zeitskala == 2) {
      temp = indexStation1_trocken;
    } else if (zeitskala == 3) {
      temp = indexStation1_nass;
    }
  }
  for (int i = (temp - xVals); i < temp; i++) {
    if (i > 0) {
      if (array[i] < min) {
        min = array[i];
      }
    }
  }
  return min;
}

float maxValue(float[] array, int xVals, int zeitskala) {
  float max = -99999999;
  int temp = 1;
  if (index > 0) {
    if (zeitskala == 0) {
      temp = index;
    } else if (zeitskala == 1) {
      temp = indexStation1;
    }else if (zeitskala == 2) {
      temp = indexStation1_trocken;
    }else if (zeitskala == 3) {
      temp = indexStation1_nass;
    }
  }
  for (int i = (temp - xVals); i< temp; i++) {
    if (i > 0) {
      if (array[i] > max) {
        max = array[i];
      }
    }
  }
  return max;
}



int time(int sekunden, float[] time2, int zeitskala) {
  int t = 0;
  int temp = 1;
  if (index > 0) {
    if (zeitskala == 0) {
      temp = index;
    } else if (zeitskala == 1) {
      temp = indexStation1;
    } else if (zeitskala == 2) {
      temp = indexStation1_trocken;
    } else if (zeitskala == 3) {
      temp = indexStation1_nass;
    }
  }
  for (int i = 0; i < temp; i++) {
    if (time2[i] > (sekunden)) {
      t = i;
      break;
    } else {
      t = index;
    }
  }
  return t;
}
