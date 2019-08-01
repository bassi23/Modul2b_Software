PImage sps, sgp, scd, nodemcu, DBU, iPhysicsLab, LMT, SFZSLS, SUSmobil, hintergrund;

PImage Stoff1_bild, Stoff2_bild, Stoff3_bild, Stoff4_bild, Stoff5_bild, Stoff6_bild, Stoff7_bild, Stoff8_bild, Stoff9_bild, Stoff10_bild;
import processing.serial.*;
import controlP5.*;
Serial myPort;


Table table;

ControlP5 SPS_control, SGP_control, SCD_control, autosave_control, dateiformat_control, innenraumluft_control;
CheckBox SPS_check, SGP_check, SCD_check, autosave, dateiformat, innenraumluft;

station one, two_three, two, three, four, settings;
button back, up1, down1, up2, down2, left1, right1;

button reset, sicher_ja, sicher_nein;
button aktualisierung_right, aktualisierung_left;

button Stationen, Sensoren, zumObermenu;
button SPS30, SGP30, SCD30;
button einstellungen;

button station1_referenz, station1_trocken, station1_nass, station1_MessungStarten, FeinstaubVergleichen;


button TVOC_Duelle_Start, naechstes_Duell, vorheriges_Duell, weiter_zum_Sensor, naechster_Stoff, vorheriger_Stoff, zur_Auswertung;

button Sensormessung, messen, letzteWiederholen, ja_zufrieden, reset_Station2;
Probe A, B, C, D, E;


button reset_innenraum;

button Station4a, Station4b, Station4c, Station4Auswertung, Station4Start;

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
  hintergrund = loadImage("img/hintergrund.png");

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
  reset_Station2 =  new button(1070, 665, 100, 50, "Reset", 5, true, 20);




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

  // Station 4
  Station4a = new button(565, 350, 150, 100, "zu Aufgabe a)", 5, true, 20); 
  Station4b = new button(1125, 495, 150, 100, "zu Aufgabe b)", 5, true, 20); 
  Station4c = new button(1125, 495, 150, 100, "zu Aufgabe c)", 5, true, 20); 
  Station4Auswertung = new button(1125, 495, 150, 100, "zur\nAuswertung", -12, true, 20); 
  Station4Start = new button(1120, 200, 150, 100, "Starte\nMessung", -12, true, 20); 
  reset_innenraum = new button(1175, 605, 100, 50, "Reset", 5, true, 20);



  innenraumluft_control = new ControlP5(this);
  innenraumluft = innenraumluft_control.addCheckBox("Innenraumluft")
    .setPosition(235, 150)
    .setColorForeground(color(120))
    .setColorActive(color(0, 255, 0))
    .setColorLabel(color(255, 255, 100))
    .setSize(30, 30)
    .setItemsPerRow(5)
    .setSpacingColumn(180)
    .setSpacingRow(225)
    .addItem("T", 0)
    .addItem("H", 0)
    .addItem("TVOC", 0)
    .addItem("CO2", 0)
    .addItem("eCO2", 0)
    .hide();

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
  imageMode(CORNER);
  image(hintergrund, 0, 0);

  if (!gotSerial) {
    try {
      myPort = new Serial(this, Serial.list()[0], 57600);
      gotSerial = true;
    }
    catch(Exception e) {
      gotSerial = false;
    }
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
  reset_Station2.hide();
  innenraumluft.hide();
  Station4a.visible = false;

  zumObermenu.x = 1100;
  if (page == 2.1) {
    up2.y = 190;
    down2.y = 245;
  } else {
    up2.y = 100;
    down2.y = 155;
  }

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
  } else if (page == 4.1) {
    Innenraumluft_a();
  } else if (page == 4.11) {
    Innenraumluft_b();
  } else if (page == 4.111) {
    Innenraumluft_c();
  } else if (page == 10) {
    setting();
    autosave.show();
    dateiformat.show();
    Stationen.hide();
    Sensoren.hide();
    zumObermenu.hide();
  } else if (page == -2) {
    SensorAuswahl();
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
      } else if (page == 4.1) {
        page = 4;
      } else if (page == 4.11) {
        page = 4.1;
      } else if (page == 4.111) {
        page = 4.11;
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

  if (reset_Station2.isClicked()) {
    reset_bool_station2 = true;
  }

  if (reset_bool_station2) {
    sicher();
    if (sicher_ja.isClicked()) {
      for (int i = 0; i < 5; i++) {
        for (int j = 0; j < 500; j++) {
          MenschSensorMesswerte[i][j] = 0;
        }
      }
      reset_bool_station2 = false;
      indexMenschSensor = 0;
      prob = 1;
      currentTime = millis();
      indexMenschSensorMax = 0;
    }

    if (sicher_nein.isClicked()) {
      reset_bool_station2 = false;
    }
  }

  if (reset_innenraum.isClicked()) {
    reset_bool_station4 = true;
  }

  if (reset_bool_station4) {
    sicher();
    if (sicher_ja.isClicked()) {
      Station4agestartet = true;
      currentTime4a = millis();
      indexInnenraumlufta = 0;
      reset_bool_station4 = false;
    }
    if (sicher_nein.isClicked()) {
      reset_bool_station4 = false;
    }
  }


  if (page == 4.1 || page == 4.11 || page == 4.111) {
    up1.y = 200;
    down1.y = 255;
  } else {
    up1.y = 100;
    down1.y = 155;
  }

  if (Station4Auswertung.isClicked()) {
    page = 4.1111;
    saveDataInnenraum();
  }
  if (Station4c.isClicked()) {
    delay(200);
    page = 4.111;
  }
  if (Station4b.isClicked()) {
    delay(200);
    println("HI");
    page = 4.11;
  }
  if (Station4a.isClicked()) {
    delay(200);
    page = 4.1;
  }
}

boolean reset_bool = false;
boolean reset_bool_station2 = false;

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

void saveDataInnenraum() {

  String[] T_a = new String[indexInnenraumlufta + indexInnenraumluftb + indexInnenraumluftc];
  String[] H_a = new String[indexInnenraumlufta + indexInnenraumluftb + indexInnenraumluftc];
  String[] TVOC_a = new String[indexInnenraumlufta + indexInnenraumluftb + indexInnenraumluftc];
  String[] CO2_a = new String[indexInnenraumlufta + indexInnenraumluftb + indexInnenraumluftc];
  String[] eCO2_a = new String[indexInnenraumlufta + indexInnenraumluftb + indexInnenraumluftc];

  boolean txt_bool = dateiformat.getState("txt");
  boolean csv_bool = dateiformat.getState("csv");


  if (txt_bool || csv_bool) {
    for (int i = 0; i < indexInnenraumlufta; i++) {
      T_a[i] = str(Innenraumlufta[0][i]).replace('.', ',');
      H_a[i] = str(Innenraumlufta[1][i]).replace('.', ',');
      TVOC_a[i] = str(Innenraumlufta[3][i]).replace('.', ',');
      CO2_a[i] = str(Innenraumlufta[2][i]).replace('.', ',');
      eCO2_a[i] = str(Innenraumlufta[4][i]).replace('.', ',');
    }
    for (int i = indexInnenraumlufta; i < indexInnenraumlufta + indexInnenraumluftb; i++) {
      T_a[i] = str(Innenraumluftb[0][i - indexInnenraumlufta]).replace('.', ',');
      H_a[i] = str(Innenraumluftb[1][i- indexInnenraumlufta]).replace('.', ',');
      TVOC_a[i] = str(Innenraumluftb[3][i- indexInnenraumlufta]).replace('.', ',');
      CO2_a[i] = str(Innenraumluftb[2][i- indexInnenraumlufta]).replace('.', ',');
      eCO2_a[i] = str(Innenraumluftb[4][i- indexInnenraumlufta]).replace('.', ',');
    }
    for (int i = indexInnenraumlufta + indexInnenraumluftb; i < indexInnenraumlufta + indexInnenraumluftb + indexInnenraumluftc; i++) {
      T_a[i] = str(Innenraumluftc[0][i- (indexInnenraumlufta + indexInnenraumluftb)]).replace('.', ','); 
      H_a[i] = str(Innenraumluftc[1][i- (indexInnenraumlufta + indexInnenraumluftb)]).replace('.', ','); 
      TVOC_a[i] = str(Innenraumluftc[3][i- (indexInnenraumlufta + indexInnenraumluftb)]).replace('.', ','); 
      CO2_a[i] = str(Innenraumluftc[2][i- (indexInnenraumlufta + indexInnenraumluftb)]).replace('.', ','); 
      eCO2_a[i] = str(Innenraumluftc[4][i- (indexInnenraumlufta + indexInnenraumluftb)]).replace('.', ',');
    };
  }

  if (txt_bool) {
    saveStrings("Messdaten/" + day() + "_" + month() + "_" + year()+ "/Innenraum/Temperatur.txt", T_a);
    saveStrings("Messdaten/" + day() + "_" + month() + "_" + year()+"/Innenraum/Luftfeuchte.txt", H_a);
    saveStrings("Messdaten/" + day() + "_" + month() + "_" + year()+"/Innenraum/CO2.txt", CO2_a);
    saveStrings("Messdaten/" + day() + "_" + month() + "_" + year() +"/Innenraum/TVOC.txt", TVOC_a);
    saveStrings("Messdaten/" + day() + "_" + month() + "_" + year() +"/Innenraum/eCO2.txt", eCO2_a);
  }

  if (csv_bool) {
    table.clearRows();
    for (int i = 1; i < (indexInnenraumlufta +indexInnenraumluftb + indexInnenraumluftc); i++) {
      TableRow newRow = table.addRow();
      newRow.setInt("Zeit", i);
      if (i < indexInnenraumlufta) {
        newRow.setFloat("Zeit", Innenraumlufta[6][i]);
        newRow.setFloat("Temperatur", Innenraumlufta[0][i]);
        newRow.setFloat("Luftfeuchte", Innenraumlufta[1][i]);
        newRow.setFloat("CO2", Innenraumlufta[4][i]);
        newRow.setFloat("eCO2", Innenraumlufta[5][i]);
        newRow.setFloat("TVOC", Innenraumlufta[3][i]);
      } else if (i < (indexInnenraumluftb + indexInnenraumlufta)) {
        newRow.setFloat("Zeit", Innenraumluftb[6][i - indexInnenraumlufta]);
        newRow.setFloat("Temperatur", Innenraumluftb[0][i - indexInnenraumlufta]);
        newRow.setFloat("Luftfeuchte", Innenraumluftb[1][i - indexInnenraumlufta]);
        newRow.setFloat("CO2", Innenraumluftb[4][i - indexInnenraumlufta]);
        newRow.setFloat("eCO2", Innenraumluftb[5][i - indexInnenraumlufta]);
        newRow.setFloat("TVOC", Innenraumluftb[3][i - indexInnenraumlufta]);
      } else if (i < (indexInnenraumluftc + indexInnenraumlufta + indexInnenraumluftb)) {
        newRow.setFloat("Zeit", Innenraumluftc[6][i - (indexInnenraumlufta + indexInnenraumluftb)]);
        newRow.setFloat("Temperatur", Innenraumluftc[0][i - (indexInnenraumlufta + indexInnenraumluftb)]);
        newRow.setFloat("Luftfeuchte", Innenraumluftc[1][i - (indexInnenraumlufta + indexInnenraumluftb)]);
        newRow.setFloat("CO2", Innenraumluftc[4][i- (indexInnenraumlufta + indexInnenraumluftb)]);
        newRow.setFloat("eCO2", Innenraumluftc[5][i - (indexInnenraumlufta + indexInnenraumluftb)]);
        newRow.setFloat("TVOC", Innenraumluftc[3][i - (indexInnenraumlufta + indexInnenraumluftb)]);
      }
      saveTable(table, "Messdaten/" + day() + "_" + month() + "_" + year()+"/Innenraum/alleDaten.csv");
    }
  }
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
