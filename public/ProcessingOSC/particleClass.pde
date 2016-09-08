// A simple Particle class

class Particle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float lifespan;
  String message;

  Particle(float x, float y, String tweet) {
    acceleration = new PVector(0,0.05);
    //velocity = new PVector(random(-1,1),random(-2,0));
    velocity = new PVector(random(-0.5,0.5),random(-0.5,0));
    //location = new PVector(x, y);
    location = new PVector(random(x-256, x+256), random(y-256, y+256));

    lifespan = 127.0;
    message = tweet;
  }

  void run() {
    update();
    display();
  }

  // Method to update location
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    lifespan -= 1.0;
  }

  // Method to display
  void display() {
    stroke(255,lifespan);
    fill(255,lifespan);
    textSize(12);
    if (message != null){
      textAlign(CENTER);
      text(message, location.x, location.y);
    } else {
      ellipse(location.x, location.y, 8, 8);
    }
  }
  
  
  // Is the particle still useful?
  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } else {
      return false;
    }
  }
}