public class Background{
  private final int numOfStars = int(2000);
  private final int numOfPlanet = int(random(1, 10));
  
  private ArrayList<Stars> star = new ArrayList<Stars>();
  private ArrayList<Planet> planet = new ArrayList<Planet>();
  public Background(){
    println("Creating Stars");
    for(int i=0; i<numOfStars; i++){
      float xrand = random(-5, width+5);
      float yrand = random(-5, height+5);
      Stars stemp = new Stars(xrand, yrand);
      for(int j=0; j<100; j++){
        xrand = random(-5, width+5);
        yrand = random(-5, height+5);
        stemp = new Stars(xrand, yrand);
        stemp.renderStars();
      }
      star.add(stemp);
      stemp.renderStars();
    }
    
    println("Creating Planets");
    for(int i=0; i<numOfPlanet; i++){
      float xrand = random(-2, width);
      float yrand = random(-3, height+3);
      Planet pl = new Planet(xrand, yrand);
      for(int j=0; j<100; j++){
        xrand = random(-2, width);
        yrand = random(-3, height+3);
        pl = new Planet(xrand, yrand);
      }
      planet.add(pl);
      pl.renderPlanet();
    }
  }
  
  public void render(){
    background(0);
    for(Stars i: star){
      i.renderStars();
    }
    
    for(Planet i: planet){
      i.renderPlanet();
    }
  }
}

private class Stars{
  private float x;
  private float y;
  private float r, g, b;
  private float size;
  private int counter;
  private int blink;
  
  private Stars(float initX, float initY){
    this.x = initX;
    this.y = initY;
    this.size = noise(1, 5)*3;
    this.counter = 0;
    this.r = random(155, 225);
    this.g = random(155, 225);
    this.b = random(155, 225);
    
    if(g >= r)
      blink = 0;
    else if(b >= g)
      blink = 1;
    else if(r >= b)
      blink = 2;
  }
  
  private void renderStars(){
    noStroke();
    fill(r, g, b);
    beginShape();
    vertex(this.x - size, this.y);
    vertex(this.x - (size/4), this.y - (size/4));
    vertex(this.x, this.y - size);
    vertex(this.x + (size/4), this.y - (size/4));
    vertex(this.x + size, this.y);
    vertex(this.x + (size/4), this.y + (size/4));
    vertex(this.x, this.y + size);
    vertex(this.x - (size/4), this.y + (size/4));
    endShape();
    
    if(this.counter <= 30){
      this.size += 0.05;
      if(blink == 1)
        this.r += 1;
      else if(blink == 2)
        this.g += 1;
      else if(blink == 3)
        this.b += 1;
    } else if (this.counter > 30){
      this.size -= 0.05;
      if(blink == 1)
        this.r -= 1;
      else if(blink == 2)
        this.g -= 1;
      else if(blink == 3)
        this.b -= 1;
    }
    
    if(this.counter >= 60){
      this.counter = 0;
    }
    counter++;
  }
}

private class Planet{
  private float x;
  private float y;
  private float size;
  private float r, g, b;
  
  private Planet(float initX, float initY){
    this.x = initX;
    this.y = initY;   
    this.size = random(40, 250);
    this.r = random(10, 57);
    this.g = random(70, 150);
    this.b = random(100, 255) - this.size;
  }
  
  
  private void renderPlanet(){
    ellipseMode(CENTER);
    fill(255, 0, 0, 255/10);
    noStroke();
    beginShape();
    vertex(this.x, this.y-(this.size/2));
    vertex(0, this.y-(this.size/2));
    vertex(0, this.y+(this.size/2));
    vertex(this.x, this.y+(this.size/2));
    endShape();
    fill(r, g, b);
    noStroke();
    ellipse(this.x, this.y, this.size, this.size);
    
  }
}
