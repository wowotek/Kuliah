import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class Flappy extends PApplet {

private Bird bird;

public void setup(){
  
  this.bird = new Bird(width/2, height/2);
  frameRate(60);
}

public void draw(){
  background(255);
  this.bird.render();
}

public void keyReleased(){
  if (this.bird.headingSpeed >= 0.001f)
  {
    this.bird.headingSpeed -= 0.002f;
  }
  else if (this.bird.headingSpeed <= 0.001f)
  {
    this.bird.headingSpeed += 0.002f;
  }
}
public void keyPressed(){
  if(key == 'd'){
    this.bird.headingSpeed += 0.001f;
  } else if(key == 'a') {
    this.bird.headingSpeed -= 0.001f;
  }
}
public class Bird{
  public float x = 0;
  public float y = 0;
  public float headingSpeed = 0;

  private float heading = 0;

  public Bird(float initX, float initY){
    this.x = initX;
    this.y = initY;
  }

  public void render(){
    translate(this.x, this.y);
    rotate(heading);
    fill(0);
    triangle(-10, 10, 10, 10, 0, -10);

    turn();
  }

  private void turn(){
    this.heading += this.headingSpeed;
    println(this.heading + " | " + this.headingSpeed);
  }
}
  public void settings() {  size(800, 600); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Flappy" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
