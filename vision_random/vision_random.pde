import processing.video.*;

Capture video;

color trackColor1, trackColor2, trackColor3, trackColor4, trackColor5, trackColor6;
float threshold = 25;

void setup() {
  size(640, 480);
  String[] cameras = Capture.list();
  printArray(cameras);
  video = new Capture(this, 640, 480, "USB2.0 VGA UVC WebCam", 30);
  video.start();
  
  //tracking, add more colours to this list for it to track more
  trackColor1 = color(35);
  trackColor2 = color(100);
  trackColor3 = color(180);
  trackColor4 = color(255);
}

void captureEvent(Capture video) {
  video.read();
}

void draw() {
  video.loadPixels();
  image(video, 0, 0);
  filter(GRAY);
  // this controls how close to the shade camera colours need to be to be tracked
  // higher number = more pixels shaded, less true to tracking
  //lower number = truer to tracked color 
  threshold = 90;

  float avgX = 0;
  float avgY = 0;

  int count = 0;

  // Begin loop to walk through every pixel
  
  for (int x = 0; x < video.width; x++ ) {
    for (int y = 0; y < video.height; y++ ) {
      int loc = x + y * video.width;
      
      // What is current color
      
      color currentColor = video.pixels[loc];
      float r1 = red(currentColor);
      float g1 = green(currentColor);
      float b1 = blue(currentColor);
      
      float r2 = red(trackColor1);
      float g2 = green(trackColor1);
      float b2 = blue(trackColor1);
      
      float r3 = red(trackColor2);
      float g3 = green(trackColor2);
      float b3 = blue(trackColor2);
      
      float r4 = red(trackColor3);
      float g4 = green(trackColor3);
      float b4 = blue(trackColor3);
      
      float r5 = red(trackColor4);
      float g5 = green(trackColor4);
      float b5 = blue(trackColor4);
      

      float d1 = distSq(r1, g1, b1, r2, g2, b2); 
      float d2 = distSq(r1, g1, b1, r3, g3, b3);
      float d3 = distSq(r1, g1, b1, r4, g4, b4);
      float d4 = distSq(r1, g1, b1, r5, g5, b5);
      
      //this is what determines the colour of the tracked pixels
      //the trick to independent colours is in these statements
      
      if (d1 < threshold*threshold) {
        stroke(random (255), random(255), random (255));
        strokeWeight(4);
        point(x, y);
        avgX += x;
        avgY += y;
        count++;
        
      } if (d2 < threshold*threshold){
        stroke(255, 255, random (255));
        strokeWeight(4);
        point(x, y);
        avgX += x;
        avgY += y;
        count++;
        
      } if (d3 < threshold*threshold){
        stroke(255, random(255), 255);
        strokeWeight(4);
        point(x, y);
        avgX += x;
        avgY += y;
        count++;
        
         } if (d4 < threshold*threshold){
        stroke(random (255), 255, 255);
        strokeWeight(4);
        point(x, y);
        avgX += x;
        avgY += y;
        count++;
      }
    }
  }
  }


float distSq(float x1, float y1, float z1, float x2, float y2, float z2) {
  float d = (x2-x1)*(x2-x1) + (y2-y1)*(y2-y1) +(z2-z1)*(z2-z1);
  return d;
}

void mousePressed() {
}
