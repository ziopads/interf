///**
// this Processing sketch will send its mouse
// position over OSC to the p5.js sketch in the folder "p5-basic".
// you need the library OscP5 to run it.
// */
 
//import oscP5.*;
//import netP5.*;

//OscP5 oscP5;
//NetAddress myRemoteLocation;

//void setup() {
//  size(500, 500);
//  oscP5 = new OscP5(this, 8000);
//  myRemoteLocation = new NetAddress("127.0.0.1", 12000);
//}


//void draw() {
//  background(0);
//  fill(255);
//  ellipse(mouseX, mouseY, 100, 100);
//  fill(0);
//  text("I'm Processing", mouseX-40, mouseY);
  
//  // send mouse position over OSC
//  OscMessage myMessage = new OscMessage("/test");
//  myMessage.add(mouseX);
//  myMessage.add(mouseY);
//  oscP5.send(myMessage, myRemoteLocation);
//}



import org.openkinect.processing.*;
ParticleSystem ps;

Kinect2 kinect2;

PImage img;

// SETUP /////////////////////////////////
void setup() {
  size(displayWidth, displayHeight);
  kinect2 = new Kinect2(this);
  kinect2.initDepth();
  kinect2.initDevice();
  img = createImage(kinect2.depthWidth, kinect2.depthHeight, RGB);
  ps = new ParticleSystem(new PVector(width/2,50));
  // Blank image
  //depthImg = new PImage(kinect2.depthWidth, kinect2.depthHeight);
}

// Threshold variables
int minDepth =  5;
int maxDepth =  700; //4.5m

// DRAWING ///////////////////////////////
void draw() {
  background(0);
  
  img.loadPixels();
  // Draw the raw image
  image(kinect2.getDepthImage(), 0, 0);

  // Threshold the depth image
  int[] depth = kinect2.getRawDepth();
  
  float sumX = 0;
  float sumY = 0;
  float totalPixels = 0;
  
  for (int x = 0; x < kinect2.depthWidth; x++) {
    for (int y = 0; y < kinect2.depthHeight; y++) {
      int offset = x + y * kinect2.depthWidth;
      int d = depth[offset];
      
      if (d > minDepth && d < maxDepth){
        img.pixels[offset] = color(255, 0, 150);
        
        sumX += x;
        sumY += y;
        totalPixels++;
        
      } else  {
        img.pixels[offset] = color(0);
      }
    }
  }
  
  //img.resize(width, height);
  img.updatePixels();
  image(img, 0, 0);
  
  float avgX = sumX / totalPixels;
  float avgY = sumY / totalPixels;
  fill(150, 0, 150);
  ellipse(avgX, avgY, 64, 64);
  
// Add particle system and make it track the centroid
  ps.addParticle(avgX, avgY);
  ps.run();
} 
  