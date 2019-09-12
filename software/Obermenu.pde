void Obermenu() {
  two_three.active = false;
  four.active = false;
  one.active = false;
  settings.active = false;
  two.active = false;
  three.active = false;



  image(LMT, 200, 605);
  image(iPhysicsLab, 350, 605);
  image(DBU, 890, 555);
  image(SFZSLS, 580, 605);
  back.hide();
  tutorial_zum.show();
  Stationen.show();
  Sensoren.show();

  fill(0);
  textSize(30);
  textAlign(CENTER);
  text("Umweltmesstechnik", 640, 50);
}
