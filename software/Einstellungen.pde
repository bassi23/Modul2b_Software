void setting() {
  Aufloesung.show();
  // connect.show();
  // error_bars.show();
  freie_stationen.show();
  setBaseline.show();
  strichdicke.show();
  textSize(30);
  fill(0);
  reconnect();
  tutorial_zum.hide();

  textSize(20);
  text("Daten speichern", 50, 50);
  text("Strichdicke", 50, 120);
  text(nf(day(), 2, 0) + "." + nf(month(), 2, 0) + "." + nf(year(), 4, 0) + " " + nf(hour(), 2, 0) + ":" + nf(minute(), 2, 0) + ":" + nf(second(), 2, 0), 1040, 50);
  text("COM-Port", 50, 350);
  text("Auflösung", 50, 500);
  text("Stationen freigeben", 1050, 500);


  text("Kalibrierung Station 2.2", 50, 600);
  Kalibrierung2_2.show(Kalibrierung_Station2_2);
  textSize(16);
  text("nicht wahrnehmbar: 0 - " + 60/float(Kalibrierung_Station2_2) + "\nsehr schwach: " + 60/float(Kalibrierung_Station2_2) + " - " + 3*60/float(Kalibrierung_Station2_2)+ "\nschwach: " + 3*60/float(Kalibrierung_Station2_2) + " - " + 5*60/float(Kalibrierung_Station2_2)+ "\ndeutlich: " + 5*60/float(Kalibrierung_Station2_2) + " - " + 7*60/float(Kalibrierung_Station2_2)+ "\nstark: " + 7*60/float(Kalibrierung_Station2_2) + " - " + 9*60/float(Kalibrierung_Station2_2)+ "\nsehr stark: " + 9*60/float(Kalibrierung_Station2_2) + " - " + 11*60/float(Kalibrierung_Station2_2) + "\nextrem stark: > " +11*60/float(Kalibrierung_Station2_2), 630, 550);
  //new Textfield22(350, 565, 100, 50, Kalibrierung_Station2_2, true);
  textSize(20);

  textAlign(CORNER);
  if (BaselineString[4] == "0000") {
    text("eCO2-Baseline: " + BaselineString[0]  + ";     TVOC-Baseline: " + BaselineString[1], 250, 250);
  } else {
    text("eCO2-Baseline: " + BaselineString[0]  + ";     TVOC-Baseline: " + BaselineString[1] + "     (gesetzt am " + BaselineString[2] + "." +  BaselineString[3] + "." +  BaselineString[4] + " um " +  BaselineString[5] + ":" +  BaselineString[6] + " Uhr)", 250, 250);
  }

  stroke(0);
  strokeWeight(4);
  line(800, 350 + 40*ausgewaehlterPort, 900, 350 + 40*ausgewaehlterPort);
  line(800, 350 + 40*ausgewaehlterPort, 825, 340 + 40*ausgewaehlterPort);
  line(800, 350 + 40*ausgewaehlterPort, 825, 360 + 40*ausgewaehlterPort);

  if (Aufloesung.name == "Niedrig (800x450)") {
    scale_factor = 0.625;
    surface.setSize(800, 450);
  } else if (Aufloesung.name == "Mittel (1024x600)") {
    scale_factor = 0.8;
    surface.setSize(1024, 600);
  } else if (Aufloesung.name == "Standard (1280x720)") {
    scale_factor = 1;
    surface.setSize(1280, 720);
  } else if (Aufloesung.name == "Hoch (1440x810)") {
    scale_factor = 1.125;
    surface.setSize(1440, 810);
  } else if (Aufloesung.name == "Fullscreen") {
    float w = displayWidth;
    float h = displayHeight - 75;

    float frac = w/h;

    if (frac > 1.7777) {
      w = 1.777*h;
    } else if (frac <= 1.7777) {
      h = w/1.777;
    }

    scale_factor = w/1280;
    surface.setSize(floor(w), floor(h));
  }
  strokeWeight(1);
  stroke(0);
  line(0, 170, 1280, 170);
  line(0, 320, 1280, 320);
  line(0, 470, 1280, 470);
  autosave.show();
  dateiformat.show();
}
float aufloesung_index = 0;
float scale_factor = 1;

void reconnect() {
  for (int i = 0; i < Serial.list().length; i++) {
    text("COM [" + Serial.list()[i] + "]", 350, 360 + 50*i);
  }
}

float scroll = 0;

//void mouseWheel(MouseEvent event){
//  scroll -= event.getCount()*10;
//  if(scroll < -300){
//   scroll = -300; 
//  }
//  if(scroll > 0){
//   scroll = 0; 
//  }
//}





class Aufgabentext {
  String text;
  float breite, x, y, hoehe;
  String[] newText = new String[100];


  Aufgabentext(String text_, float x_, float y_, float breite_, float hoehe_) {
    text = text_;
    breite = breite_;
    hoehe = hoehe_;
    x = x_;
    y = y_;
    newText = split(text, " ");

    float len = 0;
    for (int i = 0; i < newText.length; i++) {
      len = len + 2*textWidth(newText[i]);

      if (len > breite - 90) {
        len = 0;
        newText[i] = newText[i] + "\n";
      }
    }
    text = "";
    for (int i = 0; i < newText.length; i++) {
      if (newText[i] != "\n") {
        text += newText[i] + " ";
      } else {
        text += newText[i];
      }
    }
  }


  void show() {
    // 1. Box mit abgerundeten Ecken
    fill(150, 150, 255, 100);
    noStroke();
    bezierRect(x, y, breite, hoehe, 5, 5);
    fill(0);

    // Aufzählungszeichen
    stroke(0);
    beginShape();
    fill(255);
    vertex(x + 30, y + 22);
    vertex(x + 45, y + 27);
    vertex(x + 35, y + 27);
    vertex(x + 30, y + 22);    
    endShape();
    beginShape();
    fill(0);
    vertex(x + 30, y + 32);
    vertex(x + 45, y + 27);
    vertex(x + 35, y + 27);
    vertex(x + 30, y + 32);    
    endShape();

    noStroke();
    fill(0);
    textSize(20);
    text(text, x + 60, y + 35);
  }
}


void bezierRect(float x, float y, float w, float h, float xr, float yr) {
  float w2=w/2f, h2=h/2f, cx=x+w2, cy=y+h2;
  beginShape();
  vertex(cx, cy-h2);
  bezierVertex(cx+w2-xr, cy-h2, cx+w2, cy-h2+yr, cx+w2, cy);
  bezierVertex(cx+w2, cy+h2-yr, cx+w2-xr, cy+h2, cx, cy+h2);
  bezierVertex(cx-w2+xr, cy+h2, cx-w2, cy+h2-yr, cx-w2, cy);
  bezierVertex(cx-w2, cy-h2+yr, cx-w2+xr, cy-h2, cx, cy-h2);
  endShape();
}
