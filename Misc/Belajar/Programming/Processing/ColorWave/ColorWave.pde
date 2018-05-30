void setup(){
  fullScreen(P3D);
  frameRate(288);
}

float amp;
float period;
float inc = 1;
ArrayList<Po> po = new ArrayList<Po>();
private float x;
private float y;
void draw(){
  amp = map(mouseY, height, 0, 1, height-600);
  period = map(mouseX, 0, width, 100, 1000);

  println(inc);
  background(255);
  x = 0;
  y = amp*sin((frameCount/period)*TWO_PI);
  fill(255, 0, 0);
  strokeWeight(2);
  stroke(0);
  line(80, 80, 80, height-80);
  line(80, height/2, width - 80, height/2);
  
  noStroke();
  translate(80, height/2);
  beginShape();
  vertex(x, y);
  vertex(x-15, y-15);
  vertex(x+30, y);
  vertex(x-15, y+15);
  vertex(x, y);
  endShape();
  po.add(new Po(x, y, inc));
  
  boolean remove=false;
  for(Po p: po){
    p.increment = inc;
    p.render();
    if(p.x >= width-160)
    {
        p.x = x;
        p.count++;
    }
    
    if(p.count >= 1)
      remove=true;
  }
  if(remove)
    po.remove(0);
}

class Po{
  public float x;
  public float y;
  public int count;
  public float increment;
  
  public float r = 0;
  public float g = 0;
  public float b = 0;
  
  public boolean rplus = true;
  public boolean gplus = false;
  public boolean bplus = false;
  
  public Po(float initX, float initY, float _increment){
    this.x = initX;
    this.y = initY;
    this.increment = _increment;
  }
  
  public void render(){
    stroke(r, g, b);
    strokeWeight(20);
    point(this.x, this.y);
    this.x+=increment;
    
    if(rplus)
      r++;
    else
      r--;
      
    if(gplus)
      g++;
    else
      g--;
     
    if(bplus)
      b++;
    else
      b--;
    
    if(r >= 255)
    {
      rplus = !rplus;
      gplus = !gplus;
      g = 0;
    }
    
    if(g >= 255)
    {
      gplus = !gplus;
      bplus = !bplus;
      b = 0;
    }
    
    if(b >= 255)
    {
      bplus = !bplus;
      rplus = !rplus;
    }
  }
}
