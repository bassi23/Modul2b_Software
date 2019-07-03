PImage sps, sgp, scd, nodemcu, DBU, iPhysicsLab, LMT, SFZSLS, SUSmobil;

PImage Stoff1_bild, Stoff2_bild, Stoff3_bild, Stoff4_bild, Stoff5_bild, Stoff6_bild, Stoff7_bild, Stoff8_bild, Stoff9_bild, Stoff10_bild;
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


button TVOC_Duelle_Start, naechstes_Duell, vorheriges_Duell, weiter_zum_Sensor, naechster_Stoff, vorheriger_Stoff, zur_Auswertung;

button Sensormessung, messen, letzteWiederholen, ja_zufrieden;
Probe A, B, C, D, E;


TVOC_Kandidat Stoff1, Stoff2, Stoff3, Stoff4, Stoff5, Stoff6, Stoff7, Stoff8, Stoff9, Stoff10;

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

  station1_MessungStarten = new button(530, 650, 220, 50, "Messung starten", 5, true, 20);
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

  //
  Stoff1_bild = loadImage("/img/Stoff1.png");
  Stoff2_bild = loadImage("/img/Stoff2.png");
  Stoff3_bild = loadImage("/img/Stoff3.png");
  Stoff4_bild = loadImage("/img/Stoff4.png");
  Stoff5_bild = loadImage("/img/Stoff5.png");
  Stoff6_bild = loadImage("/img/Stoff6.png");
  Stoff7_bild = loadImage("/img/Stoff7.png");
  Stoff8_bild = loadImage("/img/Stoff8.png");
  Stoff9_bild = loadImage("/img/Stoff9.png");
  Stoff10_bild = loadImage("/img/Stoff10.png");

  //


  one = new station(50, 50, false);
  two_three = new station(450, 50, false);
  two = new station(200, 200, false);
  three = new station(650, 200, false);
  four = new station(50, 350, false);
  settings = new station(450, 350, false);



  A = new Probe(510, 550, "A", true, false);
  B = new Probe(640, 550, "B", true, false);
  C = new Probe(770, 550, "C", true, false);
  D = new Probe(575, 660, "D", true, false);
  E = new Probe(705, 660, "E", true, false);

  Sensormessung = new button(540, 500, 200, 100, "Sensormessung", 5, true, 20);
  messen = new button(875, 70, 150, 100, "Messen", 5, true, 20);
  letzteWiederholen = new button(1050, 70, 150, 100, "letzte Messung\nwiederholen", -15, true, 20);
  ja_zufrieden = new button(400, 70, 150, 100, "Ja", 5, true, 20);



  TVOC_Duelle_Start = new button(565, 400, 150, 100, "Start", 5, true, 20);
  Stoff1 = new TVOC_Kandidat(640, 360, Stoff1_bild, "Stoff 1");
  Stoff2 = new TVOC_Kandidat(640, 600, Stoff2_bild, "Stoff 2");
  Stoff3 = new TVOC_Kandidat(640, 360, Stoff3_bild, "Stoff 3");
  Stoff4 = new TVOC_Kandidat(640, 600, Stoff4_bild, "Stoff 4");
  Stoff5 = new TVOC_Kandidat(640, 360, Stoff5_bild, "Stoff 5");
  Stoff6 = new TVOC_Kandidat(640, 600, Stoff6_bild, "Stoff 6");
  Stoff7 = new TVOC_Kandidat(640, 360, Stoff7_bild, "Stoff 7");
  Stoff8 = new TVOC_Kandidat(640, 600, Stoff8_bild, "Stoff 8");
  Stoff9 = new TVOC_Kandidat(640, 360, Stoff9_bild, "Stoff 9");
  Stoff10 = new TVOC_Kandidat(640, 600, Stoff10_bild, "Stoff 10");

  naechstes_Duell = new button(1125, 200, 150, 75, "Nächstes\nDuell", -12, true, 20);
  naechster_Stoff = new button(1125, 150, 150, 75, "Nächster\nStoff", -12, true, 20);
  vorheriges_Duell = new button(1125, 280, 150, 75, "Vorheriges\nDuell", -12, true, 20);
  vorheriger_Stoff = new button(1125, 230, 150, 75, "Vorheriger\nStoff", -12, true, 20);
  weiter_zum_Sensor = new button(1020, 640, 150, 75, "Sensor-\nmessung", -12, true, 20);

  zur_Auswertung = new button(1125, 580, 150, 75, "Zur Aus-\nwertung", -12, true, 20);

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

  // dateiformat.activate("csv");

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
  TVOC_Duelle_Start.hide();
  Sensormessung.hide();

  zumObermenu.x = 1100;

  if (page != -2) {
    SPS30.hide();
    SGP30.hide();
    SCD30.hide();
  }
  if (page != -1) {
    Stationen.hide();
    Sensoren.hide();
  }

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
      delay(200);
      page = 1;
    }
    if (two_three.isClicked()) {
      delay(200);
      page = 2.5;
    }
    if (two.isClicked()) {
      delay(200);
      page = 2;
    }
    if (three.isClicked()) {
      delay(200);
      page = 3;
    }
    if (four.isClicked()) {
      delay(200);
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
  } else if (page == 1.1111) {
    Vergleich_Feinstaub();
  } else if (page == 2) {
    MenschSensor();
    zumObermenu.hide();
  } else if (page == 2.1) {
    Station2_Sensor();
  } else if (page == 2.11) {
    Station2_Vergleich();
  } else if (page == 2.5) {
    Station2Oder3();
    zumObermenu.hide();
    two.active = true;
    three.active = true;
  } else if (page == 3) {
    TVOC_Duelle();
    zumObermenu.hide();
  } else if (page == 3.1) {
    TVOC_Duelle_Riechen();
  } else if (page == 3.11) {
    TVOC_Duelle_Messen();
  } else if (page == 3.111) {
    Auswertung_Station3();
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
      } else if (page == 2.1) {
        prob = 0;
        page = 2;
      } else if (page == 2.11) {
        page = 2.1;
      } else if (page == 3.1) {
        page = 3;
      } else if (page == 3.11) {
        page = 3.1;
      } else if (page == 3.111) {
        page = 3.11;
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
  if (FeinstaubVergleichen.isClicked() && page == 1) {
    page = 1.1111;
  }

  if (Sensormessung.isClicked()) {
    page = 2.1;
    MesswertSensor[0] = 0;
    MesswertSensor[1] = 0;
    MesswertSensor[2] = 0;
    MesswertSensor[3] = 0;
    MesswertSensor[4] = 0;
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

        if (MenschSensorMessen && page == 2.1) {
          if (index > 2 && prob > 0) {
           
            MenschSensorMesswerte[prob-1][indexMenschSensor] = sgp_tvoc_data[index-2];
            indexMenschSensor += 1;
          }
        }


        if (Station1Start) {
          if (page == 1.1) {// referenzmessung
            Station1_PM1[indexStation1] = sps_pm1_data[index-2];
            Station1_PM25[indexStation1] = sps_pm25_data[index-2];
            Station1_PM4[indexStation1] = sps_pm4_data[index-2];
            Station1_PM10[indexStation1] = sps_pm10_data[index-2];
            Station1_zeit[indexStation1] = (millis() - zeroTime3)/1000;
            if (Station1_zeit[indexStation1] > 179) {
              Station1Start = false;
            }
            indexStation1 += 1;
          } else if (page == 1.11) { // trockener Schwamm

            Station1_PM1_trocken[indexStation1_trocken] = sps_pm1_data[index-2];
            Station1_PM25_trocken[indexStation1_trocken] = sps_pm25_data[index-2];
            Station1_PM4_trocken[indexStation1_trocken] = sps_pm4_data[index-2];
            Station1_PM10_trocken[indexStation1_trocken] = sps_pm10_data[index-2];
            Station1_zeit_trocken[indexStation1_trocken] = (millis() - zeroTime4)/1000;
            if (Station1_zeit_trocken[indexStation1_trocken] > 179) {
              Station1Start = false;
            }
            indexStation1_trocken += 1;
          } else if (page == 1.111) {// nasser Schwamm

            Station1_PM1_nass[indexStation1_nass] = sps_pm1_data[index-2];
            Station1_PM25_nass[indexStation1_nass] = sps_pm25_data[index-2];
            Station1_PM4_nass[indexStation1_nass] = sps_pm4_data[index-2];
            Station1_PM10_nass[indexStation1_nass] = sps_pm10_data[index-2];
            Station1_zeit_nass[indexStation1_nass] = (millis() - zeroTime5)/1000;
            if (Station1_zeit_nass[indexStation1_nass] > 179) {
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
    if (Station1_zeit_nass[i] > 179) {
      nass_fertig = true;
    }
  }
  for (int i = 0; i < 1000; i++) {
    if (Station1_zeit_trocken[i] > 179) {
      trocken_fertig = true;
    }
  }
  for (int i = 0; i < 1000; i++) {
    if (Station1_zeit[i] > 179) {
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
  SPS_check.show();
  station1_referenz.hide();
  station1_trocken.hide();
  station1_nass.hide();
  text("PM1            PM2.5              PM4            PM10", 340, 43);
  onlyTwo(SPS_check, "PM1", "PM2.5", "PM4", "PM10");  //Sorgt dafür, dass man nur zwei Sachen gleichzeitig auswählen kann
  //Welche Graphen sollen angezeigt werden?
  boolean pm1 = SPS_check.getState("PM1");
  boolean pm25 = SPS_check.getState("PM2.5");
  boolean pm4 = SPS_check.getState("PM4");
  boolean pm10 = SPS_check.getState("PM10");
  if (Station1Start) {
    station1_MessungStarten.hide();
  } else {
    station1_MessungStarten.show();
  }

  fill(0);
  textSize(20);
  up1.show();
  down1.show();
  down2.show();
  up2.show();
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
  if (pm1) {
    graph(Station1_PM1, 1, "Feinstaub PM1 in μg/m³", x_scale, y_scale, true);
    if (pm25) {
      graph(Station1_PM25, 1, "Feinstaub PM2.5 in μg/m³", x_scale, y_scale, false);
    } else if (pm4) {
      graph(Station1_PM4, 1, "Feinstaub PM4 in μg/m³", x_scale, y_scale, false);
    } else if (pm10) {
      graph(Station1_PM10, 1, "Feinstaub PM10 in μg/m³", x_scale, y_scale, false);
    }
  } else if (pm25) {
    graph(Station1_PM25, 1, "Feinstaub PM2.5 in μg/m³", x_scale, y_scale, true);
    if (pm4) {
      graph(Station1_PM4, 1, "Feinstaub PM4 in μg/m³", x_scale, y_scale, false);
    } else if (pm10) {
      graph(Station1_PM10, 1, "Feinstaub PM10 in μg/m³", x_scale, y_scale, false);
    }
  } else if (pm4) {
    graph(Station1_PM4, 1, "Feinstaub PM4 in μg/m³", x_scale, y_scale, true);
    if (pm10) {
      graph(Station1_PM10, 1, "Feinstaub PM10 in μg/m³", x_scale, y_scale, false);
    }
  } else if (pm10) {
    graph(Station1_PM10, 1, "Feinstaub PM10 in μg/m³", x_scale, y_scale, true);
  }
  fill(0);
}



void trockenerSchwamm() {
  SPS_check.show();
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
  text("PM1            PM2.5              PM4            PM10", 340, 43);
  onlyTwo(SPS_check, "PM1", "PM2.5", "PM4", "PM10");  //Sorgt dafür, dass man nur zwei Sachen gleichzeitig auswählen kann
  //Welche Graphen sollen angezeigt werden?
  boolean pm1 = SPS_check.getState("PM1");
  boolean pm25 = SPS_check.getState("PM2.5");
  boolean pm4 = SPS_check.getState("PM4");
  boolean pm10 = SPS_check.getState("PM10");
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
  if (pm1) {
    graph(Station1_PM1_trocken, 2, "Feinstaub PM1 in μg/m³", x_scale, y_scale, true);
    if (pm25) {
      graph(Station1_PM25_trocken, 2, "Feinstaub PM2.5 in μg/m³", x_scale, y_scale, false);
    } else if (pm4) {
      graph(Station1_PM4_trocken, 2, "Feinstaub PM4 in μg/m³", x_scale, y_scale, false);
    } else if (pm10) {
      graph(Station1_PM10_trocken, 2, "Feinstaub PM10 in μg/m³", x_scale, y_scale, false);
    }
  } else if (pm25) {
    graph(Station1_PM25_trocken, 2, "Feinstaub PM2.5 in μg/m³", x_scale, y_scale, true);
    if (pm4) {
      graph(Station1_PM4_trocken, 2, "Feinstaub PM4 in μg/m³", x_scale, y_scale, false);
    } else if (pm10) {
      graph(Station1_PM10_trocken, 2, "Feinstaub PM10 in μg/m³", x_scale, y_scale, false);
    }
  } else if (pm4) {
    graph(Station1_PM4_trocken, 2, "Feinstaub PM4 in μg/m³", x_scale, y_scale, true);
    if (pm10) {
      graph(Station1_PM10_trocken, 2, "Feinstaub PM10 in μg/m³", x_scale, y_scale, false);
    }
  } else if (pm10) {
    graph(Station1_PM10_trocken, 2, "Feinstaub PM10 in μg/m³", x_scale, y_scale, true);
  }
  fill(0);
}



void nasserSchwamm() {
  SPS_check.show();
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
  text("PM1            PM2.5              PM4            PM10", 340, 43);
  onlyTwo(SPS_check, "PM1", "PM2.5", "PM4", "PM10");  //Sorgt dafür, dass man nur zwei Sachen gleichzeitig auswählen kann
  //Welche Graphen sollen angezeigt werden?
  boolean pm1 = SPS_check.getState("PM1");
  boolean pm25 = SPS_check.getState("PM2.5");
  boolean pm4 = SPS_check.getState("PM4");
  boolean pm10 = SPS_check.getState("PM10");
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
  if (pm1) {
    graph(Station1_PM1_nass, 3, "Feinstaub PM1 in μg/m³", x_scale, y_scale, true);
    if (pm25) {
      graph(Station1_PM25_nass, 3, "Feinstaub PM2.5 in μg/m³", x_scale, y_scale, false);
    } else if (pm4) {
      graph(Station1_PM4_nass, 3, "Feinstaub PM4 in μg/m³", x_scale, y_scale, false);
    } else if (pm10) {
      graph(Station1_PM10_nass, 3, "Feinstaub PM10 in μg/m³", x_scale, y_scale, false);
    }
  } else if (pm25) {
    graph(Station1_PM25_nass, 3, "Feinstaub PM2.5 in μg/m³", x_scale, y_scale, true);
    if (pm4) {
      graph(Station1_PM4_nass, 3, "Feinstaub PM4 in μg/m³", x_scale, y_scale, false);
    } else if (pm10) {
      graph(Station1_PM10_nass, 3, "Feinstaub PM10 in μg/m³", x_scale, y_scale, false);
    }
  } else if (pm4) {
    graph(Station1_PM4_nass, 3, "Feinstaub PM4 in μg/m³", x_scale, y_scale, true);
    if (pm10) {
      graph(Station1_PM10_nass, 3, "Feinstaub PM10 in μg/m³", x_scale, y_scale, false);
    }
  } else if (pm10) {
    graph(Station1_PM10_nass, 3, "Feinstaub PM10 in μg/m³", x_scale, y_scale, true);
  }
}





void Vergleich_Feinstaub() {
  SPS_check.show();
  station1_referenz.hide();
  station1_trocken.hide();
  station1_nass.hide();
  station1_MessungStarten.hide();
  fill(0);
  textSize(20);
  up1.show();
  down1.show();
  left1.hide();
  right1.hide();
  reset.hide();

  text("PM1            PM2.5              PM4            PM10", 340, 43);
  onlyOne(SPS_check, "PM1", "PM2.5", "PM4", "PM10");  //Sorgt dafür, dass man nur zwei Sachen gleichzeitig auswählen kann
  //Welche Graphen sollen angezeigt werden?
  boolean pm1 = SPS_check.getState("PM1");
  boolean pm25 = SPS_check.getState("PM2.5");
  boolean pm4 = SPS_check.getState("PM4");
  boolean pm10 = SPS_check.getState("PM10");
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


  if (pm1) {
    graphFeinstaub(Station1_PM1, Station1_PM1_trocken, Station1_PM1_nass, y_scale[0]);
  } else if (pm25) {
    graphFeinstaub(Station1_PM25, Station1_PM25_trocken, Station1_PM25_nass, y_scale[0]);
  } else if (pm4) {
    graphFeinstaub(Station1_PM4, Station1_PM4_trocken, Station1_PM4_nass, y_scale[0]);
  } else if (pm10) {
    graphFeinstaub(Station1_PM10, Station1_PM10_trocken, Station1_PM10_nass, y_scale[0]);
  }
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

  float pos_x = 0;
  float y = y_scale;

  pos_x = 135;
  fill(0);
  if (y == 1) {
    text("2", pos_x, 507);
    text("4", pos_x, 407);
    text("6", pos_x, 307);
    text("8", pos_x, 207);
  } else if (y == 2) {
    text("4", pos_x, 507);
    text("8", pos_x, 407);
    text("12", pos_x, 307);
    text("16", pos_x, 207);
  } else if (y == 3) {
    text("10", pos_x, 507);
    text("20", pos_x, 407);
    text("30", pos_x, 307);
    text("40", pos_x, 207);
  } else if (y == 4) {
    text("40", pos_x, 507);
    text("80", pos_x, 407);
    text("120", pos_x, 307);
    text("160", pos_x, 207);
  }
  if (y == 0) {
    text(nf(min, 0, 1), 135, 600);
    text(nf(max, 0, 1), 135, 100);
  } else {
    text(nf(min, 0, 0), 135, 600);
    text(nf(max, 0, 0), 135, 100);
  }
  pushMatrix();
  translate(width/2, height/2);
  rotate(3*PI/2);
  text("Feinstaub in μg/m³", -50, -575);
  popMatrix();
  text("0", 150, 640);
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


void onlyOne(CheckBox check, String state1, String state2, String state3, String state4) {
  boolean st1 = check.getState(state1);
  boolean st2 = check.getState(state2);
  boolean st3 = check.getState(state3);
  boolean st4 = check.getState(state4);
  if (st1) {
    check.deactivate(state2);
    check.deactivate(state3);
    check.deactivate(state4);
  }
  if (st2) {
    check.deactivate(state1);
    check.deactivate(state3);
    check.deactivate(state4);
  }
  if (st3) {
    check.deactivate(state1);
    check.deactivate(state2);
    check.deactivate(state4);
  }
  if (st4) {
    check.deactivate(state1);
    check.deactivate(state2);
    check.deactivate(state3);
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

String[] Reihenfolge = {"A", "B", "C", "D", "E"};
String[] Reihenfolge_Sensor = {"A", "B", "C", "D", "E"};
float[] Position = {0, 0, 0, 0, 0};

void MenschSensor() {
  one.active = false;
  two.active = false;
  three.active = false;
  four.active = false;
  two_three.active = false;
  onlyOneProbe();
  fill(0);
  textSize(20);
  text("Station 2 - Mensch vs. Sensor", 20, 50);
  text("Nimm dir die 5 Proben des verdünnten Ethanols und rieche daran. Ordne sie der Konzentration nach und notiere dir dir Reihen-\nfolge.\n\nKlicke anschließend auf 'Sensormessung' und lasse den Sensor an den Proben 'riechen'.", 20, 100);
  stroke(0);
  line(0, 200, 1280, 200);


  noStroke();
  textSize(30);
  text("Konzentration in Probe", 490, 300);
  reihenfolge();
  fill(0);
  textSize(40);
  for (int i = 0; i < 4; i++) {
    text(">", 415 + 150*i, 410);
  }
  fill(255);
  for (int i = 0; i < 5; i++) {
    rect(300 + 150*i, 350, 110, 100);
  }
  A.show();
  B.show();
  C.show();
  D.show();
  E.show();
  if (A.inPlace && B.inPlace && C.inPlace && D.inPlace && E.inPlace) {
    Sensormessung.show();
  } else {
    Sensormessung.hide();
  }
}



class Probe {
  float x;
  float y;
  String text;
  boolean active;
  boolean inPlace;
  Probe(float x_, float y_, String text_, boolean active_, boolean inPlace_) {
    x = x_;
    y = y_;
    text = text_;
    active = active_;
    inPlace = inPlace_;
  }
  void show() {
    fill(200);
    stroke(0);
    rect(x-50, y - 50, 100, 100);
    fill(0);
    text(text, x-15, y+15);
    if (this.y > 350 && this.y < 450 && this.x > 300 && this.x < 1000) {
      this.inPlace = true;
    } else {
      this.inPlace = false;
    }
    if (this.isOver() && mousePressed && this.active) {
      this.x = mouseX;
      this.y = mouseY;
    }
  }
  void hide() {
    this.active = false;
    this.inPlace = true;
  }
  boolean isOver() {
    if (mouseX > x - 50 && mouseX  < x + 50 && mouseY > y - 50 && mouseY < y + 50) {
      this.active = true;
      onlyOneProbe();
      return true;
    } else {
      this.active = false;
      onlyOneProbe();
      return false;
    }
  }
  float compareTo(Object o) {
    Probe e = (Probe)o;
    if (x < e.x) {
      return -1;
    } else {
      return 1;
    }
  }
}


void onlyOneProbe() {
  if (A.active) {
    B.active = false; 
    C.active = false; 
    D.active = false; 
    E.active = false;
  }
  if (B.active) {
    A.active = false;
    C.active = false; 
    D.active = false; 
    E.active = false;
  }
  if (C.active) {
    A.active = false;
    B.active = false;
    D.active = false; 
    E.active = false;
  } 

  if (D.active) {
    A.active = false;
    B.active = false;
    C.active = false; 
    E.active = false;
  }
  if (E.active) {
    A.active = false;
    B.active = false;
    C.active = false; 
    D.active = false;
  }
}



void reihenfolge() {
  Position[0] = A.x;
  Position[1] = B.x;
  Position[2] = C.x;
  Position[3] = D.x;
  Position[4] = E.x;
  Position = sort(Position);
  for (int i = 0; i < 5; i++) {
    if (Position[i] == A.x) {
      Reihenfolge[i] = "A";
    }
    if (Position[i] == B.x) {
      Reihenfolge[i] = "B";
    }
    if (Position[i] == C.x) {
      Reihenfolge[i] = "C";
    }
    if (Position[i] == D.x) {
      Reihenfolge[i] = "D";
    }
    if (Position[i] == E.x) {
      Reihenfolge[i] = "E";
    }
  }
}


float[] MesswertSensor = {0, 0, 0, 0, 0};
float[] MesswertSensor2 = {0, 0, 0, 0, 0};
float currentTime = 0;
int prob = 0;

float[][] MenschSensorMesswerte = new float[5][500];
int indexMenschSensorMax = 0;

int indexMenschSensor = 0;
boolean MenschSensorMessen = false;

void Station2_Sensor() {
  A.hide();
  B.hide();
  C.hide();
  D.hide();
  E.hide();

  textSize(20);
  text("Deine Reihenfolge: " + Reihenfolge[0] + " > " + Reihenfolge[1] + " > " + Reihenfolge[2] + " > " +Reihenfolge[3] + " > " +Reihenfolge[4], 50, 50);
  String temp = "A";
  if (prob == 1) {
    temp = "B";
  } else if (prob == 2) {
    temp = "C";
  } else if (prob == 3) {
    temp = "D";
  } else if (prob == 4) {
    temp = "E";
  }
  textSize(25);
  if ((millis() - currentTime)/1000 > 60 && page == 2.1) {
    MenschSensorMessen = false;
    if (prob != 5) {
      text("Schraube Probe " + temp + " an die Platine und klicke anschließend auf 'Messen'.", 20, 120);
      messen.show();
    }
    letzteWiederholen.show();
  } else {
    messen.hide();
    letzteWiederholen.hide();
  }

  if (messen.isClicked()) {
    currentTime = millis();
    indexMenschSensor = 0;
    MenschSensorMessen = true;
    if (prob < 5) {
      prob += 1;
    }
  }


  if (MenschSensorMessen) {
    if (prob == 1) {
      MesswertSensor[0] = 0;
      for (int i = 0; i < indexMenschSensor; i++) {
        MesswertSensor[0] += MenschSensorMesswerte[0][i];
      }
      MesswertSensor[0] = MesswertSensor[0]/indexMenschSensor;
    } else if (prob == 2) {
      MesswertSensor[1] = 0;
      for (int i = 0; i < indexMenschSensor; i++) {
        MesswertSensor[1] += MenschSensorMesswerte[1][i];
      }
      MesswertSensor[1] = MesswertSensor[1]/indexMenschSensor;
    } else if (prob == 3) {
      MesswertSensor[2] = 0;
      for (int i = 0; i < indexMenschSensor; i++) {
        MesswertSensor[2] += MenschSensorMesswerte[2][i];
      }
      MesswertSensor[2] = MesswertSensor[2]/indexMenschSensor;
    } else if (prob == 4) {
      MesswertSensor[3] = 0;
      for (int i = 0; i < indexMenschSensor; i++) {
        MesswertSensor[3] += MenschSensorMesswerte[3][i];
      }
      MesswertSensor[3] = MesswertSensor[3]/indexMenschSensor;
    } else if (prob == 5) {
      MesswertSensor[4] = 0;
      for (int i = 0; i < indexMenschSensor; i++) {
        MesswertSensor[4] += MenschSensorMesswerte[4][i];
      }
      MesswertSensor[4] = MesswertSensor[4]/indexMenschSensor;
    }
  }
  if (letzteWiederholen.isClicked()) {
    if (prob > 0) {
      MenschSensorMessen = true;
      indexMenschSensorMax = 0;
      currentTime = millis();
    }
  }
  if (prob == 5) {
    messen.hide();
    if ((millis() - currentTime)/1000 > 60) {
      text("Bist du mit der Messung zufrieden?", 20, 120);
      ja_zufrieden.show();
      messen.hide();
    }
  } else {
    ja_zufrieden.hide();
  }
  textSize(25);

  fill(255);
  stroke(0);
  rect(10, 240, 440, 310);
  rect(500, 190, 700, 400);
  fill(0);
  for (int i = 0; i < 5; i++) {
    text(nf(MesswertSensor[i], 0, 1), 270, 335 + 50*i);
  }
  text("A", 60, 335);
  text("B", 60, 385);
  text("C", 60, 435);
  text("D", 60, 485);
  text("E", 60, 535);

  text("Probe", 40, 290); 
  text("   Durchschnittliche\nKonzentration in ppb", 150, 265);
  text("Zeit in Sekunden", 750, 630);
  if (prob == 1) {
    if ((millis() - currentTime)/1000 < 60) {
      text(nf((millis() - currentTime)/1000, 0, 1), 1200, 630);
    } else {
      text("60", 1200, 630);
    }
  } else {
    text("60", 1200, 630);
  }
  stroke(0);
  line(10, 310, 450, 310);
  line(130, 240, 130, 550);

  float max = 0;
  for (int i = 0; i < 500; i++) {
    for (int j = 0; j < 5; j++) {
      if ( MenschSensorMesswerte[j][i] > max) {
        max = MenschSensorMesswerte[j][i];
      }
    }
  }
  noStroke();
  text(nf(max, 0, 1), 470, 180);
  text("0", 470, 590);

  for (int i = 0; i < 5; i++) {
    for (int j = 0; j < 500; j++) {
      if (MenschSensorMesswerte[i][j] != 0 && j > indexMenschSensorMax) {
        indexMenschSensorMax = j + 1;
      }
    }
  }
  strokeWeight(4);
  for (int j = 0; j < 5; j++) {
    for (int i = 1; i < indexMenschSensorMax; i++) {
      float x1 = 500 + i*700/(indexMenschSensorMax-1); 
      float x2 = 500 + (i-1)*700/(indexMenschSensorMax-1);
      float y1 = 590 - MenschSensorMesswerte[j][i]*400/max;
      float y2 = 590 - MenschSensorMesswerte[j][i-1]*400/max;
      if (j == 0) {
        stroke(255, 0, 0);
      } else if (j == 1) {
        stroke(0, 0, 255);
      } else if (j == 2) {
        stroke(255, 0, 255);
      } else if (j == 3) {
        stroke(0, 155, 0);
      } else if (j == 4) {
        stroke(0);
      }
      line(x1, y1, x2, y2);
    }
  }

  if (ja_zufrieden.isClicked()) {
    page = 2.11;
  }
  strokeWeight(1);
}



void  Station2_Vergleich() {
  ja_zufrieden.hide();
  messen.hide();
  letzteWiederholen.hide();

  MesswertSensor2[0] = MesswertSensor[0];
  MesswertSensor2[1] = MesswertSensor[1];
  MesswertSensor2[2] = MesswertSensor[2];
  MesswertSensor2[3] = MesswertSensor[3];
  MesswertSensor2[4] = MesswertSensor[4];
  MesswertSensor2 = sort(MesswertSensor2);
  for (int i = 0; i < 5; i++) {
    if (MesswertSensor2[i] == MesswertSensor[0]) {
      Reihenfolge_Sensor[i] = "A";
    }
    if (MesswertSensor2[i] == MesswertSensor[1]) {
      Reihenfolge_Sensor[i] = "B";
    }
    if (MesswertSensor2[i] == MesswertSensor[2]) {
      Reihenfolge_Sensor[i] = "C";
    }
    if (MesswertSensor2[i] == MesswertSensor[3]) {
      Reihenfolge_Sensor[i] = "D";
    }
    if (MesswertSensor2[i] == MesswertSensor[4]) {
      Reihenfolge_Sensor[i] = "E";
    }
  }

  textSize(20);
  text("Hier siehst du die Vorhersage deiner Nase und des Sensors. Vergleiche die Ergebnisse nun mit den wahren Werten. Konntest du\ngegen den Sensor gewinnen?", 20, 100);


  stroke(0);
  line(100, 300, 1180, 300);
  line(100, 400, 1180, 400);
  line(100, 500, 1180, 500);

  for (int i = -1; i < 6; i++) {
    line(280 + 180*i, 300, 280 + 180*i, 500);
  }
  textSize(25);
  text("hohe Konzentration                                           niedrige Konzentration", 300, 250);
  textSize(30);
  text("    Deine\nReihenfolge", 106, 333);
  text("Sensor", 140, 460);
  textSize(50);
  text(Reihenfolge[0] + "         " + Reihenfolge[1] + "          " + Reihenfolge[2] + "         " +Reihenfolge[3] + "         " +Reihenfolge[4], 350, 365);
  text(Reihenfolge_Sensor[0] + "         " + Reihenfolge_Sensor[1] + "          " + Reihenfolge_Sensor[2] + "         " +Reihenfolge_Sensor[3] + "         " +Reihenfolge_Sensor[4], 350, 465);
  zumObermenu.x = 1000;
  zumObermenu.show();
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
  two.active = false;
  three.active = false;
  Sensormessung.visible = false;
  textSize(20);
  fill(0);
  text("Station 3 - TVOC-Duelle", 20, 50);
  text("Vergleiche verschiedene Materialien auf die Ausdünstung von flüchtigen organischen Verbindungen (TVOC). Welche Stoffe\nemittieren am meisten? Gib zuvor eine Prognose ab, indem du an den Stoffen riechst.", 20, 100);
  stroke(0);
  line(0, 180, 1280, 180);
  noStroke();
  text("a) Riechen\nOrdne die Emission der folgenden Stoffe auf der unteren Skala an!", 20, 220); 
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
  text("Station 3 - TVOC-Duelle", 20, 50);
  text("Vergleiche verschiedene Materialien auf die Ausdünstung von flüchtigen organischen Verbindungen (TVOC). Welche Stoffe\nemittieren am meisten? Gib zuvor eine Prognose ab, indem du an den Stoffen riechst.", 20, 100);
  stroke(0);
  line(0, 180, 1280, 180);
  noStroke();
  text("a) Riechen\nOrdne die Emission der folgenden Stoffe auf der unteren Skala an!", 20, 220); 
  text("Wenig Emission", 50, 480);
  text("Viel Emission", 1050, 480);
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

  tvoc_duelle_werte_mensch[0] = 10*(Stoff1.x - 240)/800;
  tvoc_duelle_werte_mensch[1] = 10*(Stoff2.x- 240)/800;
  tvoc_duelle_werte_mensch[2] = 10*(Stoff3.x- 240)/800;
  tvoc_duelle_werte_mensch[3] = 10*(Stoff4.x- 240)/800;
  tvoc_duelle_werte_mensch[4] = 10*(Stoff5.x- 240)/800;
  tvoc_duelle_werte_mensch[5] = 10*(Stoff6.x- 240)/800;
  tvoc_duelle_werte_mensch[6] = 10*(Stoff7.x- 240)/800;
  tvoc_duelle_werte_mensch[7] = 10*(Stoff8.x- 240)/800;
  tvoc_duelle_werte_mensch[8] = 10*(Stoff9.x- 240)/800;
  tvoc_duelle_werte_mensch[9] = 10*(Stoff10.x- 240)/800;
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
    textAlign(CORNER);

    if (mouseX > (x - image.width/2) && mouseX < (x + image.width/2) && mouseY > (y - image.height/2) && mouseY < (y + image.height/2) && mousePressed && mouseX > 240 && mouseX < 1040) {
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
  text("b) Messen\nMiss nun die verschiedenen Stoffe, indem du sie in die Gläser legst und unter den Sensor schraubst. Vergleiche die Messwerte\nmit deiner Vorhersage.", 20, 50);


  text("Miss die Emission von Stoff " + tvoc_stoff +". Warte dabei bis sich ein Gleichgewicht eingestellt hat.", 20, 150);

  text("Deine Einschätzung", 20, 200);


  text("Messung des\nSensors", 20, 450);
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
  text("TVOC - Emission", 570, 50);
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
    text(nf(tvoc_duelle_werte_sensor[i], 0, 1), 540, 160 + 60*i); 
    text(nf(tvoc_duelle_werte_sensor[i+1], 0, 1), 740, 160 + 60*i);
  }
  textAlign(CORNER);
  text("Deine Vorhersage", 150, 110);
  text("Sensor", 190, 160);

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
