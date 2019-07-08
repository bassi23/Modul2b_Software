void setting(){
  textSize(30);
  fill(0);
  text("Autosave", 300, 200);
  text("Speichern als", 250, 250);
  text(".txt          .csv", 550, 250);
  reconnect();
}


void reconnect(){
 for(int i = 0; i < Serial.list().length; i++){
  text("COM [" + Serial.list()[i] + "]", 500, 300 + 20*i); 
 }
  
}
