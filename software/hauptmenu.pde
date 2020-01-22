boolean[] connected = {false, false, false};


void hauptmenu() {
  stroke(0);
  one.show();
  two.show();
  four.show();
  three.show();


  two_a.hide();
  two_b.hide();

  fill(0);
  textSize(20);
  strokeWeight(5);
  noFill();


  if (one.isOver()) {
    strokeWeight(2);
    fill(0);
    textFont(bold);
    text("Station 1 - Test der Sensoren", 700, 50);
    strokeWeight(1);
    textFont(normal);
    noStroke();
    text("Führe verschiedene Tests durch, um die Funktion zu\ntesten!", 700, 120);
    
    image(Vorschau_Station1, 700, 250);
  }


  if (four.isOver()) {
    strokeWeight(2);
    fill(0);
    textFont(bold);
    text("Station 4 - Feinstaub", 700, 50);
    strokeWeight(1);
    textFont(normal);
    noStroke();
    text("Sollte man die Schultafel lieber nass abwischen? Unter-\nsuche die Feinstaubemission von trockenen und nassen\nSchwämmen!", 700, 120);
    image(Vorschau_Station4, 700, 250);
  }

  if (two.isOver()) {
    fill(0);
    textSize(20);
    stroke(0);
    strokeWeight(2);
    textFont(bold);
    text("Station 2a - Mensch vs. Sensor", 700, 50);
    text("Station 2b - TVOC-Duelle", 700, 300);
    strokeWeight(1);
    textFont(normal);
    noStroke();
    text("Wie gut ist deine Nase? Finde es heraus und trete gegen\neinen Sensor an.\nOrdne 5 verschiedene Ethanolkonzentrationen der Größe\nnach an.", 700, 120);
    textFont(bold);
    textFont(normal);
    text("Untersuche Alltagsgegenstände auf ihre Emission von\nSchadstoffen.", 700, 350);
    image(Vorschau_Station2, 700, 400);
  }


  if (three.isOver()) {
    strokeWeight(2);
    textFont(bold);
    text("Station 3 - Dicke Luft", 700, 50);
    strokeWeight(1);
    textFont(normal);
    noStroke();
    text("Setze dich in eine Messkammer, und untersuche, wie sich\ndie Luftqualität ändert.", 700, 120);
    image(Vorschau_Station3, 700, 250);
  }
  strokeWeight(3);
  stroke(0);
  line(620, 0, 620, 720);
}
