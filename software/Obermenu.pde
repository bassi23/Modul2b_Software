void Obermenu() {
  two_three.active = false;
  four.active = false;
  one.active = false;
  settings.active = false;
  two.active = false;
  three.active = false;



  image(LMT, 200, 600);
  image(iPhysicsLab, 400, 600);
  image(DBU, 1100, 550);
  image(SFZSLS, 700, 600);
  back.hide();

  Stationen.show();
  Sensoren.show();

  fill(0);
  textSize(30);
  textAlign(CENTER);
  text("Umweltmesstechnik", 640, 50);
}
