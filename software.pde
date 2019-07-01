PImage sps, sgp, scd, nodemcu, DBU, iPhysicsLab, LMT, SFZSLS, SUSmobil;
import processing.serial.*;
import controlP5.*;
Serial myPort;


Table table;

ControlP5 SPS_control, SGP_control, SCD_control, autosave_control, dateiformat_control;
CheckBox SPS_check, SGP_check, SCD_check, autosave, dateiformat;

station one, two_three, two, three, four, settings;
button back, up1, down1, up2, down2, left1, right1;

button reset, sicher_ja, sicher_nein;
button aktualisierung_right, aktualisierung_left;

button Stationen, Sensoren, zumObermenu;
button SPS30, SGP30, SCD30;
button einstellungen;

button station1_referenz, station1_trocken, station1_nass, station1_MessungStarten, FeinstaubVergleichen;

float page = -1;
boolean gotSerial = false;
float zeroTime2 = 0;
float zeroTime3 = 0; //Feinstaubzeit
float zeroTime4 = 0;
float zeroTime5 = 0;
void setup() {
  size(1280, 720);
  try {
    myPort = new Serial(this, Serial.list()[0], 57600);
    gotSerial = true;
  }
  catch(Exception e) {
    gotSerial = false;
  }

  table = new Table();
  table.addColumn("Zeit");
  table.addColumn("Temperatur");
  table.addColumn("Luftfeuchte");
  table.addColumn("CO2");
  table.addColumn("eCO2");
  table.addColumn("TVOC");
  table.addColumn("PM1");
  table.addColumn("PM2.5");
  table.addColumn("PM4");
  table.addColumn("PM10");

  back = new button(1175, 665, 100, 50, "zurück", 5, true, 20);
  up1 = new button(70, 100, 30, 50, "up_arrow", 5, true, 20);
  down1 = new button(70, 155, 30, 50, "down_arrow", 5, true, 20);
  up2 = new button(1210, 100, 30, 50, "up_arrow", 5, true, 20);
  down2 = new button(1210, 155, 30, 50, "down_arrow", 5, true, 20);
  left1 = new button(620, 670, 50, 30, "left_arrow", 5, true, 20);
  right1 = new button(680, 670, 50, 30, "right_arrow", 5, true, 20);

  aktualisierung_right = new button(150, 670, 50, 30, "right_arrow", 5, true, 20);
  aktualisierung_left = new button(90, 670, 50, 30, "left_arrow", 5, true, 20);

  //
  reset = new button(1070, 665, 100, 50, "Reset", 5, true, 20);
  sicher_ja = new button(450, 340, 150, 75, "Ja", 5, true, 20);
  sicher_nein = new button(700, 340, 150, 75, "Nein", 5, true, 20);


  //
  Stationen = new button(100, 100, 500, 400, "Stationen", 5, true, 50);
  Sensoren = new button(650, 100, 500, 400, "Sensoren", 5, true, 50);
  zumObermenu = new button(1110, 640, 150, 75, "Hauptmenü", 5, true, 20);

  //
  SPS30 = new button(550, 50, 300, 200, "Feinstaub", 5, true, 30);
  SGP30 = new button(550, 275, 300, 200, "TVOC, eCO2", 5, true, 30);
  SCD30 = new button(550, 500, 300, 200, "Temperatur,\nLuftfeuchte,\nCO2", -20, true, 30);

  //
  einstellungen = new button(20, 630, 150, 75, "Einstellungen", 5, true, 20);

  //
  station1_referenz = new button(150, 350, 300, 150, "Referenzmessung", 5, true, 30);
  station1_trocken = new button(500, 350, 300, 150, "trockener\nSchwamm", -20, true, 30);
  station1_nass = new button(850, 350, 300, 150, "nasser\nSchwamm", -20, true, 30);

  station1_MessungStarten = new button(600, 10, 150, 75, "Messung\nstarten", -10, true, 20);
  FeinstaubVergleichen = new button(600, 620, 150, 75, "Vergleiche\nDaten", -10, true, 20);

  sps = loadImage("img/sps30.jpg");
  sgp = loadImage("img/sgp30.jpg");
  scd = loadImage("img/scd30.jpg");
  nodemcu = loadImage("img/nodemcu.png");
  SUSmobil = loadImage("img/SUSmobil.png");
  DBU = loadImage("img/DBU.png");
  iPhysicsLab = loadImage("img/iPhysicsLab.png");
  LMT = loadImage("img/LMT.png");
  SFZSLS = loadImage("img/SFZSLS.png");


  one = new station(50, 50, false);
  two_three = new station(450, 50, false);
  two = new station(200, 200, false);
  three = new station(650, 200, false);
  four = new station(50, 350, false);
  settings = new station(450, 350, false);


  dateiformat_control = new ControlP5(this);
  dateiformat = dateiformat_control.addCheckBox("Dateiformat")
    .setPosition(500, 225)
    .setColorForeground(color(120))
    .setColorActive(color(0, 255, 0))
    .setColorLabel(color(255, 255, 100))
    .setSize(30, 30)
    .setItemsPerRow(4)
    .setSpacingColumn(100)
    .setSpacingRow(100)
    .addItem("txt", 0)
    .addItem("csv", 0)
    .hide();

  dateiformat.activate("csv");

  autosave_control= new ControlP5(this);
  autosave = autosave_control.addCheckBox("automatisch_speichern")
    .setPosition(500, 175)
    .setColorForeground(color(120))
    .setColorActive(color(0, 255, 0))
    .setColorLabel(color(255, 255, 100))
    .setSize(30, 30)
    .setItemsPerRow(4)
    .setSpacingColumn(100)
    .setSpacingRow(100)
    .addItem("autosave", 0)
    .hide();

  SPS_control = new ControlP5(this);
  SPS_check = SPS_control.addCheckBox("SPS")
    .setPosition(400, 20)
    .setColorForeground(color(120))
    .setColorActive(color(0, 255, 0))
    .setColorLabel(color(255, 255, 100))
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
    .setColorLabel(color(255, 255, 100))
    .setSize(30, 30)
    .setItemsPerRow(4)
    .setSpacingColumn(175)
    .setSpacingRow(250)
    .addItem("T", 0)
    .addItem("H", 50)
    .addItem("CO2", 100)
    .hide();

  SGP_control = new ControlP5(this);
  SGP_check = SGP_control.addCheckBox("SCD")
    .setPosition(600, 20)
    .setColorForeground(color(120))
    .setColorActive(color(0, 255, 0))
    .setColorLabel(color(255, 255, 100))
    .setSize(30, 30)
    .setItemsPerRow(4)
    .setSpacingColumn(100)
    .setSpacingRow(100)
    .addItem("TVOC", 0)
    .addItem("eCO2", 50)
    .hide();
}


/////////////// Seiteninformationen /////////////////

/////////// -1: Obermenü //////////////

///// 0: Stationsmenü  //////

// 1: Feinstaub
// 2: Mensch vs Sensor
// 2.5: Mensch vs Sensor oder TVOC Duelle
// 3: TVOC Duelle
// 4: Innenraumluftqualität

////// -2: Sensoren

// -3: SPS
// -4: SGP
// -5: SCD



void draw() {
  for (int i = 0; i < 720; i++) {
    stroke(255, 255, 100 + i*155/720);
    line(0, i, 1280, i);
  }
  noStroke();
  fill(0);
  textSize(16);
  text(nf(frameRate, 0, 0), 20, 20);
  text("Aufgenommene Messwerte: " + index, 1000, 20);
  text(indexStation1, 1000, 40);
  SCD_check.hide();
  SPS_check.hide();
  SGP_check.hide();
  sicher_ja.hide();
  einstellungen.hide();
  sicher_nein.hide();
  dateiformat.hide();
  station1_referenz.hide();
  station1_trocken.hide();
  station1_nass.hide();

  if (page != 0 && page != -1) {
    back.show();
  }
  Datenaufnahme();

  boolean auto = autosave.getState("automatisch_speichern");
  autosave.hide();
  if (auto) {
    saveData();
  }


  if (Stationen.isClicked()) {
    page = 0;
  }
  if (Sensoren.isClicked()) {
    page = -2;
  }


  if (index > 0) {
    if (SPS30.isClicked()) {
      page = -3;
    }
    if (SGP30.isClicked()) {
      page = -4;
    }
    if (SCD30.isClicked()) {
      page = -5;
    }

    if (one.isClicked()) {
      page = 1;
    }
    if (two_three.isClicked()) {
      page = 2.5;
    }
    if (two.isClicked()) {
      page = 2;
    }
    if (three.isClicked()) {
      page = 3;
    }
    if (four.isClicked()) {
      page = 4;
    }
  }



  if (page == -1) {
    Obermenu();
    einstellungen.show();
    reset.hide();
    SPS30.hide();
    SCD30.hide();
    SGP30.hide();
  } else if (page == 0) {
    hauptmenu();
    zumObermenu.show();
    Sensoren.hide();
    two_three.active = true;
    four.active = true;
    one.active = true;
    settings.active = true;
    two.active = false;
    three.active = false;
    reset.hide();
  } else if (page == 1) {
    //Feinstaub();
    Station1();
    Sensoren.hide();
    zumObermenu.hide();
  } else if (page == 1.1) {
    referenzmessung();
  } else if (page == 1.11) {
    trockenerSchwamm();
  } else if (page == 1.111) {
    nasserSchwamm();
  }  else if (page == 1.1111) {
    Vergleich_Feinstaub();
  } else if (page == 2) {
    MenschSensor();
    zumObermenu.hide();
  } else if (page == 2.5) {
    Station2Oder3();
    zumObermenu.hide();
    two.active = true;
    three.active = true;
  } else if (page == 3) {
    TVOC_Duelle();
    zumObermenu.hide();
  } else if (page == 4) {
    Innenraumluft();
    zumObermenu.hide();
  } else if (page == 10) {
    setting();
    autosave.show();
    dateiformat.show();
    Stationen.hide();
    Sensoren.hide();
    zumObermenu.hide();
  } else if (page == -2) {
    SensorAuswahl(); 
    SPS30.show();
    SCD30.show();
    SGP30.show();
    reset.hide();
  } else if (page == -3) {
    Feinstaub();
    SPS30.hide();
    SCD30.hide();
    SGP30.hide();
    Stationen.hide();
  } else if (page == -4) {
    TVOC_eCO2();
    SPS30.hide();
    SCD30.hide();
    SGP30.hide();
    Stationen.hide();
  } else if (page == -5) {
    T_H_CO2();
    SPS30.hide();
    SCD30.hide();
    SGP30.hide();
    Stationen.hide();
  }


  if (back.isClicked()) {
    saveData();
    if (page > 0 && page != 10) {
      if (page == 1.1 || page == 1.11 || page == 1.111 || page == 1.1111) {
        Station1Start = false;
        page = 1;
      } else {
        page = 0;
      }
    } else if (page < -2) {
      page =  -2;
    } else if (page == 10) {
      page = -1;
    } else {
      page = -1;
    }
  }
  if (station1_referenz.isClicked()) {
    station1_ref = true;
    page = 1.1;
  }

  if (station1_trocken.isClicked()) {
    station1_ref = true;
    page = 1.11;
  }

  if (station1_nass.isClicked()) {
    station1_ref = true;
    page = 1.111;
  }

  if (reset.isClicked()) {
    reset_bool = true;
  }
  if (reset_bool) {
    sicher();
  }
  if (zumObermenu.isClicked()) {
    page = -1;
  }
  if (sicher_ja.isClicked()) {
    reset_bool = false; 
    index = 0;
    zeroTime2 = millis();
    table.clearRows();
  }
  if (sicher_nein.isClicked()) {
    reset_bool = false;
  }
  if (aktualisierung_right.isClicked()) {
    if (del < 3600) {
      del += 1;
    }
  }
  if (aktualisierung_left.isClicked()) {
    if (del > 0) {
      del -= 1;
    }
  }

  if (einstellungen.isClicked()) {
    page = 10;
  }

  if (station1_MessungStarten.isClicked()) {
    indexStation1 = 0;
    indexStation1_trocken = 0;
    indexStation1_nass = 0;
    Station1Start = true;
    if (page == 1.1) {
      zeroTime3 = millis();
    } else if (page == 1.11) {
      zeroTime4 =millis();
    } else if (page == 1.111) {
      zeroTime5 = millis();
    }
  }
  
  if(FeinstaubVergleichen.isClicked() && page == 1){
   page = 1.1111;
  }
}

boolean reset_bool = false;


void sicher() {
  fill(255, 100, 100);
  rect(225, 250, 830, 200);
  fill(0);
  textSize(30);
  textAlign(CORNER);
  text("Bist du sicher, dass du die Daten löschen möchtest?", 250, 300);
  sicher_ja.show();
  sicher_nein.show();
}



void saveData() {
  String[] SCD_T = new String[index];
  String[] SCD_H = new String[index];
  String[] SCD_CO2 = new String[index];

  String[] SGP_TVOC = new String[index];
  String[] SGP_eCO2 = new String[index];

  String[] SPS_PM1 = new String[index];
  String[] SPS_PM25 = new String[index];
  String[] SPS_PM4 = new String[index];
  String[] SPS_PM10 = new String[index];

  String[] Zeit = new String[index];


  boolean txt_bool = dateiformat.getState("txt");
  boolean csv_bool = dateiformat.getState("csv");


  if (txt_bool || csv_bool) {
    for (int i = 0; i < index; i++) {
      SCD_T[i] = str(scd_temperature_data[i]).replace('.', ',');
      SCD_H[i] = str(scd_humidity_data[i]).replace('.', ',');
      SCD_CO2[i] = str(scd_co2_data[i]).replace('.', ',');

      SGP_TVOC[i] = str(sgp_tvoc_data[i]).replace('.', ',');
      SGP_eCO2[i] = str(sgp_eco2_data[i]).replace('.', ',');

      SPS_PM1[i] = str(sps_pm1_data[i]).replace('.', ',');
      SPS_PM25[i] = str(sps_pm25_data[i]).replace('.', ',');
      SPS_PM4[i] = str(sps_pm4_data[i]).replace('.', ',');
      SPS_PM10[i] = str(sps_pm10_data[i]).replace('.', ',');

      Zeit[i] = str(zeit[i]).replace('.', ',');
    }
  }

  if (txt_bool) {
    saveStrings("Messdaten/" + day() + "_" + month() + "_" + year()+ "/SCD/Temperatur.txt", SCD_T);
    saveStrings("Messdaten/" + day() + "_" + month() + "_" + year()+"/SCD/Luftfeuchte.txt", SCD_H);
    saveStrings("Messdaten/" + day() + "_" + month() + "_" + year()+"/SCD/CO2.txt", SCD_CO2);
    saveStrings("Messdaten/" + day() + "_" + month() + "_" + year() +"/SGP/TVOC.txt", SGP_TVOC);
    saveStrings("Messdaten/" + day() + "_" + month() + "_" + year() +"/SGP/eCO2.txt", SGP_eCO2);
    saveStrings("Messdaten/" + day() + "_" + month() + "_" + year() +"/SPS/PM1.txt", SPS_PM1);
    saveStrings("Messdaten/" + day() + "_" + month() + "_" + year()+ "/SPS/PM25.txt", SPS_PM25);
    saveStrings("Messdaten/" + day() + "_" + month() + "_" + year()+ "/SPS/PM4.txt", SPS_PM4);
    saveStrings("Messdaten/" + day() + "_" + month() + "_" + year() +"/SPS/PM10.txt", SPS_PM10);
    saveStrings("Messdaten/" + day() + "_" + month() + "_" + year() + "/Zeit.txt", Zeit);
  }

  if (csv_bool) {
    table.clearRows();

    for (int i = 1; i < index+1; i++) {
      if (zeit[index-1] != 0) {
        TableRow newRow = table.addRow();

        newRow.setInt("Zeit", i);
        newRow.setFloat("Zeit", zeit[i]);
        newRow.setFloat("Temperatur", scd_temperature_data[i-1]);
        newRow.setFloat("Luftfeuchte", scd_humidity_data[i-1]);
        newRow.setFloat("CO2", scd_co2_data[i-1]);
        newRow.setFloat("eCO2", sgp_eco2_data[i-1]);
        newRow.setFloat("TVOC", sgp_tvoc_data[i-1]);
        newRow.setFloat("PM1", sps_pm1_data[i-1]);
        newRow.setFloat("PM2.5", sps_pm25_data[i-1]);
        newRow.setFloat("PM4", sps_pm4_data[i-1]);
        newRow.setFloat("PM10", sps_pm10_data[i-1]);

        saveTable(table, "Messdaten/" + day() + "_" + month() + "_" + year()+"/alleDaten.csv");
      }
    }
  }
}
class button {
  float x, y, dx, dy, textOffset;
  String text;
  boolean visible;
  int size;
  button(float x_, float y_, float dx_, float dy_, String text_, float textOffset_, boolean visible_, int size_) {
    x = x_;
    y = y_;
    dx = dx_;
    dy = dy_;
    text = text_;
    textOffset = textOffset_;
    visible = visible_;
    size = size_;
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
      textSize(size);
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
float[] scd_temperature_data = new float[999999];
float[] scd_humidity_data =new float[999999];
float[] scd_co2_data = new float[999999];
float[] sgp_tvoc_data = new float[999999];
float[] sgp_eco2_data =new float[999999];
float[] sps_pm25_data = new float[999999];
float[] sps_pm4_data = new float[999999];
float[] sps_pm10_data = new float[999999];
float[] sps_pm1_data = new float[999999];
float[] zeit = new float[999999];

float[] zwischenSpeicher_SGP_eCO2 = new float[999];
float[] zwischenSpeicher_SGP_TVOC = new float[999];
float[] zwischenSpeicher_SCD_T = new float[999];
float[] zwischenSpeicher_SCD_H = new float[999];
float[] zwischenSpeicher_SCD_CO2 = new float[999];
float[] zwischenSpeicher_SPS_PM1 = new float[999];
float[] zwischenSpeicher_SPS_PM25 = new float[999];
float[] zwischenSpeicher_SPS_PM4 = new float[999];
float[] zwischenSpeicher_SPS_PM10 = new float[999];



float[] Station1_PM1 = new float[999999];
float[] Station1_PM25 = new float[999999];
float[] Station1_PM4 = new float[999999];
float[] Station1_PM10 = new float[999999];
float[] Station1_zeit = new float[999999];


float[] Station1_PM1_trocken = new float[999999];
float[] Station1_PM25_trocken = new float[999999];
float[] Station1_PM4_trocken = new float[999999];
float[] Station1_PM10_trocken = new float[999999];
float[] Station1_zeit_trocken = new float[999999];

float[] Station1_PM1_nass = new float[999999];
float[] Station1_PM25_nass = new float[999999];
float[] Station1_PM4_nass= new float[999999];
float[] Station1_PM10_nass = new float[999999];
float[] Station1_zeit_nass = new float[999999];

String Daten = null;
int index = 0;
int indexStation1 = 0;
int indexStation1_trocken = 0;
int indexStation1_nass = 0;
float time = 0;
float zeroTime = 0;
int indexZwischenSpeicher = 0;


boolean Station1Start = false;

float del = 0;

void Datenaufnahme() {
  boolean received = false;

  if (myPort.available() > 0) {
    Daten = myPort.readStringUntil('\n');
    received = true;
  }
  if (Daten != null && received) {
    if (index == 0) {
      zeroTime = millis();
    }
    String[] data = split(Daten, ';');

    if (data.length > 8) {

      zwischenSpeicher_SCD_T[indexZwischenSpeicher] = float(data[0]);
      zwischenSpeicher_SCD_H[indexZwischenSpeicher] = float(data[1]);
      zwischenSpeicher_SCD_CO2[indexZwischenSpeicher] = float(data[2]);

      zwischenSpeicher_SPS_PM1[indexZwischenSpeicher] = float(data[3]);
      zwischenSpeicher_SPS_PM25[indexZwischenSpeicher] = float(data[4]);
      zwischenSpeicher_SPS_PM4[indexZwischenSpeicher] = float(data[5]);
      zwischenSpeicher_SPS_PM10[indexZwischenSpeicher] = float(data[6]);

      zwischenSpeicher_SGP_eCO2[indexZwischenSpeicher] = float(data[7]);
      zwischenSpeicher_SGP_TVOC[indexZwischenSpeicher] = float(data[8]);  


      indexZwischenSpeicher += 1;
      zeit[index] = (millis() - zeroTime)/1000;

      if ( millis() - time > 1000*del) {
        ////
        scd_temperature_data[index] =0;
        scd_humidity_data[index] = 0;
        scd_co2_data[index] = 0;
        ////
        sgp_eco2_data[index] = 0;
        sgp_tvoc_data[index] = 0;
        ///
        sps_pm1_data[index] = 0;
        sps_pm25_data[index] =0;
        sps_pm4_data[index] = 0;
        sps_pm10_data[index] = 0;

        for (int i = 0; i < indexZwischenSpeicher; i++) {
          ////
          scd_temperature_data[index] += zwischenSpeicher_SCD_T[i];
          scd_humidity_data[index] += zwischenSpeicher_SCD_H[i];
          scd_co2_data[index] += zwischenSpeicher_SCD_CO2[i];
          ////
          sgp_eco2_data[index] += zwischenSpeicher_SGP_eCO2[i];
          sgp_tvoc_data[index] += zwischenSpeicher_SGP_TVOC[i];
          ///
          sps_pm1_data[index] += zwischenSpeicher_SPS_PM1[i];
          sps_pm25_data[index] +=zwischenSpeicher_SPS_PM25[i];
          sps_pm4_data[index] += zwischenSpeicher_SPS_PM4[i];
          sps_pm10_data[index] += zwischenSpeicher_SPS_PM10[i];
        }
        scd_temperature_data[index] = scd_temperature_data[index]/(indexZwischenSpeicher);
        scd_humidity_data[index] = scd_humidity_data[index]/(indexZwischenSpeicher);
        scd_co2_data[index] = scd_co2_data[index]/(indexZwischenSpeicher);

        sgp_eco2_data[index] = sgp_eco2_data[index]/(indexZwischenSpeicher);
        sgp_tvoc_data[index] = sgp_tvoc_data[index]/(indexZwischenSpeicher);

        sps_pm1_data[index] = sps_pm1_data[index]/(indexZwischenSpeicher);
        sps_pm25_data[index] = sps_pm25_data[index]/(indexZwischenSpeicher);
        sps_pm4_data[index] = sps_pm4_data[index]/(indexZwischenSpeicher);
        sps_pm10_data[index] = sps_pm10_data[index]/(indexZwischenSpeicher);

        indexZwischenSpeicher = 0;
        index += 1;
        if (Station1Start) {

          if (page == 1.1) {// referenzmessung
            Station1_PM1[indexStation1] = sps_pm1_data[index-2];
            Station1_PM25[indexStation1] = sps_pm25_data[index-2];
            Station1_PM4[indexStation1] = sps_pm4_data[index-2];
            Station1_PM10[indexStation1] = sps_pm10_data[index-2];
            Station1_zeit[indexStation1] = (millis() - zeroTime3)/1000;
            if (Station1_zeit[indexStation1] > 9) {
              Station1Start = false;
            }
            indexStation1 += 1;
          } else if (page == 1.11) { // trockener Schwamm

            Station1_PM1_trocken[indexStation1_trocken] = sps_pm1_data[index-2];
            Station1_PM25_trocken[indexStation1_trocken] = sps_pm25_data[index-2];
            Station1_PM4_trocken[indexStation1_trocken] = sps_pm4_data[index-2];
            Station1_PM10_trocken[indexStation1_trocken] = sps_pm10_data[index-2];
            Station1_zeit_trocken[indexStation1_trocken] = (millis() - zeroTime4)/1000;
            if (Station1_zeit_trocken[indexStation1_trocken] > 9) {
              Station1Start = false;
            }
            indexStation1_trocken += 1;
          } else if (page == 1.111) {// nasser Schwamm

            Station1_PM1_nass[indexStation1_nass] = sps_pm1_data[index-2];
            Station1_PM25_nass[indexStation1_nass] = sps_pm25_data[index-2];
            Station1_PM4_nass[indexStation1_nass] = sps_pm4_data[index-2];
            Station1_PM10_nass[indexStation1_nass] = sps_pm10_data[index-2];
            Station1_zeit_nass[indexStation1_nass] = (millis() - zeroTime5)/1000;
            if (Station1_zeit_nass[indexStation1_nass] > 9) {
              Station1Start = false;
            }
            indexStation1_nass += 1;
          }
        }
        time = millis();
        zeit[index] = (millis() - zeroTime2)/1000;
      }
    } else {
      Daten = null;
    }
  }
}
void setting(){
  textSize(30);
  fill(0);
  text("Autosave", 300, 200);
  text("Speichern als", 250, 250);
  text(".txt          .csv", 550, 250);
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


  aktualisierung_right.show();
  aktualisierung_left.show();
  fill(0);
  noStroke();

  if (del == 0) {
    text("Aktualisierungsintervall: Maximum", 220, 692);
  } else {
    text("Aktualisierungsintervall: " + nf(del, 0, 0) + " s", 220, 692);
  }

  text("PM1            PM2.5              PM4            PM10", 340, 43);



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
  boolean pm1 = SPS_check.getState("PM1");
  boolean pm25 = SPS_check.getState("PM2.5");
  boolean pm4 = SPS_check.getState("PM4");
  boolean pm10 = SPS_check.getState("PM10");
  if (pm1) {
    graph(sps_pm1_data, 0, "Feinstaub PM1 in μg/m³", x_scale, y_scale, true);
    if (pm25) {
      graph(sps_pm25_data, 0, "Feinstaub PM2.5 in μg/m³", x_scale, y_scale, false);
    } else if (pm4) {
      graph(sps_pm4_data, 0, "Feinstaub PM4 in μg/m³", x_scale, y_scale, false);
    } else if (pm10) {
      graph(sps_pm10_data, 0, "Feinstaub PM10 in μg/m³", x_scale, y_scale, false);
    }
  } else if (pm25) {
    graph(sps_pm25_data, 0, "Feinstaub PM2.5 in μg/m³", x_scale, y_scale, true);
    if (pm4) {
      graph(sps_pm4_data, 0, "Feinstaub PM4 in μg/m³", x_scale, y_scale, false);
    } else if (pm10) {
      graph(sps_pm10_data, 0, "Feinstaub PM10 in μg/m³", x_scale, y_scale, false);
    }
  } else if (pm4) {
    graph(sps_pm4_data, 0, "Feinstaub PM4 in μg/m³", x_scale, y_scale, true);
    if (pm10) {
      graph(sps_pm10_data, 0, "Feinstaub PM10 in μg/m³", x_scale, y_scale, false);
    }
  } else if (pm10) {
    graph(sps_pm10_data, 0, "Feinstaub PM10 in μg/m³", x_scale, y_scale, true);
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



boolean station1_ref = false;
boolean station1_tro = false;
boolean station1_nas = false;


void Station1() {
  SPS_check.hide();
  two_three.active = false;
  four.active = false;
  one.active = false;
  settings.active = false;
  up1.hide();
  down1.hide();
  up2.hide();
  down2.hide();
  left1.hide();
  right1.hide();
  reset.hide();
  station1_MessungStarten.hide();

  station1_referenz.show();
  station1_trocken.show();
  station1_nass.show();
  aktualisierung_right.hide();
  aktualisierung_left.hide();


  //Wurden 180 Sekunden gemessen?
  boolean nass_fertig = false;
  boolean trocken_fertig = false;
  boolean referenz_fertig = false;
  for (int i = 0; i < 1000; i++) {
    if (Station1_zeit_nass[i] > 9) {
      nass_fertig = true;
    }
  }
  for (int i = 0; i < 1000; i++) {
    if (Station1_zeit_trocken[i] > 9) {
      trocken_fertig = true;
    }
  }
  for (int i = 0; i < 1000; i++) {
    if (Station1_zeit[i] > 9) {
      referenz_fertig = true;
    }
  }



  if (referenz_fertig) {
    haken(250);
  } else {
    kreuz(300);
  }

  if (trocken_fertig) {
    haken(600);
  } else {
    kreuz(650);
  }
  if (nass_fertig) {
    haken(950);
  } else {
    kreuz(1000);
  }


  if (referenz_fertig && trocken_fertig && nass_fertig) {
    FeinstaubVergleichen.show();
  } else {
    FeinstaubVergleichen.hide();
  }

  fill(0);
  textSize(20);
  text("Station 1 - Feinstaubmessung", 20, 50);
  text("Miss den Feinstaub, der von einem trockenen und einem nassen Tafelschwamm emittiert wird. Führe auch eine Referenzmessung\nohne Schwamm durch. Jede Messung dauert 3 Minuten und setzt sich aus den folgenden Schritten zusammen:", 20, 100);
  text("-30 Sekunden Einlaufzeit\n-1 Minute Messung mit geschlossenem Deckel\n-1 Minute Messung mit geöffnetem Decken\n-30 Sekunden Auslaufzeit", 450, 180);
}


void haken(float x) {
  strokeWeight(5);
  stroke(0, 255, 0);

  line(x, 560, x + 50, 610);
  line(x + 50, 610, x + 100, 510);
  strokeWeight(1);
}


void kreuz(float x) {
  strokeWeight(5);
  stroke(255, 0, 0);
  line(x - 50, 510, x + 50, 610);
  line(x - 50, 610, x + 50, 510);
  strokeWeight(1);
}


void referenzmessung() {
  station1_referenz.hide();
  station1_trocken.hide();
  station1_nass.hide();

  if (Station1Start) {
    station1_MessungStarten.hide();
  } else {
    station1_MessungStarten.show();
  }

  fill(0);
  textSize(20);
  up1.show();
  down1.show();
  up2.show();
  down2.show();
  reset.hide();
  fill(0);
  noStroke();

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
  //Welche Graphen sollen angezeigt werden?
  graph(Station1_PM1, 1, "Feinstaub PM1 in μg/m³", x_scale, y_scale, true);
  fill(0);
}



void trockenerSchwamm() {
  station1_referenz.hide();
  station1_trocken.hide();
  station1_nass.hide();
  if (Station1Start) {
    station1_MessungStarten.hide();
  } else {
    station1_MessungStarten.show();
  }
  fill(0);
  textSize(20);
  up1.show();
  down1.show();
  up2.show();
  down2.show();
  reset.hide();
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
  //Welche Graphen sollen angezeigt werden?
  graph(Station1_PM1_trocken, 2, "Feinstaub PM1 in μg/m³", x_scale, y_scale, true);
  fill(0);
}



void nasserSchwamm() {
  station1_referenz.hide();
  station1_trocken.hide();
  station1_nass.hide();
  if (Station1Start) {
    station1_MessungStarten.hide();
  } else {
    station1_MessungStarten.show();
  }
  fill(0);
  textSize(20);
  up1.show();
  down1.show();
  up2.show();
  down2.show();
  reset.hide();
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
  //Welche Graphen sollen angezeigt werden?
  graph(Station1_PM1_nass, 3, "Feinstaub PM1 in μg/m³", 0, y_scale, true);
}





void Vergleich_Feinstaub() {
  station1_referenz.hide();
  station1_trocken.hide();
  station1_nass.hide();
  station1_MessungStarten.hide();
  fill(0);
  textSize(20);
  up1.show();
  down1.show();
  up2.show();
  down2.show();
  left1.hide();
  right1.hide();
  reset.hide();
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

  //Welche Graphen sollen angezeigt werden?

  graphFeinstaub(Station1_PM1, Station1_PM1_trocken, Station1_PM1_nass, y_scale[0]);
  textSize(20);
  fill(255, 0, 0);
  text("Referenzmessung", 150, 670);
  fill(0, 255, 0);
  text("trockener Schwamm", 550, 670);
  fill(0, 0, 255);
  text("nasser Schwamm", 950, 670);
}


void graphFeinstaub(float[] arr1, float[] arr2, float[] arr3, float y_scale) {
  int sizeArr1 = 0;
  int sizeArr2 = 0;
  int sizeArr3 = 0;
  for (int i = 1; i < 1000; i++) {
    if (arr1[i] != 0) {
      sizeArr1 = i;
    }
    if (arr2[i] != 0) {
      sizeArr2 = i;
    }
    if (arr3[i] != 0) {
      sizeArr3 = i;
    }
  }

  float max = 0;
  float min = 9999999;


  if (y_scale == 0) {
    for (int i = 0; i < sizeArr1; i++) {
      if (arr1[i] > max) {
        max = arr1[i];
      }
      if (arr1[i] < min) {
        min = arr1[i];
      }
    }
    for (int i = 0; i < sizeArr2; i++) {
      if (arr2[i] > max) {
        max = arr2[i];
      }
      if (arr2[i] < min) {
        min = arr2[i];
      }
    }
    for (int i = 0; i < sizeArr3; i++) {
      if (arr3[i] > max) {
        max = arr3[i];
      }
      if (arr3[i] < min) {
        min = arr3[i];
      }
    }
  } else if (y_scale == 1) {
    min = 0;
    max = 10;
  } else if (y_scale == 2) {
    min = 0;
    max = 20;
  } else if (y_scale == 3) {
    min = 0;
    max = 50;
  } else if (y_scale == 4) {
    min = 0;
    max = 200;
  }

  stroke(255, 0, 0);
  for (int i = 0; i < sizeArr1-1; i++) {
    float x_anfang = 0;
    float x_ende = Station1_zeit[sizeArr1-1];
    float x_intervall = x_ende - x_anfang;
    float x1 = 175 + (Station1_zeit[i] - x_anfang)*930/x_intervall;
    float x2 = 175 + (Station1_zeit[i+1] - x_anfang)*930/x_intervall;
    float y1 = 600 - 500*(arr1[i]-min)/(max - min);
    float y2 = 600 - 500*(arr1[i+1] - min)/(max - min);
    if (arr1[i] <= max && arr1[i+1] <= max) {
      line(x1, y1, x2, y2);
    }
  }
  stroke(0, 255, 0);
  for (int i = 0; i < sizeArr2-1; i++) {
    float x_anfang = 0;
    float x_ende = Station1_zeit_trocken[sizeArr2-1];
    float x_intervall = x_ende - x_anfang;
    float x1 = 175 + (Station1_zeit_trocken[i] - x_anfang)*930/x_intervall;
    float x2 = 175 + (Station1_zeit_trocken[i+1] - x_anfang)*930/x_intervall;
    float y1 = 600 - 500*(arr2[i]-min)/(max - min);
    float y2 = 600 - 500*(arr2[i+1] - min)/(max - min);
    if (arr2[i] <= max && arr2[i+1] <= max) {
      line(x1, y1, x2, y2);
    }
  }
  stroke(0, 0, 255);
  for (int i = 0; i < sizeArr3-1; i++) {
    float x_anfang = 0;
    float x_ende = Station1_zeit_nass[sizeArr3-1];
    float x_intervall = x_ende - x_anfang;
    float x1 = 175 + (Station1_zeit_nass[i] - x_anfang)*930/x_intervall;
    float x2 = 175 + (Station1_zeit_nass[i+1] - x_anfang)*930/x_intervall;
    float y1 = 600 - 500*(arr3[i]-min)/(max - min);
    float y2 = 600 - 500*(arr3[i+1] - min)/(max - min);
    if (arr3[i] <= max && arr3[i+1] <= max) {
      line(x1, y1, x2, y2);
    }
  }
}

void Innenraumluft() {
  
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

void MenschSensor() {

}

void Obermenu() {
  two_three.active = false;
  four.active = false;
  one.active = false;
  settings.active = false;
  two.active = false;
  three.active = false;



  image(LMT, 200, 600);
  image(iPhysicsLab, 400, 600);
  image(DBU, 1100, 550);
  image(SFZSLS, 700, 600);
  back.hide();

  Stationen.show();
  Sensoren.show();

  fill(0);
  textSize(30);
  textAlign(CENTER);
  text("Umweltmesstechnik", 640, 50);
}
void SensorAuswahl(){
  back.show();
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

}
void TVOC_eCO2() {
  SGP_check.show();
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
  
  aktualisierung_right.show();
  aktualisierung_left.show();
  fill(0);
  noStroke();
  
  if(del == 0){
  text("Aktualisierungsintervall: Maximum", 220, 692);
  }else{
    text("Aktualisierungsintervall: " + nf(del,0,0) + " s", 220, 692);
  }
  text("TVOC             eCO", 535, 43);
  textSize(14);
  text("2", 710, 52);
  textSize(20);
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
  boolean eco2 = SGP_check.getState("eCO2");
  boolean tvoc = SGP_check.getState("TVOC");

  if (eco2 && tvoc) {
    graph(sgp_eco2_data,0, "eCO2 in ppm", x_scale, y_scale, true);
    graph(sgp_tvoc_data,0, "TVOC in ppb", x_scale, y_scale, false);
  } else if (eco2) {
    graph(sgp_eco2_data,0, "eCO2 in ppm", x_scale, y_scale, true);
  } else if (tvoc) {
    graph(sgp_tvoc_data,0, "TVOC in ppb", x_scale, y_scale, true);
  }


  fill(0);
}

void T_H_CO2() {
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


  aktualisierung_right.show();
  aktualisierung_left.show();
  fill(0);
  noStroke();

  if (del == 0) {
    text("Aktualisierungsintervall: Maximum", 220, 692);
  } else {
    text("Aktualisierungsintervall: " + nf(del, 0, 0) + " s", 220, 692);
  }
  text("Temperatur                          CO             rel. Luftfeuchte", 365, 43);
  textSize(14);
  text("2", 670, 52);
  textSize(20);
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
  onlyTwo2(SCD_check, "T", "H", "CO2");

  boolean t = SCD_check.getState("T");
  boolean co2 = SCD_check.getState("H");
  boolean hum = SCD_check.getState("CO2");

  if (t) {
    graph(scd_temperature_data, 0,"Temperatur in °C", x_scale, y_scale, true);
    if (hum) {
      graph(scd_humidity_data,0, "relative Luftfeuchte in %", x_scale, y_scale, false);
    } else if (co2) {
      graph(scd_co2_data,0, "CO2 in ppm", x_scale, y_scale, false);
    }
  } else if (hum) {
    graph(scd_humidity_data,0, "relative Luftfeuchte in %", x_scale, y_scale, true);
    if (co2) {
      graph(scd_co2_data, 0,"CO2 in ppm", x_scale, y_scale, false);
    }
  } else if (co2) {
    graph(scd_co2_data,0, "CO2 in ppm", x_scale, y_scale, true);
  }

  fill(0);
}

void checkConnection() {

  //Kommt auf das Aktualisierungsintervall an. Wenn del == 0 --> vergleiche 10 Werte. Ansonsten 1-3
  if (del == 0) {
    if (index > 10) {
      //SCD30
      boolean scd_connected = false;
      if (scd_temperature_data[index - 10] != scd_temperature_data[index-1] || scd_temperature_data[index - 10] != scd_temperature_data[index - 5]) {
        scd_connected = true;
      }

      connected[0] = scd_connected;

      //SGP
      boolean sgp_connected = false;

      if (sgp_tvoc_data[index - 10] != sgp_tvoc_data[index-1] || sgp_tvoc_data[index - 10] != sgp_tvoc_data[index - 5]) {
        sgp_connected = true;
      }
      connected[1] = sgp_connected;

      //SPS
      boolean sps_connected = false;

      if (sps_pm10_data[index - 10] != sps_pm10_data[index-1] || sps_pm10_data[index - 10] != sps_pm10_data[index - 5]) {
        sps_connected = true;
      }
      connected[2] = sps_connected;
    }
  } else {
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


boolean[] connected = {false, false, false};


void hauptmenu() {
  stroke(0);
  one.show();
  two_three.show();
  four.show();
  settings.show();
  
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
    
    
    noStroke();
    fill(0);
    textSize(20);
    text("Station 2 - Mensch vs. Sensor", 880, 70);
    text("Wie gut ist deine Nase? Finde es heraus\nund tritt gegen einen Sensor an.\nOrdne 5 verschiedene Ethanolkonzen-\ntrationen der Größe nach an.", 880, 120);
    text("Station 3 - TVOC-Duelle", 880, 300);
    text("Coole Beschreibung für das Experiment", 880, 350);
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
