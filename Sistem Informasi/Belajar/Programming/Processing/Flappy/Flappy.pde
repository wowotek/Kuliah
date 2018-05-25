private Bird bird;

void setup(){
  size(800, 600);
  this.bird = new Bird(width/2, height/2);
  frameRate(60);
}

void draw(){
  background(255);
  this.bird.render();
}

void keyReleased(){
  if (this.bird.headingSpeed >= 0.001)
  {
    this.bird.headingSpeed -= 0.002;
  }
  else if (this.bird.headingSpeed <=0 0.001)
  {
    this.bird.headingSpeed += 0.002;
  }
}
void keyPressed(){
  if(key == 'd'){
    this.bird.headingSpeed += 0.001;
  } else if(key == 'a') {
    this.bird.headingSpeed -= 0.001;
  }
}
