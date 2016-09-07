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
import oscP5.*;
import netP5.*;

OscP5 oscP5;
NetAddress myRemoteLocation;
ParticleSystem ps;

Kinect2 kinect2;

PImage img;

boolean isConnected;

// SETUP /////////////////////////////////
void setup() {
  size(displayWidth, displayHeight, P2D);
  //size(512, 424, P2D);
  //smooth(8); // Per processing docs, may or may not work depending on graphics processor

  kinect2 = new Kinect2(this);
  kinect2.initDepth();
  kinect2.initDevice();
  img = createImage(kinect2.depthWidth, kinect2.depthHeight, RGB);
  ps = new ParticleSystem(new PVector(width/2,50));
  
  oscP5 = new OscP5(this, 8000);
  myRemoteLocation = new NetAddress("127.0.0.1", 12009);
  
  // Blank image
  //depthImg = new PImage(kinect2.depthWidth, kinect2.depthHeight);
}

// Threshold variables
int minDepth =  5;
int maxDepth =  700; //4.5m

// DRAWING ///////////////////////////////
void draw() {
  //imageMode(CENTER);
  background(0);
 
  //image(img, width/2, height/2);

  // put the image pixels into a pixel array
  img.loadPixels();
  
  // Draw the raw image
  image(kinect2.getDepthImage(), width/2 - kinect2.depthWidth, height/2 - kinect2.depthHeight, 1024, 848); // I don't think I need this anymore


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
  //scale(2.0);
  //image(img, width/2 - kinect2.depthWidth, height/2 - kinect2.depthHeight);
  image(img, width/2 - kinect2.depthWidth, height/2 - kinect2.depthHeight, 1024, 848);

  //image(img, 0, 0);
  
  float avgX = 2 * sumX / totalPixels + width/2 - kinect2.depthWidth;
  float avgY = 2 * sumY / totalPixels + height/2 - kinect2.depthHeight;
  fill(150, 0, 150);
  ellipse(avgX, avgY, 64, 64);
  
// Add particle system and make it track the centroid
  ps.addParticle(avgX, avgY);
  ps.run();
  
// send coordinate data over OSC
  OscMessage myMessage = new OscMessage("/kinect");
  myMessage.add(avgX);
  myMessage.add(avgY);
  oscP5.send(myMessage, myRemoteLocation);
} 
  