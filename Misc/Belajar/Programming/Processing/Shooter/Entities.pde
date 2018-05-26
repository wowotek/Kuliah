public class PlayerShip{
  public PVector pos;
  
  public PlayerShip(float initX, float initY){
    this.pos = new PVector(initX, initY);
  }
  
  public void update(){
    shipImage();
    if(keyPressed){
      if(key == ' '){
        this.shoot();
      }
    }
    shipControl();
    
    for(int i = 0; i<bullets.size()-1; i++){
      bullets.get(i).update();
      if(bullets.get(i).isOffScreen()){
        bullets.remove(i);
      }
    }
    
    _fr -= 0.1;
  }
  
  float current = 1;
  private void shipControl(){
    PVector vel = new PVector(mouseX, mouseY);
    vel.sub(this.pos);
    this.pos.add(vel);
    
    if(current >= 2) current = 1;
    else current += 0.01;
  }
  
  private void shipImage(){
    noStroke();
    fill(170);
    triangle(this.pos.x + 15, this.pos.y, this.pos.x - 5, this.pos.y - 7, this.pos.x -5, this.pos.y + 7);
  }
  
  private ArrayList<Bullet> bullets = new ArrayList();
  private int fireRate = 5;
  private int _fr = fireRate;
  private void shoot(){
    if(_fr <= 0){
      bullets.add(new Bullet(this.pos.x + 10, this.pos.y));
      _fr = fireRate;
    }
  }
}

private class Bullet{
  public float x, y;
  public Bullet(float initX, float initY){
    this.x = initX;
    this.y = initY;
  }
  
  public void update(){
    this.x += 3;
    this.render();
  }
  
  private void render(){
    stroke(255, 31, 0);
    strokeWeight(3);
    line(this.x, this.y, this.x + 3, this.y);
  }
  
  public boolean isOffScreen(){
    if(this.x >= width + 30){
      return true;
    }
    else return false;
  }
}
