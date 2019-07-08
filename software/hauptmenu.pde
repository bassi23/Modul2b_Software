boolean[] connected = {false, false, false};


void hauptmenu() {
  stroke(0);
  one.show();
  two_three.show();
  four.show();
  settings.show();
  
  image(sps, 150, 100);
  image(sgp, 620, 120);
  image(scd, 150, 470);
  image(nodemcu, 600, 400);
    checkConnection();

  fill(0);
  textSize(20);
  text("Station 1 - Feinstaubmessung", 60, 70);
  text("Station 2 - Mensch vs. Sensor", 460, 70);
  text("Station 3 - TVOC-Duelle", 460, 100);
  text("Station 4 - Innenraumluftqualität", 60, 640);
  text("Einstellungen", 460, 640);

  strokeWeight(5);
  noFill();

  if (two_three.isOver()) {
    stroke(255);
    line(646, 232, 646, 300);
    line(646, 300, 550, 300);
    line(550, 300, 550, 562);
    line(550, 562, 600, 562);

    stroke(0);
    line(682, 232, 682, 320);
    line(682, 320, 580, 320);
    line(580, 320, 580, 549);
    line(580, 549, 600, 549);

    stroke(255, 0, 0);
    line(701, 232, 701, 320);
    line(701, 320, 750, 320);
    line(750, 320, 750, 445);
    line(750, 445, 730, 445);

    stroke(255, 255, 0);
    line(720, 232, 720, 300);
    line(720, 300, 780, 300);
    line(780, 300, 780, 455);
    line(780, 455, 730, 455);
    
    
    noStroke();
    fill(0);
    textSize(20);
    text("Station 2 - Mensch vs. Sensor", 880, 70);
    text("Wie gut ist deine Nase? Finde es heraus\nund tritt gegen einen Sensor an.\nOrdne 5 verschiedene Ethanolkonzen-\ntrationen der Größe nach an.", 880, 120);
    text("Station 3 - TVOC-Duelle", 880, 300);
    text("Coole Beschreibung für das Experiment", 880, 350);
  }


  if (four.isOver()) {
    stroke(255);
    line(341, 470, 342, 458);
    line(341, 458, 600, 458);

    stroke(0);
    line(327, 470, 327, 444);
    line(327, 444, 600, 444);

    stroke(255, 0, 0);
    line(313, 470, 313, 390);
    line(313, 390, 760, 390);
    line(760, 390, 760, 445);
    line(760, 445, 730, 445);

    stroke(255, 255, 0);
    line(298, 470, 298, 370);
    line(298, 370, 780, 370);
    line(780, 370, 780, 455);
    line(780, 455, 730, 455);
  }

  if (one.isOver()) {
    stroke(0);
    line(160, 300, 160, 444);
    line(175, 300, 175, 444);
    line(160, 444, 600, 444);


    stroke(255);
    line(220, 300, 220, 380);
    line(220, 380, 550, 380);
    line(550, 380, 550, 438);
    arc(550, 448, 20, 20, PI/2, 3*PI/2);
    line(550, 458, 600, 458);

    stroke(255, 0, 0);
    line(190, 300, 190, 420);
    line(190, 420, 530, 420);
    line(530, 420, 530, 390);

    arc(530, 380, 20, 20, PI/2, 3*PI/2);
    line(530, 370, 530, 350);
    line(530, 350, 760, 350);
    line(760, 350, 760, 445);
    line(760, 445, 730, 445);


    stroke(255, 255, 0);
    line(205, 300, 205, 400);
    line(205, 400, 500, 400);
    line(500, 400, 500, 390);
    arc(500, 380, 20, 20, PI/2, 3*PI/2);
    line(500, 370, 500, 330);
    line(500, 330, 780, 330);
    line(780, 330, 780, 455);
    line(780, 455, 730, 455);


    //Widerstände
    strokeWeight(3);
    stroke(104,54,26);
    fill(104,64,26);
    line(350, 420, 350, 380);
    line(330, 400, 330, 380);

    rect(347, 394, 5, 9);
    rect(327, 386, 5, 9);
    text("R = 10 kΩ", 305, 370);
    
    
  }


  strokeWeight(1);
}
