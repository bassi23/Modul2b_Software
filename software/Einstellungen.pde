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


  textSize(20);
  text("Daten speichern", 50, 50);
  text("Strichdicke", 50, 50);
  text(nf(day(),2,0) + "." + nf(month(),2,0) + "." + nf(year(),4,0) + " " + nf(hour(),2,0) + ":" + nf(minute(),2,0) + ":" + nf(second(),2,0), 1040, 50);
  text("COM-Port", 50, 350);
  text("Auflösung", 50, 500);
  text("Stationen freigeben", 1050, 500);

if(BaselineString[4] == "0000"){
   text("eCO2-Baseline: " + BaselineString[0]  + ";     TVOC-Baseline: " + BaselineString[1], 250, 250);
}else{
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
