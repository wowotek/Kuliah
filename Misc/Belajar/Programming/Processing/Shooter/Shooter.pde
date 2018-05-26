PlayerShip ship;
int dir;

void setup(){
  size(800, 400);
  ship = new PlayerShip(80, height/2);
}

void draw(){
  background(51);
  ship.update();
}
