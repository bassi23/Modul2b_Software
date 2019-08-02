void setting(){
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
}


void reconnect(){
 for(int i = 0; i < Serial.list().length; i++){
  text("COM [" + Serial.list()[i] + "]", 500, 300 + 50*i); 
 }
  
}
