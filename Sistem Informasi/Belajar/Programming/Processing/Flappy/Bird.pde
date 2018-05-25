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
