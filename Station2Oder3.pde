void Station2Oder3() {
  two_a.show();
  two_b.show();
  one.hide();
  two.hide();
  three.hide();
  four.hide();

  textSize(20);
  fill(0);
  //text("Station 2a - Mensch vs. Sensor", 220, 250);
  //text("Station 2b - TVOC-Duelle", 670, 250);
  
  //image(Vorschau_Station2a, 220, 300);
  //image(Vorschau_Station2b, 710, 300);


  A = new Probe(355, 260, "A", true, false);
  B = new Probe(505, 260, "B", true, false);
  C = new Probe(655, 260, "C", true, false);
  D = new Probe(805, 260, "D", true, false);
  E = new Probe(955, 260, "E", true, false);


  A.x = 355*scale_factor;
  A.y = 530*scale_factor;
  B.x = 505*scale_factor;
  B.y = 530*scale_factor;
  C.x = 655*scale_factor;
  C.y = 530*scale_factor;
  D.x = 805*scale_factor;
  D.y = 530*scale_factor;
  E.x = 955*scale_factor;
  E.y = 530*scale_factor;
  A2.x = 355*scale_factor;
  A2.y = 640*scale_factor;
  B2.x = 505*scale_factor;
  B2.y = 640*scale_factor;
  C2.x = 655*scale_factor;
  C2.y = 640*scale_factor;
  D2.x = 805*scale_factor;
  D2.y = 640*scale_factor;
  E2.x = 955*scale_factor;
  E2.y = 640*scale_factor;
}
