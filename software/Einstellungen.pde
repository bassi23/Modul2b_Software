void setting() {
  Aufloesung.show();
  connect.show();
  error_bars.show();
  freie_stationen.show();
  textSize(30);
  fill(0);
  reconnect();


  textSize(20);
  text("Daten speichern", 50, 50);
  text("Messwerte", 50, 200);
  text("Fehlerbalken", 1050, 200);
  text("COM-Port", 50, 350);
  text("Auflösung", 50, 500);
text("Stationen freigeben", 1050, 500);



  stroke(0);
  strokeWeight(4);
  line(800, 350 + 50*ausgewaehlterPort, 900, 350 + 50*ausgewaehlterPort);
  line(800, 350 + 50*ausgewaehlterPort, 825, 340 + 50*ausgewaehlterPort);
  line(800, 350 + 50*ausgewaehlterPort, 825, 360 + 50*ausgewaehlterPort);

  if (Aufloesung.name == "Niedrig (800x450)") {
    scale_factor = 0.625;
  } else if (Aufloesung.name == "Mittel (1024x600)") {
    scale_factor = 0.8;
  } else if (Aufloesung.name == "Standard (1280x720)") {
    scale_factor = 1;
  } else if (Aufloesung.name == "Hoch (1440x810)") {
    scale_factor = 1.125;
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
