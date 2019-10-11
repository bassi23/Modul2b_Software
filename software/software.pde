/*
Software zur Aufnahme von Sensordaten und Durchführung verschiedener Messstationen im Rahmen des DBU-Projekts "SUSmobil: Modul 2b) - Umweltmesstechnik".
 Um die Software zu verwenden muss der beiliegende Arduino Code auf den Mikrocontroller geladen werden.
 */

// Dieses Programm nutzt die beiden Bibliotheken "processing.serial." (Herstellung einer seriellen Verbindung) und "controlP5" (Dropdwon Menüs).
import processing.serial.*;
Serial myPort;

import controlP5.*;

//

dropdown Aufloesung, Alle_Sensoren_Rot, Alle_Sensoren_Blau, SPS_Rot_Station1, SPS_Blau_Station1, SPS_Rot_Station1_Auswertung, SPS_Blau_Station1_Auswertung, SPS_Gruen_Station1_Auswertung, Station4_Rot, Station4_Blau, Station4_Auswertung_Rot, Station4_Auswertung_Blau;
dropdown dateiformat, autosave, connect, error_bars, freie_stationen;
checkbox verbinde, fehler, verbinde_tutorial, fehler_tutorial, fehler_innenraum, verbinde_innenraum;

dropdown tutorial_Rot, tutorial_Blau;

String[] Aufloesung_Strings = {"Niedrig (800x450)", "Mittel (1024x600)", "Standard (1280x720)", "Hoch (1440x810)"};
//String[] Alle_Sensoren_Strings = {"", "TVOC", "eCO2", "Temperatur", "Luftfeuchte", "CO2", "PM1", "PM2.5", "PM4", "PM10"};
String[] Alle_Sensoren_Strings = {"", "TVOC", "Temperatur", "Luftfeuchte", "CO2", "PM1", "PM2.5", "PM4", "PM10"};

String[] SPS_Strings_Station1 = {"", "PM2.5", "PM10"};
String[] SPS_Strings_Station1_Auswertung = {"", "PM2.5 (Referenz)", "PM10 (Referenz)", "PM2.5 (trocken)", "PM10 (trocken)", "PM2.5 (nass)", "PM10 (nass)"};
//String[] Station4_Strings = {"", "Temperatur", "Luftfeuchte", "CO2", "TVOC", "eCO2"};
String[] Station4_Strings = {"", "Temperatur", "Luftfeuchte", "CO2", "TVOC"};

//String[] Station4_Auswertung_Strings = {"Zeit", "Temperatur", "Luftfeuchte", "CO2", "TVOC", "eCO2"};
//String[] Station4_Auswertung_Strings2 = {"Temperatur", "Luftfeuchte", "CO2", "TVOC", "eCO2"};

String[] Station4_Auswertung_Strings = {"Zeit", "Temperatur", "Luftfeuchte", "CO2", "TVOC"};
String[] Station4_Auswertung_Strings2 = {"Temperatur", "Luftfeuchte", "CO2", "TVOC"};
String[] dateiformat_Strings = {"Format: .csv", "Format: .txt"};
String[] autosave_Strings = {"nicht speichern", "speichern bei 'zurück'", "autosave (jede Minute)", "autosave (jede Stunde)", "autosave (jeden Tag)"};
String[] connect_Strings = {"verbinden", "nicht verbinden"};
String[] error_bars_Strings = {"anzeigen", "nicht anzeigen"};
String[] freie_stationen_Strings = {"nicht freigeben", "freigeben"};

//String[] tutorial_Rot_Strings = {"", "TVOC", "eCO2", "Temperatur", "Luftfeuchte", "CO2", "PM1", "PM2.5", "PM4", "PM10"};
//String[] tutorial_Blau_Strings = {"", "TVOC", "eCO2", "Temperatur", "Luftfeuchte", "CO2", "PM1", "PM2.5", "PM4", "PM10"};
String[] tutorial_Rot_Strings = {"", "TVOC", "Temperatur", "Luftfeuchte", "CO2", "PM1", "PM2.5", "PM4", "PM10"};
String[] tutorial_Blau_Strings = {"", "TVOC", "Temperatur", "Luftfeuchte", "CO2", "PM1", "PM2.5", "PM4", "PM10"};
//Logos und Hintergrundbilder
PImage sps, sgp, scd, nodemcu, DBU, iPhysicsLab, LMT, SFZSLS, SUSmobil, hintergrund;
// Bilder der zu messenden Stoffe für Station 3 - TVOC-Duelle
PImage Stoff1_bild, Stoff2_bild, Stoff3_bild, Stoff4_bild, Stoff5_bild, Stoff6_bild, Stoff7_bild, Stoff8_bild, Stoff9_bild, Stoff10_bild;

// Tabelle, in der Messdaten gespeichert werden
Table table;

// Buttons der Stationen
station one, two_three, two, three, four, settings;

// Buttons zur Steuerung der Skalierung des Graphen (up, down) und 
button back, up1, down1, up2, down2, left1, right1, start_stopp, x_up, x_down, y_up, y_down;
button reset, sicher_ja, sicher_nein;
button aktualisierung_right, aktualisierung_left;
button Stationen, Sensoren, zumObermenu;
button SPS30, SGP30, SCD30, alle_Sensoren, alle_Sensoren2;
button einstellungen;
button Port1, Port2, Port3, Port4, Port5, Port6;
button station1_referenz, station1_trocken, station1_nass, station1_MessungStarten, station1_MessungWiederholen, station1_weiter_ab, station1_weiter_bc, station1_zur_Auswertung;
button TVOC_Duelle_Start, naechstes_Duell, vorheriges_Duell, weiter_zum_Sensor, naechster_Stoff, vorheriger_Stoff, zur_Auswertung, zur_Auswertung2, zur_Auswertung3;
button Sensormessung, messen, letzteWiederholen, ja_zufrieden, reset_Station2;
button reset_innenraum;
button Station4a, Station4b, Station4c, Station4Auswertung, Station4Start, station4_MessungWiederholen, zero, fifty, hundred, genaueAnalyse, up2_Station4, down2_Station4;

button tutorial_ueberspringen, tutorial_weiter, tutorial_zum, tutorial_back, tutorial_Start_Stopp;
button tutorial_skalierung_rot_up, tutorial_skalierung_rot_down, tutorial_skalierung_blau_up, tutorial_skalierung_blau_down;
button tutorial_reset, sicher_ja_reset, sicher_nein_reset, left_tutorial, right_tutorial, aktualisierung_right_tutorial, aktualisierung_left_tutorial;

button setBaseline;

Probe A, B, C, D, E;
TVOC_Kandidat Stoff1, Stoff2, Stoff3, Stoff4, Stoff5, Stoff6, Stoff7, Stoff8, Stoff9, Stoff10;


slider s, sFeinstaub;
PFont bold, normal, bold1, bold2, bold3;

boolean measure = true;
boolean tutorial_Start = false;
boolean tutorial_Start_first_time = false;
boolean tutorial_resettet = false;

float page = -1;
boolean gotSerial = false;
float zeroTime2 = 0;
float zeroTime3 = 0; //Feinstaubzeit
float zeroTime4 = 0;
float zeroTime5 = 0;

float time_Station4 = 300;

int anzahlCOMPorts = 0;
int ausgewaehlterPort = 0;

// Das Programm ist in Seiten unterteilt

// -7: Tutorial
// -7.1: Tutorial
// -1: Hauptmenü
// -2: Sensoren - Auswahl


// -3: Sensoren - Feinstaub
// -4: Sensoren - TVOC, eCO2
// -5: Sensoren - Temperatur, Luftfeuchte, CO2


// -5: Sensoren - Messwert gegen Messwert
// -6: Sensoren - Messwert gegen Zeit


// 0: Stationen - Auswahl
// 1: Stationen - Station 1 Hauptmenü
// 1.1: Stationen - Station 1 - Aufgabe a)
// 1.11: Stationen - Station 1 - Aufgabe b)
// 1.111: Stationen - Station 1 - Aufgabe c)
// 1.1111: Stationen - Station 1 - Aufgabenstellung
// 1.11111: Stationen - Station 1 - Auswertung

// 2.5: Stationen - Station 2/3

// 2: Stationen - Station 2 - Aufgabenstellung + menschliche Messung
// 2.1: Stationen - Station 2 - Sensormessung
// 2.2: Stationen - Station 2 - Vergleich Sensor - Mensch

// 3: Stationen - Station 3 - Aufgabenstellung
// 3.1: Stationen - Station 3 - Aufgabe a): Riechen
// 3.11: Stationen - Station 3 - Aufgabe b): Sensormessung
// 3.111: Stationen - Station 3 - Vergleich Mensch - Sensor


// 4: Stationen - Station 4 - Aufgabenstellung
// 4.1: Stationen - Station 4 - Aufgabe a)
// 4.11: Stationen - Station 4 - Aufgabe b)
// 4.111: Stationen - Station 4 - Aufgabe c)
// 4.1111: Stationen - Station 4 - Vergleich

// 10: Einstellungen


void setup() {
  size(1280, 720);
  surface.setResizable(true);
  anzahlCOMPorts = Serial.list().length;
  bold = createFont("Arial Bold", 22);
  normal = createFont("Lucida Sans", 20);
  bold1 = createFont("Arial Bold", 30);
  bold2 = createFont("Arial Bold", 25);
  bold3 = createFont("Arial Bold", 16);
  try {
    myPort = new Serial(this, Serial.list()[ausgewaehlterPort], 57600);
    gotSerial = true;
  }
  catch(Exception e) {
    gotSerial = false;
  }
  Aufloesung = new dropdown("Standard (1280x720)", 350, 480, 250, 30, 4, Aufloesung_Strings, false, color(123, 120, 20));


  SPS_Blau_Station1 = new dropdown("Rechts", 750, 20, 200, 30, 3, SPS_Strings_Station1, false, color(0, 0, 255));
  SPS_Rot_Station1 = new dropdown("Links", 120, 20, 200, 30, 3, SPS_Strings_Station1, false, color(255, 0, 0));
  SPS_Blau_Station1_Auswertung = new dropdown("Rechts", 750, 20, 200, 30, 7, SPS_Strings_Station1_Auswertung, false, color(0, 0, 255));
  SPS_Rot_Station1_Auswertung = new dropdown("Links", 120, 20, 200, 30, 7, SPS_Strings_Station1_Auswertung, false, color(255, 0, 0));
  SPS_Gruen_Station1_Auswertung = new dropdown("Mitte", 435, 20, 200, 30, 7, SPS_Strings_Station1_Auswertung, false, color(0, 255, 0));


  //Station4_Rot = new dropdown("Links", 120, 20, 200, 30, 6, Station4_Strings, false, color(255, 0, 0));
  //Station4_Blau = new dropdown("Rechts", 750, 20, 200, 30, 6, Station4_Strings, false, color(0, 0, 255));

  Station4_Rot = new dropdown("Links", 120, 20, 200, 30, 5, Station4_Strings, false, color(255, 0, 0));
  Station4_Blau = new dropdown("Rechts", 750, 20, 200, 30, 5, Station4_Strings, false, color(0, 0, 255));


  //  Station4_Auswertung_Rot = new dropdown("Zeit", 120, 15, 200, 30, 6, Station4_Auswertung_Strings, false, color(255, 0, 0));
  //  Station4_Auswertung_Blau = new dropdown("Temperatur", 750, 15, 200, 30, 5, Station4_Auswertung_Strings2, false, color(0, 0, 255));

  Station4_Auswertung_Rot = new dropdown("Zeit", 120, 15, 200, 30, 5, Station4_Auswertung_Strings, false, color(255, 0, 0));
  Station4_Auswertung_Blau = new dropdown("Temperatur", 750, 15, 200, 30, 4, Station4_Auswertung_Strings2, false, color(0, 0, 255));


  // Alle_Sensoren_Rot = new dropdown("", 120, 10, 200, 30, 10, Alle_Sensoren_Strings, false, color(255, 0, 0));
  // Alle_Sensoren_Blau = new dropdown("", 750, 10, 200, 30, 10, Alle_Sensoren_Strings, false, color(0, 0, 255));
  Alle_Sensoren_Rot = new dropdown("", 120, 10, 200, 30, 9, Alle_Sensoren_Strings, false, color(255, 0, 0));
  Alle_Sensoren_Blau = new dropdown("", 750, 10, 200, 30, 9, Alle_Sensoren_Strings, false, color(0, 0, 255));

  dateiformat = new dropdown("Format: .csv", 350, 40, 200, 30, 2, dateiformat_Strings, false, color(255, 12, 23));
  autosave = new dropdown("autosave (jeden Tag)", 700, 40, 300, 30, 5, autosave_Strings, false, color(255, 34, 23));

  connect = new dropdown("verbinden", 350, 180, 200, 30, 2, connect_Strings, false, color(12, 4, 45));
  error_bars = new dropdown("anzeigen", 700, 180, 200, 30, 2, error_bars_Strings, false, color(23, 4, 5));
  freie_stationen = new dropdown("freigeben", 700, 480, 200, 30, 2, freie_stationen_Strings, false, color(1, 2, 3));

  fehler = new checkbox(1225, 160, 30, false);
  verbinde = new checkbox(1225, 200, 30, false);
  fehler_tutorial = new checkbox(1215, 240, 25, false);
  verbinde_tutorial = new checkbox(1215, 275, 25, true);

  fehler_innenraum = new checkbox(1225, 195, 30, false);
  verbinde_innenraum = new checkbox(1225, 240, 30, true);

  // tutorial_Rot = new dropdown("Links", 125, 115, 200, 30, 10, tutorial_Rot_Strings, false, color(255, 0, 0));
  // tutorial_Blau = new dropdown("Rechts", 725, 115, 200, 30, 10, tutorial_Blau_Strings, false, color(0, 0, 255));

  tutorial_Rot = new dropdown("Links", 125, 115, 200, 30, 9, tutorial_Rot_Strings, false, color(255, 0, 0));
  tutorial_Blau = new dropdown("Rechts", 725, 115, 200, 30, 9, tutorial_Blau_Strings, false, color(0, 0, 255));




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


  back = new button(1115, 660, 140, 50, "zurück", 5, true, 20);
  up1 = new button(25, 140, 30, 50, "up_arrow", 5, true, 20);
  down1 = new button(25, 195, 30, 50, "down_arrow", 5, true, 20);
  up2 = new button(1025, 140, 30, 50, "up_arrow", 5, true, 20);
  down2 = new button(1025, 195, 30, 50, "down_arrow", 5, true, 20);
  left1 = new button(1115, 330, 50, 30, "left_arrow", 5, true, 20);
  right1 = new button(1200, 330, 50, 30, "right_arrow", 5, true, 20);
  start_stopp = new button(1115, 35, 140, 50, "Start/Stopp", 5, true, 20);
  aktualisierung_right = new button(1200, 500, 50, 30, "right_arrow", 5, true, 20);
  aktualisierung_left = new button(1115, 500, 50, 30, "left_arrow", 5, true, 20);


  x_up = new button(900, 680, 50, 30, "right_arrow", 5, true, 20);
  x_down = new button(840, 680, 50, 30, "left_arrow", 5, true, 20);
  y_up = new button(25, 140, 30, 50, "up_arrow", 5, true, 20);
  y_down = new button(25, 195, 30, 50, "down_arrow", 5, true, 20);

  //
  reset = new button(1115, 90, 140, 50, "Reset", 5, true, 20);
  sicher_ja = new button(450, 340, 150, 75, "Ja", 5, true, 20);
  sicher_nein = new button(700, 340, 150, 75, "Nein", 5, true, 20);

  //

  sicher_ja_reset = new button(450, 340, 150, 75, "Ja", 5, true, 20);
  sicher_nein_reset = new button(700, 340, 150, 75, "Nein", 5, true, 20);
  left_tutorial = new button(1097, 375, 50, 30, "left_arrow", 5, true, 20);
  right_tutorial = new button(1187, 375, 50, 30, "right_arrow", 5, true, 20);
  //
  Stationen = new button(100, 100, 500, 400, "Stationen", 20, true, 70);
  Sensoren = new button(650, 100, 500, 400, "Sensoren", 20, true, 70);
  zumObermenu = new button(1125, 605, 140, 50, "Hauptmenü", 5, true, 20);
  zumObermenu.hide();

  //
  SPS30 = new button(100, 50, 450, 300, "Feinstaub", 15, true, 50);
  SGP30 = new button(650, 50, 450, 300, "TVOC, eCO2", 15, true, 50);
  SCD30 = new button(100, 375, 450, 300, "Temperatur,\nLuftfeuchte,\nCO2", -40, true, 50);
  alle_Sensoren = new button(720, 100, 300, 150, "Messwert gegen\nZeit", -10, true, 30);
  alle_Sensoren2 = new button(720, 400, 300, 150, "Messwert gegen\nMesswert", -10, true, 30);

  //
  einstellungen = new button(20, 630, 150, 75, "Einstellungen", 5, true, 20);
  Port1 = new button(730, 335, 30, 30, " x ", 5, true, 20);
  Port2 = new button(730, 370, 30, 30, " x ", 5, true, 20);
  Port3 = new button(730, 405, 30, 30, " x ", 5, true, 20);
  Port4 = new button(730, 440, 30, 30, " x ", 5, true, 20);
  Port5 = new button(730, 475, 30, 30, " x ", 5, true, 20);
  Port6 = new button(730, 510, 30, 30, " x ", 5, true, 20);
  //
  station1_referenz = new button(150, 300, 300, 150, "Referenzmessung", 5, true, 30);
  station1_trocken = new button(500, 300, 300, 150, "trockener\nSchwamm", -20, true, 30);
  station1_nass = new button(850, 300, 300, 150, "nasser\nSchwamm", -20, true, 30);
  zur_Auswertung2 = new button(500, 570, 300, 140, "zur Auswertung", 5, true, 30);

  station1_MessungStarten = new button(1115, 70, 140, 65, "Messung\nstarten", -5, true, 20);
  station1_MessungWiederholen = new button(1115, 310, 140, 65, "Messung \nwiederholen", -5, true, 20);
  station1_weiter_ab = new button(1115, 390, 140, 50, "zu Aufgabe b)", 5, true, 20);
  station1_weiter_bc =  new button(1115, 390, 140, 50, "zu Aufgabe c)", 5, true, 20);
  station1_zur_Auswertung = new button(1105, 390, 160, 50, "zur Auswertung", 5, true, 20);
  zur_Auswertung3 = new button(1075, 600, 180, 50, "zu den Graphen", 5, true, 20);

  tutorial_ueberspringen = new button(550, 635, 170, 70, "Tutorial\nüberspringen", -10, true, 20);
  tutorial_weiter = new button(1120, 650, 140, 50, "weiter", 5, true, 20);
  tutorial_zum = new button(1075, 630, 150, 75, "zum Tutorial", 5, true, 20);
  tutorial_back = new button(20, 650, 140, 50, "zurück", 5, true, 20);
  tutorial_Start_Stopp = new button(1100, 140, 130, 40, "Start/Stopp", 5, true, 20);

  tutorial_skalierung_rot_up = new button(15, 175, 25, 40, "up_arrow", 5, true, 20);
  tutorial_skalierung_rot_down = new button(15, 220, 25, 40, "down_arrow", 5, true, 20);
  tutorial_skalierung_blau_up = new button(1005, 175, 25, 40, "up_arrow", 5, true, 20);
  tutorial_skalierung_blau_down =new button(1005, 220, 25, 40, "down_arrow", 5, true, 20);
  tutorial_reset = new button(1100, 185, 130, 40, "Reset", 5, true, 20);
  aktualisierung_right_tutorial = new button(1183, 515, 50, 30, "right_arrow", 5, true, 20);
  aktualisierung_left_tutorial = new button(1098, 515, 50, 30, "left_arrow", 5, true, 20);

  setBaseline = new button(50, 200, 150, 75, "Baseline setzen", 5, true, 20);

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
  reset_Station2 =  new button(970, 660, 140, 50, "Reset", 5, true, 20);


  station4_MessungWiederholen = new button(1115, 290, 140, 65, "Messung \nwiederholen", -5, true, 20);



  TVOC_Duelle_Start = new button(565, 400, 150, 100, "Start", 5, true, 20);
  Stoff1 = new TVOC_Kandidat(640, 360, Stoff1_bild, "Lack");
  Stoff2 = new TVOC_Kandidat(640, 600, Stoff2_bild, "Lack mit Umweltsiegel");
  Stoff3 = new TVOC_Kandidat(640, 360, Stoff3_bild, "Herkömmlicher Filzstift");
  Stoff4 = new TVOC_Kandidat(640, 600, Stoff4_bild, "VOC-freier Filzstift");
  Stoff5 = new TVOC_Kandidat(640, 360, Stoff5_bild, "VOC-freier Kleber");
  Stoff6 = new TVOC_Kandidat(640, 600, Stoff6_bild, "Herkömmlicher Klebstoff");
  Stoff7 = new TVOC_Kandidat(640, 360, Stoff7_bild, "Parkettboden");
  Stoff8 = new TVOC_Kandidat(640, 600, Stoff8_bild, "PVC-Boden");
  Stoff9 = new TVOC_Kandidat(640, 360, Stoff9_bild, "Stoff 9");
  Stoff10 = new TVOC_Kandidat(640, 600, Stoff10_bild, "Stoff 10");

  naechstes_Duell = new button(1125, 200, 150, 75, "Nächstes\nDuell", -12, true, 20);
  naechster_Stoff = new button(1125, 150, 150, 75, "Nächster\nStoff", -12, true, 20);
  vorheriges_Duell = new button(1125, 280, 150, 75, "Vorheriges\nDuell", -12, true, 20);
  vorheriger_Stoff = new button(1125, 230, 150, 75, "Vorheriger\nStoff", -12, true, 20);
  weiter_zum_Sensor = new button(1125, 550, 150, 75, "Sensor-\nmessung", -12, true, 20);

  zur_Auswertung = new button(1125, 580, 160, 75, "Zur Aus-\nwertung", -12, true, 20);

  // Station 4
  Station4a = new button(570, 390, 140, 50, "zu Aufgabe a)", 5, true, 20); 
  Station4b = new button(1115, 390, 140, 50, "zu Aufgabe b)", 5, true, 20); 
  Station4c = new button(1115, 390, 140, 50, "zu Aufgabe c)", 5, true, 20); 
  Station4Auswertung = new button(1115, 365, 140, 70, "zur\nAuswertung", -12, true, 20); 
  Station4Start = new button(1115, 100, 140, 65, "Messung\nstarten", -5, true, 20); 


  up2_Station4 = new button(900, 670, 50, 30, "right_arrow", 5, true, 20);
  down2_Station4 = new button(840, 670, 50, 30, "left_arrow", 5, true, 20);


  zero = new button(120, 90, 150, 50, "0% Lüfter", 5, true, 20);
  fifty = new button(420, 90, 150, 50, "50% Lüfter", 5, true, 20);
  hundred = new button(750, 90, 150, 50, "100% Lüfter", 5, true, 20);

  genaueAnalyse =  new button(1115, 550, 140, 50, "Analyse", 5, true, 20);
  s = new slider(200, 400, false, false);
  sFeinstaub = new slider(200, 400, false, false);


  for (int j = 0; j < 1000; j++) {
    tutorial_data[0][j] = 20 + noise(0.1*j + 123);
    tutorial_data[1][j] = 50 + 5*noise(0.1*j+ 234);
    tutorial_data[2][j] = 450 + 100*noise(0.1*j+ 345);
    tutorial_data[3][j] = 30 + 20*noise(0.1*j+ 456);
    tutorial_data[4][j] = 450 + 100*noise(0.1*j+ 2344);
    tutorial_data[5][j] = 30 + 5*noise(0.01*j+ 3412);
    tutorial_data[6][j] =  tutorial_data[5][j] + 1*noise(0.1*j+ 1231);
    tutorial_data[7][j] =  tutorial_data[6][j] + 2*noise(0.1*j+ 1);
    tutorial_data[8][j] =  tutorial_data[7][j] + 3*noise(0.1*j+ 3);
    tutorial_data[9][j] =  0.5*j;
  }
}

float mouse_time = 0;


void draw() {
  if (mouseX - pmouseX != 0 && !mousePressed && mouseX > 0 && mouseX < width && mouseY > 0 && mouseY < height) {
    mouse_time = millis();
  }
  if (millis() - mouse_time > 60000) {
    frameRate(5);
  } else {
    frameRate(30);
  }


  textFont(normal);
  scale(scale_factor);
  pushMatrix();
  //Aufloesung.setPosition(950/0.75, 150/0.75);
  popMatrix();
  scale(1);
  imageMode(CORNER);
  translate(0, scroll);
  // Die Performance wird durch ein Bild als Hintergrund verbessert
  background(250);
  //image(hintergrund, 0, 0);

  // Falls die serielle Verbinding unterbrochen wird, wird nach einer neuen gesucht
  if (!gotSerial) {
    try {
      myPort = new Serial(this, Serial.list()[ausgewaehlterPort], 57600);
      myPort.clear();
      gotSerial = true;
      anzahlCOMPorts = Serial.list().length;
    }
    catch(Exception e) {
      println(e);
      gotSerial = false;
    }
  }
  if (Serial.list().length != anzahlCOMPorts) {
    gotSerial = false;
  }


  // Debug - Informationen
  //noStroke();
  //fill(0);
  //textSize(16);
  //text(nf(frameRate, 0, 0), 20, 20);
  //text("Aufgenommene Messwerte: " + index, 420, 20);



  // Buttons werden zunächst alle "versteckt", und nur die benötigten an den entsprechenden Stellen "sichtbar" gemacht.
  sicher_ja.hide();
  einstellungen.hide();
  sicher_nein.hide();
  station1_referenz.hide();
  station1_trocken.hide();
  station1_nass.hide();
  TVOC_Duelle_Start.hide();
  Sensormessung.hide();
  reset_Station2.hide();
  zero.hide();
  fifty.hide();
  hundred.hide();
  setBaseline.hide();
  tutorial_zum.hide();
  tutorial_weiter.hide();
  tutorial_back.hide();
  Station4b.hide();
  Station4c.hide();
  Station4Auswertung.hide();
  Station4a.visible = false;
  tutorial_ueberspringen.hide();
  station1_weiter_ab.hide();
  station1_weiter_bc.hide();
  station1_zur_Auswertung.hide();
  zur_Auswertung2.hide();
  zur_Auswertung3.hide();

  aktualisierung_right.hide();
  aktualisierung_left.hide();
  start_stopp.hide();

  tutorial_back.hide();

  tutorial_Start_Stopp.hide();
  tutorial_reset.hide();

  alle_Sensoren2.hide();
  if (page == -2) {
    alle_Sensoren.show();
    alle_Sensoren2.show();
  } else {
    alle_Sensoren.hide();
    alle_Sensoren2.hide();
  }


  // Aufloesung.hide();
  ////////////////////////////////////////////////////////
  zumObermenu.x = 1115;

  if (page == 2.1) {
    up2.y = 190;
    down2.y = 245;
    up2.x = 1210;
    down2.x = 1210;
  } else if (page != 4.1 && page != 4.11 && page != 4.111) {
    up2.y = 140;
    down2.y = 195;
    up2.x = 1025;
    down2.x = 1025;
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

  if (page != 0 && page != -1 && page != -7 && page != -7.1 && page != -7.11 && page != -7.111&& page != -7.1111 && page != -7.11111 && page != -7.111111 && page != -7.2 && page != -7.22 && page != -7.222) {
    back.show();
  }

  String auto = autosave.name;

  if (auto == "autosave (jede Minute)") {
    if (second() == 0 && savedDay == false) {
      saveData();
      savedDay = true;
      tagesIndex = 0;
    }
    if (second() > 0) {
      savedDay = false;
    }
  }
  if (auto == "autosave (jede Stunde)") {
    if (second() == 0 && minute() == 0 && savedDay == false) {
      saveData();
      savedDay = true;
      tagesIndex = 0;
    }
    if (second() > 0) {
      savedDay = false;
    }
  }
  if (auto == "autosave (jeden Tag)") {
    if (second() == 0 && minute() == 0 && hour() == 0 && savedDay == false) {
      saveData();
      savedDay = true;
      tagesIndex = 0;
    }
    if (second() > 0) {
      savedDay = false;
    }
  }
  Datenaufnahme();
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
    if (alle_Sensoren.isClicked()) {
      page = -6;
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

  if (page == 1.11111) {
    verbinde.y = 570;
    fehler.y = 610;
  } else {
    verbinde.y = 200;
    fehler.y = 160;
  }

  if (page == -1) {
    Obermenu();
    einstellungen.show();
    reset.hide();
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
  } else if (page == 1.11111) {
    Vergleich_Feinstaub_Graphen();
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
    reset.hide();
  } else if (page == 4.1) {
    Innenraumluft_a();
    reset.hide();
  } else if (page == 4.11) {
    Innenraumluft_b();
    reset.hide();
  } else if (page == 4.111) {
    Innenraumluft_c();
    reset.hide();
  } else if (page == 4.1111) {
    AuswertungInnenraum(); 
    reset.hide();
  } else if (page == 10) {
    setting();
    Stationen.hide();
    Sensoren.hide();
    zumObermenu.hide();

    int anzahlPorts = Serial.list().length;
    if (anzahlPorts > 0) {
      Port1.show();
    } else {
      Port1.hide();
    }
    if (anzahlPorts > 1) {
      Port2.show();
    } else {
      Port2.hide();
    }
    if (anzahlPorts > 2) {
      Port3.show();
    } else {
      Port3.hide();
    }
    if (anzahlPorts > 3) {
      Port4.show();
    } else {
      Port4.hide();
    }
    if (anzahlPorts > 4) {
      Port5.show();
    } else {
      Port5.hide();
    }
    if (anzahlPorts > 5) {
      Port6.show();
    } else {
      Port6.hide();
    }
  } else if (page == -2) {
    SensorAuswahl();
  } else if (page == -3) {
    //Feinstaub();
    alle_Sensoren.hide();
    Stationen.hide();
  } else if (page == -5) {
    alleSensoren2();
    alle_Sensoren.hide();
    Stationen.hide();
  } else if (page == -6) {
    alleSensoren();
    alle_Sensoren.hide();
    alle_Sensoren2.hide();
    Stationen.hide();
  } else if (page == -7) {
    Tutorial0();
    time_tutorial = millis();
  } else if (page == -7.1) {
    Tutorial1();
  } else if (page == -7.11) {
    Tutorial2();
  } else if (page == -7.111) {
    Tutorial3();
  } else if (page == -7.1111) {
    Tutorial4();
  } else if (page == -7.11111) {
    Tutorial5();
  } else if (page == -7.111111) {
    Tutorial6();
  } else if (page == -7.2) {
    Tutorial7();
  } else if (page == -7.22) {
    Tutorial8();
  } else if (page == -7.222) {
    Tutorial9();
  }


  if (page != 10) {
    Port1.hide();
    Port2.hide();
    Port3.hide();
    Port4.hide();
    Port5.hide();
    Port6.hide();
  }

  if (Port1.isClicked()) {
    ausgewaehlterPort = 0;
    gotSerial = false;
  } else if (Port2.isClicked()) {
    ausgewaehlterPort = 1;
    gotSerial = false;
  } else if (Port3.isClicked()) {
    ausgewaehlterPort = 2;
    gotSerial = false;
  } else if (Port4.isClicked()) {
    ausgewaehlterPort = 3;
    gotSerial = false;
  } else if (Port5.isClicked()) {
    ausgewaehlterPort = 4;
    gotSerial = false;
  } else if (Port6.isClicked()) {
    ausgewaehlterPort = 5;
    gotSerial = false;
  }
  if (back.isClicked()) {
    if (auto == "speichern bei 'zurück") {
      saveData();
    }
    if (page > 0 && page != 10) {
      if (page == 1.1 || page == 1.11 || page == 1.111 || page == 1.1111) {
        Station1Start = false;
        page = 1;
      } else if (page == 1.11111) {
        page = 1.1111;
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
      } else if (page == 4.1111) {
        page = 4.111;
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
    page = 1.1;
  }

  if (station1_trocken.isClicked()) {
    page = 1.11;
  }

  if (station1_nass.isClicked()) {
    page = 1.111;
  }
  if (zur_Auswertung2.isClicked()) {
    page = 1.1111;
  }
  if (zur_Auswertung3.isClicked()) {
    page = 1.11111;
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
    tagesIndex = 0;
    zeroTime2 = millis();
    table.clearRows();
  }
  if (sicher_nein.isClicked()) {
    reset_bool = false;
  }
  if (aktualisierung_right.isClicked()) {
    if (del < 5) {
      del += 1;
    } else if (del < 20) {
      del += 5;
    } else if (del < 30) {
      del += 10;
    } else if (del < 120) {
      del += 30;
    } else if (del < 300) {
      del += 60;
    }
  }
  if (aktualisierung_left.isClicked()) {
    if (del > 120) {
      del -= 60;
    } else if (del > 30) {
      del -= 30;
    } else if (del > 20) {
      del -= 10;
    } else if (del > 5) {
      del -= 5;
    } else if (del > 0) {
      del -= 1;
    }
  }

  if (einstellungen.isClicked()) {
    page = 10;
  }
  if (station1_MessungStarten.isClicked()) {
    Station1Start = true;
    time_station1 = millis();
    if (page == 1.1) {
      zeroTime3 = millis();
    } else if (page == 1.11) {
      zeroTime4 = millis();
    } else if (page == 1.111) {
      zeroTime5 = millis();
    }
  }

  if (station1_weiter_ab.isClicked()) {
    page = 1.11;
    station1_weiter_ab.hide();
    Station1Start = false;
  }
  if (station1_weiter_bc.isClicked()) {
    page = 1.111;
    station1_weiter_bc.hide();
  }
  if (station1_zur_Auswertung.isClicked()) {
    page = 1.1111;
  }

  if (tutorial_ueberspringen.isClicked()) {
    page = -1;
  }
  if (tutorial_zum.isClicked()) {
    page = -7;
  }

  if (station1_MessungWiederholen.isClicked()) {
    Station1Start = true;
    time_station1 = millis();
    if (page == 1.1) {
      zeroTime3 = millis();
      indexStation1 = 0;
      station1_referenz_abgeschlossen = false;
    }
    if (page == 1.11) {
      zeroTime4 = millis();
      indexStation1_trocken = 0;
      station1_trocken_abgeschlossen = false;
    }
    if (page == 1.111) {
      zeroTime5 = millis();
      indexStation1_nass = 0;
      station1_nass_abgeschlossen = false;
    }
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

  if (tutorial_reset.isClicked()) {
    reset_bool_tutorial = true;
  }

  if (reset_bool_tutorial) {
    sicher_tutorial();
    if (sicher_ja_reset.isClicked()) {
      start_time_tutorial = millis();
      reset_bool_tutorial = false;
      tutorial_resettet = true;
    }
    if (sicher_nein_reset.isClicked()) {
      reset_bool_tutorial = false;
    }
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


  if (Station4Auswertung.isClicked()) {
    delay(200);
    page = 4.1111;
    saveDataInnenraum();
    reset_bool = false;
  }
  if (Station4c.isClicked()) {
    delay(200);
    page = 4.111;
  }
  if (Station4b.isClicked()) {
    delay(200);
    page = 4.11;
  }
  if (Station4a.isClicked()) {
    delay(200);
    page = 4.1;
  }

  if (zur_Auswertung3.isClicked()) {
    page = 1.11111;
  }

  if (start_stopp.isClicked()) {
    if (measure) {
      measure = false;
    } else {
      measure = true;
    }
  }


  if (alle_Sensoren2.isClicked()) {
    page = -5;
  }


  if (tutorial_weiter.isClicked()) {
    if (page == -7.222) {
      page = -1;
    }
    if (page == -7.22) {
      page = -7.222;
    }
    if (page == -7.2) {
      page = -7.22;
    }
    if (page == -7.111111) {
      page = -7.2;
    }
    if (page == -7.11111) {
      page = -7.111111;
    }
    if (page == -7.1111) {
      page = -7.11111;
    }
    if (page == -7.111) {
      page = -7.1111;
    }
    if (page == -7.11) {
      page = -7.111;
    }
    if (page == -7.1) {
      page = -7.11;
    }
    if (page == -7) {
      page = -7.1;
    }
  }


  if (tutorial_back.isClicked()) {
    if (page == -7.1) {
      page = -7;
    }
    if (page == -7.11) {
      page = -7.1;
    }
    if (page == -7.111) {
      page = -7.11;
    }
    if (page == -7.1111) {
      page = -7.111;
    }
    if (page == -7.11111) {
      page = -7.1111;
    }
    if (page == -7.111111) {
      page = -7.11111;
    }
    if (page == -7.2) {
      page = -7.111111;
    }
    if (page == -7.22) {
      page = -7.2;
    }
    if (page == -7.222) {
      page = -7.22;
    }
  }

  if (tutorial_Start_Stopp.isClicked()) {
    if (tutorial_Start) {
      tutorial_Start = false;
    } else {
      tutorial_Start = true;
      if (tutorial_Start_first_time == false) {
        start_time_tutorial = millis();
        tutorial_Start_first_time = true;
      }
    }
  }


  if (setBaseline.isClicked()) {
    myPort.write("\n"); //set Baseline
  }
}

boolean reset_bool = false;
boolean reset_bool_tutorial = false;
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

void sicher_tutorial() {
  fill(255, 100, 100);
  rect(225, 250, 830, 200);
  fill(0);
  textSize(30);
  textAlign(CORNER);
  text("Bist du sicher, dass du die Daten löschen möchtest?", 250, 300);
  sicher_ja_reset.show();
  sicher_nein_reset.show();
}

void saveDataInnenraum() {

  String[] T_a = new String[indexInnenraumlufta + indexInnenraumluftb + indexInnenraumluftc];
  String[] H_a = new String[indexInnenraumlufta + indexInnenraumluftb + indexInnenraumluftc];
  String[] TVOC_a = new String[indexInnenraumlufta + indexInnenraumluftb + indexInnenraumluftc];
  String[] CO2_a = new String[indexInnenraumlufta + indexInnenraumluftb + indexInnenraumluftc];
  String[] eCO2_a = new String[indexInnenraumlufta + indexInnenraumluftb + indexInnenraumluftc];

  String txt_ = dateiformat.name;

  if (txt_ == "Format: .txt" || txt_ == "Format: .csv") {
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

  if (txt_ == "Format: .txt") {
    saveStrings("Messdaten/" + day() + "_" + month() + "_" + year()+ "/Innenraum/Temperatur.txt", T_a);
    saveStrings("Messdaten/" + day() + "_" + month() + "_" + year()+"/Innenraum/Luftfeuchte.txt", H_a);
    saveStrings("Messdaten/" + day() + "_" + month() + "_" + year()+"/Innenraum/CO2.txt", CO2_a);
    saveStrings("Messdaten/" + day() + "_" + month() + "_" + year() +"/Innenraum/TVOC.txt", TVOC_a);
    saveStrings("Messdaten/" + day() + "_" + month() + "_" + year() +"/Innenraum/eCO2.txt", eCO2_a);
  }

  if (txt_ == "Format: .csv") {
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


int tagesIndex = 0;




void saveData() {


  String[] SCD_T = new String[floor(86400/del)];
  String[] SCD_H = new String[floor(86400/del)];
  String[] SCD_CO2 = new String[floor(86400/del)];

  String[] SGP_TVOC = new String[floor(86400/del)];
  String[] SGP_eCO2 = new String[floor(86400/del)];

  String[] SPS_PM1 = new String[floor(86400/del)];
  String[] SPS_PM25 = new String[floor(86400/del)];
  String[] SPS_PM4 = new String[floor(86400/del)];
  String[] SPS_PM10 = new String[floor(86400/del)];

  String[] Zeit = new String[floor(86400/del)];


  String txt_ = dateiformat.name;

  if (txt_ == "Format: .txt" || txt_ == "Format: .csv") {
    for (int i = 0; i < tagesIndex; i++) {
      SCD_T[i] = str(scd_temperature_data[index - tagesIndex + i]).replace('.', ',');
      SCD_H[i] = str(scd_humidity_data[index - tagesIndex + i]).replace('.', ',');
      SCD_CO2[i] = str(scd_co2_data[index - tagesIndex + i]).replace('.', ',');

      SGP_TVOC[i] = str(sgp_tvoc_data[index - tagesIndex + i]).replace('.', ',');
      SGP_eCO2[i] = str(sgp_eco2_data[index - tagesIndex + i]).replace('.', ',');

      SPS_PM1[i] = str(sps_pm1_data[index - tagesIndex + i]).replace('.', ',');
      SPS_PM25[i] = str(sps_pm25_data[index - tagesIndex + i]).replace('.', ',');
      SPS_PM4[i] = str(sps_pm4_data[index - tagesIndex + i]).replace('.', ',');
      SPS_PM10[i] = str(sps_pm10_data[index - tagesIndex + i]).replace('.', ',');

      Zeit[i] = str((zeit[index - tagesIndex + i]) - zeit[index - tagesIndex]).replace('.', ',');
    }
  }

  if (txt_ == "Format: .txt") {
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

  if (txt_ == "Format: .csv") {
    table.clearRows();
    println("SAVED");
    for (int i = 0; i < tagesIndex; i++) {
      if (zeit[index-1] != 0) {
        TableRow newRow = table.addRow();
        newRow.setInt("Zeit", i);
        newRow.setFloat("Zeit", (zeit[index - tagesIndex + i] - zeit[index - tagesIndex]));
        newRow.setFloat("Temperatur", scd_temperature_data[index - tagesIndex + i]);
        newRow.setFloat("Luftfeuchte", scd_humidity_data[index - tagesIndex + i]);
        newRow.setFloat("CO2", scd_co2_data[index - tagesIndex + i]);
        newRow.setFloat("eCO2", sgp_eco2_data[index - tagesIndex + i]);
        newRow.setFloat("TVOC", sgp_tvoc_data[index - tagesIndex + i]);
        newRow.setFloat("PM1", sps_pm1_data[index - tagesIndex + i]);
        newRow.setFloat("PM2.5", sps_pm25_data[index - tagesIndex + i]);
        newRow.setFloat("PM4", sps_pm4_data[index - tagesIndex + i]);
        newRow.setFloat("PM10", sps_pm10_data[index - tagesIndex + i]);
        try {
          saveTable(table, "Messdaten/" + day() + "_" + month() + "_" + year() + "um" + hour() + "_" + minute()+ "Uhr/alleDaten.csv");
        }
        catch(Exception e) {
          delay(1000);
        }
      }
    }
  }
}



void exit() {
  table.clearRows();
  int temp = 0;
  if (autosave.name == "nicht speichern") {
    temp = index;
    tagesIndex = index;
  } else {
    temp = tagesIndex;
  }


  for (int i = 0; i < temp; i++) {
    if (zeit[index-1] != 0) {
      TableRow newRow = table.addRow();

      newRow.setInt("Zeit", i);
      newRow.setFloat("Zeit", (zeit[index - tagesIndex + i] - zeit[index - tagesIndex]));
      newRow.setFloat("Temperatur", scd_temperature_data[index - tagesIndex + i]);
      newRow.setFloat("Luftfeuchte", scd_humidity_data[index - tagesIndex + i]);
      newRow.setFloat("CO2", scd_co2_data[index - tagesIndex + i]);
      newRow.setFloat("eCO2", sgp_eco2_data[index - tagesIndex + i]);
      newRow.setFloat("TVOC", sgp_tvoc_data[index - tagesIndex + i]);
      newRow.setFloat("PM1", sps_pm1_data[index - tagesIndex + i]);
      newRow.setFloat("PM2.5", sps_pm25_data[index - tagesIndex + i]);
      newRow.setFloat("PM4", sps_pm4_data[index - tagesIndex + i]);
      newRow.setFloat("PM10", sps_pm10_data[index - tagesIndex + i]);
      try {
        saveTable(table, "Messdaten/" + day() + "_" + month() + "_" + year() + "um" + hour() + "_" + minute()+ "Uhr/alleDaten.csv");
      }
      catch(Exception e) {
        delay(1000);
      }
    }
  }
  super.exit();
}
