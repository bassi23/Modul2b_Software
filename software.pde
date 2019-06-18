PImage sps, sgp, scd, nodemcu;
import processing.serial.*;
import controlP5.*;
Serial myPort;


ControlP5 SPS_control, SGP_control, SCD_control;
CheckBox SPS_check, SGP_check, SCD_check;

station one, two_three, two, three, four, settings;
button back, up1, down1, up2, down2, left1, right1;

button reset, sicher_ja, sicher_nein;


float del = 1;
float page = 0;
boolean gotSerial = false;
float zeroTime2 = 0;
void setup() {
  size(1280, 720);
  try {
    myPort = new Serial(this, Serial.list()[0], 57600);
    gotSerial = true;
  }
  catch(Exception e) {
    gotSerial = false;
  }

  back = new button(1175, 665, 100, 50, "zurück", 5, true);
  up1 = new button(70, 100, 30, 50, "up_arrow", 5, true);
  down1 = new button(70, 155, 30, 50, "down_arrow", 5, true);
  up2 = new button(1210, 100, 30, 50, "up_arrow", 5, true);
  down2 = new button(1210, 155, 30, 50, "down_arrow", 5, true);
  left1 = new button(570, 670, 50, 30, "left_arrow", 5, true);
  right1 = new button(630, 670, 50, 30, "right_arrow", 5, true);


  //
  reset = new button(1070, 665, 100, 50, "Reset", 5, true);
  sicher_ja = new button(450, 340, 150, 75, "Ja", 5, true);
  sicher_nein = new button(700, 340, 150, 75, "Nein", 5, true);



  sps = loadImage("img/sps30.jpg");
  sgp = loadImage("img/sgp30.jpg");
  scd = loadImage("img/scd30.jpg");
  nodemcu = loadImage("img/nodemcu.png");


  one = new station(50, 50, false);
  two_three = new station(450, 50, false);
  two = new station(200, 200, false);
  three = new station(650, 200, false);
  four = new station(50, 350, false);
  settings = new station(450, 350, false);



  SPS_control = new ControlP5(this);
  SPS_check = SPS_control.addCheckBox("SPS")
    .setPosition(400, 20)
    .setColorForeground(color(120))
    .setColorActive(color(0, 255, 0))
    .setColorLabel(color(255))
    .setSize(30, 30)
    .setItemsPerRow(4)
    .setSpacingColumn(100)
    .setSpacingRow(100)
    .addItem("PM1", 0)
    .addItem("PM2.5", 50)
    .addItem("PM4", 100)
    .addItem("PM10", 150)
    .hide();

  SCD_control = new ControlP5(this);
  SCD_check = SCD_control.addCheckBox("SCD")
    .setPosition(500, 20)
    .setColorForeground(color(120))
    .setColorActive(color(0, 255, 0))
    .setColorLabel(color(255))
    .setSize(30, 30)
    .setItemsPerRow(4)
    .setSpacingColumn(100)
    .setSpacingRow(100)
    .addItem("T", 0)
    .addItem("H", 50)
    .addItem("CO2", 100)
    .hide();

  SGP_control = new ControlP5(this);
  SGP_check = SGP_control.addCheckBox("SCD")
    .setPosition(600, 20)
    .setColorForeground(color(120))
    .setColorActive(color(0, 255, 0))
    .setColorLabel(color(255))
    .setSize(30, 30)
    .setItemsPerRow(4)
    .setSpacingColumn(100)
    .setSpacingRow(100)
    .addItem("TVOC", 0)
    .addItem("eCO2", 50)
    .hide();
}

void draw() {
  background(240);
  SCD_check.hide();
  SPS_check.hide();
  SGP_check.hide();

  sicher_ja.hide();
  sicher_nein.hide();

  if (page != 0) {
    back.show();
  }
  Datenaufnahme();
  if (index > 0) {
    if (one.isClicked()) {
      page = 1;
    }
    if (two_three.isClicked()) {
      page = 2.5;
    }
    if (four.isClicked()) {
      page = 4;
    }
  }


  if (page == 0) {
    hauptmenu();
    two_three.active = true;
    four.active = true;
    one.active = true;
    settings.active = true;
    two.active = false;
    three.active = false;
  } else if (page == 1) {
    Feinstaub();
  } else if (page == 2) {
    MenschSensor();
  } else if (page == 2.5) {
    Station2Oder3();
    two.active = true;
    three.active = true;
  } else if (page == 3) {
    TVOC_Duelle();
  } else if (page == 4) {
    Innenraumluft();
  } else if (page == 10) {
    Einstellungen();
  }


  if (back.isClicked()) {
    page = 0;
  }
  if (reset.isClicked()) {
    reset_bool = true;
  }
  if (reset_bool) {
    sicher();
  }
  if (sicher_ja.isClicked()) {
    reset_bool = false; 
    index = 0;
    zeroTime2 = millis();
  }
  if (sicher_nein.isClicked()) {
    reset_bool = false;
  }
}

boolean reset_bool = false;


void sicher() {
  fill(255, 100, 100);
  rect(225, 250, 830, 200);
  fill(0);
  textSize(30);
  text("Bist du sicher, dass du die Daten löschen möchtest?", 250, 300);
  sicher_ja.show();
  sicher_nein.show();
}


class button {
  float x, y, dx, dy, textOffset;
  String text;
  boolean visible;
  button(float x_, float y_, float dx_, float dy_, String text_, float textOffset_, boolean visible_) {
    x = x_;
    y = y_;
    dx = dx_;
    dy = dy_;
    text = text_;
    textOffset = textOffset_;
    visible = visible_;
  }
  void show() {
    visible = true;
    pushMatrix();
    if (mouseX > x && mouseX < (x+dx) && mouseY > y && mouseY < (y + dy)) {
      for (int i = 0; i<dy; i++) {
        stroke(210 + i*50/dy);
        line(x, y+i, x + dx, y+i);
      }
      fill(255);
    } else {
      fill(200);
      for (int i = 0; i<dy; i++) {
        stroke(190 + i*50/dy);
        line(x, y+i, x + dx, y+i);
      }
    }
    rectMode(CORNER);
    stroke(0);
    noFill();
    rect(x, y, dx, dy); 
    fill(0);
    textSize(20);
    textAlign(CENTER);
    noStroke();
    if (text == "up_arrow") {
      stroke(0);
      strokeWeight(2);
      line(x + dx/2, y + dy/4, x + dx/2, y + 3*dy/4);
      line(x + dx/2, y + dy/4, x + dx/4, y + 0.5*dy);
      line(x + dx/2, y + dy/4, x + 3*dx/4, y + 0.5*dy);
    } else if (text == "down_arrow") {
      stroke(0);
      strokeWeight(2);
      line(x + dx/2, y + dy/4, x + dx/2, y + 3*dy/4);
      line(x + dx/2, y + 3*dy/4, x + dx/4, y + 0.5*dy);
      line(x + dx/2, y + 3*dy/4, x + 3*dx/4, y + 0.5*dy);
    } else if (text == "left_arrow") {
      stroke(0);
      strokeWeight(2);
      line(x + dx/4, y + dy/2, x + 3*dx/4, y + dy/2);
      line(x + dx/4, y + dy/2, x + dx/2, y + dy/4);
      line(x + dx/4, y + dy/2, x + dx/2, y + 3*dy/4);
    } else if (text == "right_arrow") {
      stroke(0);
      strokeWeight(2);
      line(x + dx/4, y + dy/2, x + 3*dx/4, y + dy/2);
      line(x + 3*dx/4, y + dy/2, x + dx/2, y + dy/4);
      line(x + 3*dx/4, y + dy/2, x + dx/2, y + 3*dy/4);
    } else {
      text(text, x + dx/2, y + dy/2 + textOffset);
    }
    strokeWeight(1);
    popMatrix();
    textAlign(CORNER);
  }

  void hide() {
    visible = false;
  }
  boolean isClicked() {
    if (mousePressed && mouseX > x && mouseX < (x+dx) && mouseY > y && mouseY < (y + dy) && visible) {
      delay(100);
      visible = false;
      return true;
    } else {
      return false;
    }
  }
}


float[] scd_temperature_data = new float[9999999];
float[] scd_humidity_data =new float[9999999];
float[] scd_co2_data = new float[9999999];
float[] sgp_tvoc_data = new float[9999999];
float[] sgp_eco2_data =new float[9999999];
float[] sps_pm25_data = new float[9999999];
float[] sps_pm4_data = new float[9999999];
float[] sps_pm10_data = new float[9999999];
float[] sps_pm1_data = new float[9999999];
float[] zeit = new float[9999999];
String Daten = null;
int index = 0;
float time = 0;
float zeroTime = 0;

void Datenaufnahme() {
  boolean received = false;
  
  if (myPort.available() > 0) {
    Daten = myPort.readStringUntil('\n');
    received = true;
  }
  if (Daten != null && received) {
    if(index == 0){
     zeroTime = millis(); 
    }
    String[] data = split(Daten, ';');
    
    
    scd_temperature_data[index] = float(data[0]);
    scd_humidity_data[index] = float(data[1]);
    scd_co2_data[index] = float(data[2]);
    
    sps_pm1_data[index] = float(data[3]);
    sps_pm25_data[index] = float(data[4]);
    sps_pm4_data[index] = float(data[5]);
    sps_pm10_data[index] = float(data[6]);
    ////
    sgp_eco2_data[index] = float(data[7]);
    sgp_tvoc_data[index] = float(data[8]);
    ///

    
    zeit[index] = (millis() - zeroTime2)/1000;
    if ( millis() - time > 1000*del) {
      index += 1;
      time = millis();
    }
  } else {
    Daten = null;
  }
}

void Einstellungen(){
  
}

int[] y_scale = {0, 0};
int x_scale = 0;





void Feinstaub() {
  SPS_check.show();
  two_three.active = false;
  four.active = false;
  one.active = false;
  settings.active = false;
  up1.show();
  down1.show();
  up2.show();
  down2.show();
  left1.show();
  right1.show();
  reset.show();

  onlyTwo(SPS_check, "PM1", "PM2.5", "PM4", "PM10");  //Sorgt dafür, dass man nur zwei Sachen gleichzeitig auswählen kann
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
  text(x_scale, 500, 600);

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
  text(intervall, 690, 690);



  //Welche Graphen sollen angezeigt werden?
  boolean pm1 = SPS_check.getState("PM1");
  boolean pm25 = SPS_check.getState("PM2.5");
  boolean pm4 = SPS_check.getState("PM4");
  boolean pm10 = SPS_check.getState("PM10");
  if (pm1) {
    graph(sps_pm1_data, "Feinstaub PM1 in μg/m³", x_scale, y_scale, true);
    if (pm25) {
      graph(sps_pm25_data, "Feinstaub PM2.5 in μg/m³", x_scale, y_scale, false);
    } else if (pm4) {
      graph(sps_pm4_data, "Feinstaub PM4 in μg/m³", x_scale, y_scale, false);
    } else if (pm10) {
      graph(sps_pm10_data, "Feinstaub PM10 in μg/m³", x_scale, y_scale, false);
    }
  } else if (pm25) {
    graph(sps_pm25_data, "Feinstaub PM2.5 in μg/m³", x_scale, y_scale, true);
    if (pm4) {
      graph(sps_pm4_data, "Feinstaub PM4 in μg/m³", x_scale, y_scale, false);
    } else if (pm10) {
      graph(sps_pm10_data, "Feinstaub PM10 in μg/m³", x_scale, y_scale, false);
    }
  } else if (pm4) {
    graph(sps_pm4_data, "Feinstaub PM4 in μg/m³", x_scale, y_scale, true);
    if(pm10){
      graph(sps_pm10_data, "Feinstaub PM10 in μg/m³", x_scale, y_scale, false);
    }
  }else if(pm10){
    graph(sps_pm10_data, "Feinstaub PM10 in μg/m³", x_scale, y_scale, true);
  }

  fill(0);
}




void onlyTwo(CheckBox check, String state1, String state2, String state3, String state4) {
  boolean st1 = check.getState(state1);
  boolean st2 = check.getState(state2);
  boolean st3 = check.getState(state3);
  boolean st4 = check.getState(state4);

  if (st1 && st2) {
    check.deactivate(state3);
    check.deactivate(state4);
  }
  if (st1 && st3) {
    check.deactivate(state2);
    check.deactivate(state4);
  }
  if (st1 && st4) {
    check.deactivate(state2);
    check.deactivate(state3);
  }
  if (st2 && st3) {
    check.deactivate(state1);
    check.deactivate(state4);
  }
  if (st2 && st4) {
    check.deactivate(state1);
    check.deactivate(state3);
  }
  if (st3 && st4) {
    check.deactivate(state1);
    check.deactivate(state2);
  }
}

void Innenraumluft() {
  SCD_check.show();
  two_three.active = false;
  four.active = false;
  one.active = false;
  settings.active = false;
  up1.show();
  down1.show();
  up2.show();
  down2.show();
  left1.show();
  right1.show();
  reset.show();
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
  text(intervall, 690, 690);


  //Welche Graphen sollen angezeigt werden?
  onlyTwo2(SCD_check, "T", "H", "CO2");
  
  boolean t = SCD_check.getState("T");
  boolean co2 = SCD_check.getState("H");
  boolean hum = SCD_check.getState("CO2");

  if (t) {
    graph(scd_temperature_data, "Temperatur in °C", x_scale, y_scale, true);
    if (hum) {
      graph(scd_humidity_data, "relative Luftfeuchte in %", x_scale, y_scale, false);
    } else if (co2) {
      graph(scd_co2_data, "CO2 in ppm", x_scale, y_scale, false);
    }
  } else if (hum) {
    graph(scd_humidity_data, "relative Luftfeuchte in %", x_scale, y_scale, true);
    if (co2) {
      graph(scd_co2_data, "CO2 in ppm", x_scale, y_scale, false);
    }
  } else if (co2) {
    graph(scd_co2_data, "CO2 in ppm", x_scale, y_scale, true);
  }

  fill(0);
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

void MenschSensor(){
    two_three.active = false;
  four.active = false;
  one.active = false;
  settings.active = false;
}

void Station2Oder3(){
  two_three.active = false;
  four.active = false;
  one.active = false;
  settings.active = false;
  
  two.show();
  three.show();
  
  textSize(20);
  fill(0);
  text("Station 2 - Mensch vs. Sensor", 220, 250);
  text("Station 3 - TVOC-Duelle", 670, 250);
}

void TVOC_Duelle() {
  two_three.active = false;
  four.active = false;
  one.active = false;
  settings.active = false;
}

void checkConnection() {
  if (index > 3) {
    // Vergleiche die letzten 3 Messwerte. Wenn sie sich nicht ändern, ist der Sensor nicht verbunden
    //SCD30
    if (scd_temperature_data[index - 3] == scd_temperature_data[index - 2] && scd_temperature_data[index - 3] == scd_temperature_data[index - 1] 
      && scd_humidity_data[index - 3] == scd_humidity_data[index - 2] && scd_humidity_data[index - 3] == scd_humidity_data[index - 1]
      && scd_co2_data[index - 3] == scd_co2_data[index - 2] && scd_co2_data[index - 3] == scd_co2_data[index - 1]) {
      connected[0] = false;
    } else {
      connected[0] = true;
    }
    //SPS30
    if (sps_pm1_data[index - 3] == sps_pm1_data[index - 2] && sps_pm1_data[index - 3] == sps_pm1_data[index - 1]
      && sps_pm25_data[index - 3] == sps_pm25_data[index - 2] && sps_pm25_data[index - 3] == sps_pm25_data[index - 1]
      && sps_pm4_data[index - 3] == sps_pm4_data[index - 2] && sps_pm4_data[index - 3] == sps_pm4_data[index - 1]
      && sps_pm10_data[index - 3] == sps_pm10_data[index - 2] && sps_pm10_data[index - 3] == sps_pm10_data[index - 1]) {
      connected[1] = false;
    } else {
      connected[1] = true;
    }
    //SGP
    if (sgp_eco2_data[index - 3] == sgp_eco2_data[index - 2] && sgp_eco2_data[index - 3] == sgp_eco2_data[index - 1]
      && sgp_tvoc_data[index - 3] == sgp_tvoc_data[index - 2] && sgp_tvoc_data[index - 3] == sgp_tvoc_data[index - 1]) {
      connected[2] = false;
    } else {
      connected[2] = true;
    }
  }

  if (connected[0]) {
    fill(0, 255, 0);
  } else {
    fill(255, 0, 0);
  }
  ellipse(80, 380, 50, 50);

  if (connected[1]) {
    fill(0, 255, 0);
  } else {
    fill(255, 0, 0);
  }
  ellipse(420, 80, 50, 50);

  if (connected[2]) {
    fill(0, 255, 0);
  } else {
    fill(255, 0, 0);
  }
  ellipse(820, 80, 50, 50);
}

void graph(float[] array, String name, int x_scale, int[] y_scale, boolean left) {
  // 2. Wenn y-scale == 0 --> Bereich zwischen minimum und Maximum
  // 1: 0 und 20
  // 2: 0 und 30
  // 3: 0 und 40

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
      xValues = index;
    } else {
      xValues = 1;
    }
  } else if (x_scale == 1) {
    xValues = time(60);
    println(xValues);
  } else if (x_scale == 2) {
    xValues = time(180);
  } else if (x_scale == 3) {
    xValues = time(360);
  } else if (x_scale == 4) {
    xValues = time(720);
  } else if (x_scale == 5) {
    xValues = time(3600);
  } else if (x_scale == 6) {
    xValues = time(10800);
  } else if (x_scale == 7) {
    xValues = time(21600);
  } else if (x_scale == 8) {
    xValues = time(43200);
  } else if (x_scale == 9) {
    xValues = time(86400);
  } else if (x_scale == 10) {
    xValues = time(259200);
  } else {
    xValues = index;
  }

  textSize(20);
  fill(0);
  text("0", 150, 640);
  if (zeit[xValues-1] < 60) {
    for (int i = 0; i < 12; i++) {
      if (zeit[xValues - 1] > (5*i + 5)) {
        float x = 175 + (5*i + 5)*930/zeit[xValues-1]; 
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
  } else if (zeit[xValues- 1] < 180) { //3 Minuten
    for (int i = 0; i < 12; i++) {
      float temp = 15*i + 15;
      if (zeit[xValues - 1] > temp) {
        float x = 175 + temp*930/zeit[xValues-1]; 
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
  } else if (zeit[xValues- 1] < 360) {//6 Minuten
    for (int i = 0; i < 12; i++) {
      float temp = 30*i + 30;
      if (zeit[xValues - 1] > temp) {
        float x = 175 + temp*930/zeit[xValues-1]; 
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
  } else if (zeit[xValues- 1] < 720) {//12 Minuten
    for (int i = 0; i < 12; i++) {
      float temp = 60*i + 60;
      if (zeit[xValues - 1] > temp) {
        float x = 175 + temp*930/zeit[xValues-1]; 
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
  } else if (zeit[xValues- 1] < 3600) {//60 Minuten
    for (int i = 0; i < 12; i++) {
      float temp = 300* i + 300;
      if (zeit[xValues - 1] > temp) {
        float x = 175 + temp*930/zeit[xValues-1]; 
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
  } else if (zeit[xValues- 1] < 10800) {//3 Stunden
    for (int i = 0; i < 12; i++) {
      float temp = 900*i + 900;
      if (zeit[xValues - 1] > temp) {
        float x = 175 + temp*930/zeit[xValues-1]; 
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
  } else if (zeit[xValues- 1] < 21600) {//6 Stunden
    for (int i = 0; i < 12; i++) {
      float temp = 1800*i + 1800;
      if (zeit[xValues - 1] > temp) {
        float x = 175 + temp*930/zeit[xValues-1]; 
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
  } else if (zeit[xValues- 1] < 43200) {//12 Stunden
    for (int i = 0; i < 12; i++) {
      float temp = 3600*i + 3600;
      if (zeit[xValues - 1] > temp) {
        float x = 175 + temp*930/zeit[xValues-1]; 
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
  } else if (zeit[xValues- 1] < 86400) {// 24 Stunden
    for (int i = 0; i < 12; i++) {
      float temp = 7200*i + 7200;
      if (zeit[xValues - 1] > temp) {
        float x = 175 + temp*930/zeit[xValues-1]; 
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
      if (zeit[xValues - 1] > temp) {
        float x = 175 + temp*930/zeit[xValues-1]; 
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
    min = minValue(array, xValues);
    max = maxValue(array, xValues);
  } else if (y == 1) {
    if (name == "Temperatur in °C") {
      max = 20;
    } else if (name == "CO2 in ppm") {
      max = 500;
    } else if (name == "relative Luftfeuchte in %") {
      max = 25;
    } else if (name == "Feinstaub PM1 in μg/m³" || name == "Feinstaub PM2.5 in μg/m³" || name == "Feinstaub PM4 in μg/m³" || name == "Feinstaub PM10 in μg/m³") {
      max = 10;
    }
  } else if (y == 2) {
    if (name == "Temperatur in °C") {
      max = 30;
    } else if (name == "CO2 in ppm") {
      max = 1000;
    } else if (name == "relative Luftfeuchte in %") {
      max = 50;
    } else if (name == "Feinstaub PM1 in μg/m³" || name == "Feinstaub PM2.5 in μg/m³" || name == "Feinstaub PM4 in μg/m³" || name == "Feinstaub PM10 in μg/m³") {
      max = 20;
    }
  } else if (y == 3) {
    if (name == "Temperatur in °C") {
      max = 40;
    } else if (name == "CO2 in ppm") {
      max = 2000;
    } else if (name == "relative Luftfeuchte in %") {
      max = 75;
    } else if (name == "Feinstaub PM1 in μg/m³" || name == "Feinstaub PM2.5 in μg/m³" || name == "Feinstaub PM4 in μg/m³" || name == "Feinstaub PM10 in μg/m³") {
      max = 50;
    }
  } else if (y == 4) {
    if (name == "Temperatur in °C") {
      max = 50;
    } else if (name == "CO2 in ppm") {
      max = 5000;
    } else if (name == "relative Luftfeuchte in %") {
      max = 100;
    } else if (name == "Feinstaub PM1 in μg/m³" || name == "Feinstaub PM2.5 in μg/m³" || name == "Feinstaub PM4 in μg/m³" || name == "Feinstaub PM10 in μg/m³") {
      max = 200;
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
    } else if (name == "CO2 in ppm") {
      text("100", pos_x, 507);
      text("200", pos_x, 407);
      text("300", pos_x, 307);
      text("400", pos_x, 207);
    } else if (name == "Feinstaub PM1 in μg/m³" || name == "Feinstaub PM2.5 in μg/m³" || name == "Feinstaub PM4 in μg/m³" || name == "Feinstaub PM10 in μg/m³") {
      text("2", pos_x, 507);
      text("4", pos_x, 407);
      text("6", pos_x, 307);
      text("8", pos_x, 207);
    }  else if (name == "relative Luftfeuchte in %") {
      text("5", pos_x, 507);
      text("10", pos_x, 407);
      text("15", pos_x, 307);
      text("20", pos_x, 207);
    }
  } else if (y == 2) {
    if (name == "Temperatur in °C") {
      text("6", pos_x, 507);
      text("12", pos_x, 407);
      text("18", pos_x, 307);
      text("24", pos_x, 207);
    } else if (name == "CO2 in ppm") {
      text("200", pos_x, 507);
      text("400", pos_x, 407);
      text("600", pos_x, 307);
      text("800", pos_x, 207);
    } else if (name == "Feinstaub PM1 in μg/m³" || name == "Feinstaub PM2.5 in μg/m³" || name == "Feinstaub PM4 in μg/m³" || name == "Feinstaub PM10 in μg/m³") {
      text("4", pos_x, 507);
      text("8", pos_x, 407);
      text("12", pos_x, 307);
      text("16", pos_x, 207);
    }else if (name == "relative Luftfeuchte in %") {
      text("10", pos_x, 507);
      text("20", pos_x, 407);
      text("30", pos_x, 307);
      text("40", pos_x, 207);
    }
  } else if (y == 3) {
    if (name == "Temperatur in °C") {
      text("8", pos_x, 507);
      text("16", pos_x, 407);
      text("24", pos_x, 307);
      text("32", pos_x, 207);
    } else if (name == "CO2 in ppm") {
      text("300", pos_x, 507);
      text("600", pos_x, 407);
      text("900", pos_x, 307);
      text("1200", pos_x, 207);
    } else if (name == "Feinstaub PM1 in μg/m³" || name == "Feinstaub PM2.5 in μg/m³" || name == "Feinstaub PM4 in μg/m³" || name == "Feinstaub PM10 in μg/m³") {
      text("10", pos_x, 507);
      text("20", pos_x, 407);
      text("30", pos_x, 307);
      text("40", pos_x, 207);
    }else if (name == "relative Luftfeuchte in %") {
      text("15", pos_x, 507);
      text("30", pos_x, 407);
      text("45", pos_x, 307);
      text("60", pos_x, 207);
    }
  } else if (y == 4) {
    if (name == "Temperatur in °C") {
      text("10", pos_x, 507);
      text("20", pos_x, 407);
      text("30", pos_x, 307);
      text("40", pos_x, 207);
    } else if (name == "CO2 in ppm") {
      text("1000", pos_x, 507);
      text("2000", pos_x, 407);
      text("3000", pos_x, 307);
      text("4000", pos_x, 207);
    } else if (name == "Feinstaub PM1 in μg/m³" || name == "Feinstaub PM2.5 in μg/m³" || name == "Feinstaub PM4 in μg/m³" || name == "Feinstaub PM10 in μg/m³") {
      text("40", pos_x, 507);
      text("80", pos_x, 407);
      text("120", pos_x, 307);
      text("160", pos_x, 207);
    }else if (name == "relative Luftfeuchte in %") {
      text("20", pos_x, 507);
      text("40", pos_x, 407);
      text("60", pos_x, 307);
      text("80", pos_x, 207);
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
    text(name, 0, -575);
    popMatrix();
  }

  fill(0);
  text(nf(ceil(zeit[xValues-1]), 0, 0), 1120, 640);
  //println(zeit[xValues-1]);

  textAlign(CORNER);
  if (xValues > 0) {
    for (int i = (index - xValues); i < index - 1; i++) {
      float x1 = 175 +  (i- (index - xValues))*930/(xValues - 1);
      float x2 = 175 + (i+1- (index - xValues))*930/(xValues - 1);
      float y1 = 600 - 500*(array[i]-min)/(max - min);
      float y2 = 600 - 500*(array[i+1] - min)/(max - min);
      if (array[i] <= max && array[i+1] <= max) {
        line(x1, y1, x2, y2);
      }
    }
  }


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
  }


  textSize(16);
  if (left) {
    fill(255, 0, 0);
    text("Aktueller Wert: " + array[xValues-1] + " " + Einheit, 50, 50);
  } else {
    fill(0, 0, 255);
    text("Aktueller Wert:" + array[xValues-1] + " " + Einheit, 1050, 50);
  }
}














float minValue(float[] array, int xVals) {
  float min = 99999999;
  int temp = 1;
  if (index > 0) {
    temp = index;
  }
  for (int i = (temp - xVals); i < temp; i++) {
    if (array[i] < min) {
      min = array[i];
    }
  }
  return min;
}

float maxValue(float[] array, int xVals) {
  float max = -99999999;
  int temp = 1;
  if (index > 0) {
    temp = index;
  }
  for (int i = (temp - xVals); i< temp; i++) {
    if (array[i] > max) {
      max = array[i];
    }
  }
  return max;
}



int time(int sekunden) {
  int t = 0;
  int temp = 1;
  if (index > 0) {
    temp = index;
  }
  for (int i = 0; i < temp; i++) {
    if (zeit[i] > (sekunden)) {
      t = i;
      break;
    } else {
      t = index;
    }
  }
  return t;
}


boolean[] connected = {false, false, false};


void hauptmenu() {
  stroke(0);
  one.show();
  two_three.show();
  four.show();
  settings.show();
  
  if(one.isClicked()){
   println("HI"); 
  }
  


  image(sps, 150, 100);
  image(sgp, 620, 120);
  image(scd, 150, 470);
  image(nodemcu, 600, 400);
    checkConnection();

  fill(0);
  textSize(20);
  text("Station 1 - Feinstaubmessung", 60, 70);
  text("Station 2 - Mensch vs. Sensor", 460, 70);
  text("Station 3 - TVOC-Duelle", 460, 100);
  text("Station 4 - Innenraumluftqualität", 60, 640);
  text("Einstellungen", 460, 640);

  strokeWeight(5);
  noFill();

  if (two_three.isOver()) {
    stroke(255);
    line(646, 232, 646, 300);
    line(646, 300, 550, 300);
    line(550, 300, 550, 562);
    line(550, 562, 600, 562);

    stroke(0);
    line(682, 232, 682, 320);
    line(682, 320, 580, 320);
    line(580, 320, 580, 549);
    line(580, 549, 600, 549);

    stroke(255, 0, 0);
    line(701, 232, 701, 320);
    line(701, 320, 750, 320);
    line(750, 320, 750, 445);
    line(750, 445, 730, 445);

    stroke(255, 255, 0);
    line(720, 232, 720, 300);
    line(720, 300, 780, 300);
    line(780, 300, 780, 455);
    line(780, 455, 730, 455);
  }


  if (four.isOver()) {
    stroke(255);
    line(341, 470, 342, 458);
    line(341, 458, 600, 458);

    stroke(0);
    line(327, 470, 327, 444);
    line(327, 444, 600, 444);

    stroke(255, 0, 0);
    line(313, 470, 313, 390);
    line(313, 390, 760, 390);
    line(760, 390, 760, 445);
    line(760, 445, 730, 445);

    stroke(255, 255, 0);
    line(298, 470, 298, 370);
    line(298, 370, 780, 370);
    line(780, 370, 780, 455);
    line(780, 455, 730, 455);
  }

  if (one.isOver()) {
    stroke(0);
    line(160, 300, 160, 444);
    line(175, 300, 175, 444);
    line(160, 444, 600, 444);


    stroke(255);
    line(220, 300, 220, 380);
    line(220, 380, 550, 380);
    line(550, 380, 550, 438);
    arc(550, 448, 20, 20, PI/2, 3*PI/2);
    line(550, 458, 600, 458);

    stroke(255, 0, 0);
    line(190, 300, 190, 420);
    line(190, 420, 530, 420);
    line(530, 420, 530, 390);

    arc(530, 380, 20, 20, PI/2, 3*PI/2);
    line(530, 370, 530, 350);
    line(530, 350, 760, 350);
    line(760, 350, 760, 445);
    line(760, 445, 730, 445);


    stroke(255, 255, 0);
    line(205, 300, 205, 400);
    line(205, 400, 500, 400);
    line(500, 400, 500, 390);
    arc(500, 380, 20, 20, PI/2, 3*PI/2);
    line(500, 370, 500, 330);
    line(500, 330, 780, 330);
    line(780, 330, 780, 455);
    line(780, 455, 730, 455);


    //Widerstände
    strokeWeight(3);
    stroke(104,54,26);
    fill(104,64,26);
    line(350, 420, 350, 380);
    line(330, 400, 330, 380);

    rect(347, 394, 5, 9);
    rect(327, 386, 5, 9);
    text("R = 10 kΩ", 305, 370);
    
    
  }


  strokeWeight(1);
}

class station {
  float x;
  float y;
  boolean active;

  station(float x_, float y_, boolean active_) {
    x = x_;
    y = y_;
    active = active_;
  }


    void show() {
      if (mouseX > x && mouseX < (x + 400) && mouseY > y && mouseY < (y + 300)) {
        fill(150, 255, 150);
      } else {
        fill(0, 200, 00);
      }
      rect(x, y, 400, 300);
    }

    boolean isOver() {
      if (mouseX > x && mouseX < (x + 400) && mouseY > y && mouseY < (y + 300) && active) {
        return true;
      } else {
        return false;
      }
      
    }


    boolean isClicked() {
      if (this.isOver() && mousePressed && active) {
        return true;
      } else {
        return false;
      }
    }
  
}
