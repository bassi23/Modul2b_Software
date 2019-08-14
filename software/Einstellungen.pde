void setting() {
  Aufloesung.show();
  textSize(30);
  fill(0);
  text("Autosave", 300, 200);
  text("Speichern als", 250, 250);
  text(".txt          .csv", 550, 250);
  reconnect();

  stroke(0);
  strokeWeight(4);
  line(800, 290 + 50*ausgewaehlterPort, 900, 290 + 50*ausgewaehlterPort);
  line(800, 290 + 50*ausgewaehlterPort, 825, 265 + 50*ausgewaehlterPort);
  line(800, 290 + 50*ausgewaehlterPort, 825, 315 + 50*ausgewaehlterPort);

  if (Aufloesung.name == "Niedrig (800x450)") {
    scale_factor = 0.625;
  } else if (Aufloesung.name == "Mittel (1024x600)") {
    scale_factor = 0.8;
  } else if (Aufloesung.name == "Standard (1280x720)") {
    scale_factor = 1;
  } else if (Aufloesung.name == "Hoch (1440x810)") {
    scale_factor = 1.125;
  }
}
float aufloesung_index = 0;
float scale_factor = 1;

void reconnect() {
  for (int i = 0; i < Serial.list().length; i++) {
    text("COM [" + Serial.list()[i] + "]", 500, 300 + 50*i);
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



void mousePressed() {
}
