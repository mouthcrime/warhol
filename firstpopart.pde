import processing.video.*;

Capture video;

color trackColor; 
float threshold = 25;

void setup() {
  size(640, 480);
  String[] cameras = Capture.list();
  printArray(cameras);
  video = new Capture(this, 640, 480, "USB2.0 VGA UVC WebCam", 30);
  video.start();
  //tracking black
  trackColor = color(0, 0, 0);
}

void captureEvent(Capture video) {
  video.read();
}

void draw() {
  video.loadPixels();
  image(video, 0, 0);
  //threshold = map(mouseX, 0, width, 0, 100);
  // this controls how close to the shade camera colours need to be to be tracked
  // higher number = more pixels shaded, less true to tracking
  //lower number = truer to tracked color 
  threshold = 75;

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
      float r2 = red(trackColor);
      float g2 = green(trackColor);
      float b2 = blue(trackColor);

      float d = distSq(r1, g1, b1, r2, g2, b2); 
      //this is what determines the colour of the tracked pixels
      if (d < threshold*threshold) {
        stroke(#F016D7);
        strokeWeight(1);
        point(x, y);
        avgX += x;
        avgY += y;
        count++;
      }
    }
  }
  // A WHOLE BUNCH OF AVERAGE LOCATION SHIT WE DO NOT NEED!
  
    // We only consider the color found if its color distance is less than 10. 
    // This threshold of 10 is arbitrary and you can adjust this number depending on how accurate you require the tracking to be.
    //if (count > 0) { 
    // avgX = avgX / count;
    //avgY = avgY / count;
    //this makes average location circle thing, we dont need this but its cool to try
    // Draw a circle at the tracked pixel
    //fill(255);
    //strokeWeight(4.0);
    //stroke(0);
    // he was using an ellipse for average location, i got rid of it but for reference its this line below
    //ellipse(avgX, avgY, 24, 24);
    //}
  }


float distSq(float x1, float y1, float z1, float x2, float y2, float z2) {
  float d = (x2-x1)*(x2-x1) + (y2-y1)*(y2-y1) +(z2-z1)*(z2-z1);
  return d;
}

void mousePressed() {
  // Save color where the mouse is clicked in trackColor variable
  //int loc = mouseX + mouseY*video.width;
  //trackColor = video.pixels[loc];
}
