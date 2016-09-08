//ParticleSystem ps;

//void setup() {
//  size(640,360);
//  ps = new ParticleSystem(new PVector(width/2,50));
//}

//void draw() {
//  background(0);
//  ps.addParticle();
//  ps.run();
//}

// A class to describe a group of Particles
// An ArrayList is used to manage the list of Particles 

class ParticleSystem {
  ArrayList<Particle> particles;
  PVector origin;

  ParticleSystem(PVector location) {
    origin = location.copy();
    particles = new ArrayList<Particle>();
  }

  void addParticle(float x, float y, String tweet) {
    particles.add(new Particle(x, y, tweet));
  }

  void run() {
    for (int i = particles.size()-1; i >= 0; i--) {
      Particle p = particles.get(i);
      p.run();
      if (p.isDead()) {
        particles.remove(i);
      }
    }
  }
}