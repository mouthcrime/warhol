import processing.video.*;
//SHAPE SIZE
int cellSize = 7;
int cols, rows;
Capture video;

void setup(){
  // colmuns, etc
  size (640, 480);
  cols = width / cellSize;
  rows = height / cellSize;
  colorMode (RGB, 255, 255, 255, 100);
  rectMode (CENTER);
  
  // video stuff
  video = new Capture(this, 640, 480, "USB2.0 VGA UVC WebCam", 30);
  video.start();
  background(0);
  
}

void draw (){
  if (video.available()) {
    video.read();
    video.loadPixels();
    // video background - can this be tinkered with?
    background(10);
    
    //loop?
   for (int i = 0; i < cols;i++) {
   for (int j = 0; j < rows;j++){
    
    //pixel locations
    int x = i * cellSize;
    int y = j * cellSize;
    int loc = (video.width - x - 1) + y*video.width; 
    
    // these two lines are key to the filter
    color c = video.pixels[loc];
    float sz = (brightness (c) / 200.0) * cellSize;
    fill (0, 255, 0, 50);
    // JESUS this slows the script down lmao
    //filter (POSTERIZE );
    noStroke();
    ellipse (x + cellSize/2, y + cellSize/2, sz, sz);
   }
   }
   }}
