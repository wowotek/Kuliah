public class Player{
  public float x;
  public float y;
  
  public Player(float initX, float initY){
    this.x = initX;
    this.y = initY;
    
    renderShip();
    renderBullets();
  }
  
  public void render(){
    this.shootCounter += 1;
    renderShip();
    renderBullets();
    
    if(mousePressed){
      this.shoot();
    }
  }
  
  private void renderShip(){
    this.x = mouseX;
    noStroke();
    fill(0, 255, 0);
    beginShape();
    vertex(this.x, this.y);
    vertex(this.x - 15, this.y + 15);
    vertex(this.x, this.y - 30);
    vertex(this.x + 15, this.y + 15);
    endShape();
  }
  
  private void renderBullets(){
    for(Bullet i: bullets){
      if(i.y <= height + 20){
        i.y -= 10;
        i.renderBullet();
      } else {
        i.y = this.y - 30;
        i.renderBullet();
      }
    }
  }
    
  private ArrayList<Bullet> bullets = new ArrayList<Bullet>();
  private int shootCounter = 0;
  private int fireRate = 4;
  public void shoot(){
    if(shootCounter % fireRate == 0){
      this.shootCounter = 0;
      this.bullets.add(new Bullet(this.x, this.y - 30));
    }
  }
}

private class Bullet{
  public float x;
  public float y;
  
  private Bullet(float initX, float initY){
    this.x = initX;
    this.y = initY;
  }
  
  private void renderBullet(){
    strokeWeight(3);
    color(255, 0, 0);
    stroke(255, 103, 0);
    line(this.x, this.y, this.x, this.y + 10);
    noStroke();
  }
}
