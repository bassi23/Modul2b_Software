void SensorAuswahl() {
  textAlign(CENTER);
  textSize(30);
  fill(0);
  text("Status der Sensoren", 220, 50);
  textSize(25);
  text("Messwert gegen Zeit auftragen", 870, 50);
  text("Messwert gegen Messwert auftragen", 870, 350);
  textAlign(CORNER);
  textSize(20);
  text("SCD30 (Temperatur, Luftfeuchte, CO )", 20, 110);
  text("SGP30 (TVOC, eCO )", 20, 330);
  text("SPS30 (Feinstaub)", 20, 550);
  stroke(0);
  line(450, 0, 450, 720);
  line(0, 80, 450, 80);
  line(0, 300, 450, 300);
  line(0, 520, 450, 520);

  back.show();
  SPS30.hide();
  SCD30.hide();
  SGP30.hide();
  //reset.hide();
checkConnection();
}
