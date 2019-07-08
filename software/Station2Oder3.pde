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
