public class Enemies{
  private final int numOfEnemy = 10;
  private ArrayList<Enemy> musuh = new ArrayList<Enemy>();
  
  public Enemies(){
    for(int i = 0; i < numOfEnemy; i++ ){
      Enemy temp = new Enemy(int(random(10, width - 10)), int(random(10, height - 10)));
      musuh.add(temp);
      temp.render();
    }
  }
  
  public void renderEnemy(){
    for(Enemy i: this.musuh){
      i.render();
    }
  }
}

private class Enemy{
  private float x;
  private float y;
  private float targetX;
  private float targetY;
  
  private Enemy(float initX, float initY){
    this.x = initX;
    this.y = initY;
    
    newTargetPosition();
    renderTarget();
  }
  
  private void render(){
    noStroke();
    fill(164, 31, 6);
    beginShape();
    vertex(this.x, this.y);
    vertex(this.x - 10, this.y - 10);
    vertex(this.x, this.y + 15);
    vertex(this.x + 10, this.y - 10);
    endShape();
    
    if(targetX <= this.x){
      this.x -= 3;
    } else if(targetX >= this.x){
      this.x += 3;
    }
    
    if(targetY <= this.y){
      this.y -= 3;
    } else if(targetY >= this.y){
      this.y += 3;
    }
    
    boolean conditionX = this.x > targetX - 5 && this.x < targetX + 5;
    boolean conditionY = this.y > targetY - 5 && this.y < targetY + 5;
    if(conditionX && conditionY){
      newTargetPosition();
    }
    
    //renderTarget();
  }
  
  private void renderTarget(){
    noStroke();
    fill(0, 0, 255);
    rect(targetX, targetY, 10, 10);
    //println("Target : x=" + targetX + " | y=" + targetY + " <||> Enemy : x=" + this.x + " | y=" + this.y);
  }
  
  private void newTargetPosition(){
    targetX = int(random(width));
    targetY = int(random(5, height - 120));
  }
}
