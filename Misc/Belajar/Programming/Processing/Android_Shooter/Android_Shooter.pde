private Player player;
private Enemies enemy;
private Background bg;

void setup(){
  fullScreen();
  noStroke();
  bg = new Background();
  player = new Player(width/2, height - 80);
  enemy = new Enemies();
}

void draw(){
  bg.render();
  player.render();
  enemy.renderEnemy();
}
