import processing.video.*;

Capture video;

color trackColor1, trackColor2, trackColor3, trackColor4, trackColor5, trackColor6;
float threshold = 25;

int number_of_presses =0;

void setup(){
  size (600,600);
  String[] cameras = Capture.list();
  printArray(cameras); //prints the available cameras from your computer Note:Certain computers might require you to grant Processing access to your camera on the computer.
  video = new Capture (this, width, height, "USB2.0 VGA UVC WebCam", 30); 
  video.start();
  
  //tracking, add more colours to this list for it to track more
  trackColor1 = color(35);
  trackColor2 = color(100);
  trackColor3 = color(180);
  trackColor4 = color(255);

  //Print instructions in the console for users 
println("Click the mouse to toggle between the 5 different Colors Palettes");
println("Press the enter button if you want to make a Print (take a picture)");
}

void captureEvent(Capture video){
    video.read();
  }
  
void draw() {
 video.loadPixels();
 image(video,0,0);
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
      
  //How a pixel is located
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
//Color Palette: 1     
   if(number_of_presses==0){     
      if (d1 < threshold*threshold) {
        stroke(#3C18F2);
        strokeWeight(4);
        point(x, y);
        avgX += x;
        avgY += y;
        count++;
        
      } if (d2 < threshold*threshold){
        stroke(#9D6A95);
        strokeWeight(4);
        point(x, y);
        avgX += x;
        avgY += y;
        count++;
        
      } if (d3 < threshold*threshold){
        stroke(#00FECA);
        strokeWeight(4);
        point(x, y);
        avgX += x;
        avgY += y;
        count++;
        
         } if (d4 < threshold*threshold){
        stroke(#FDF200);
        strokeWeight(4);
        point(x, y);
        avgX += x;
        avgY += y;
        count++;
      }}

//Color Palette: 2     
  if(number_of_presses==1){
        if (d1 < threshold*threshold) {
        stroke(#FE0879);//70BAFF,007DFF,FE0879,FF59EE
        strokeWeight(4);
        point(x, y);
        avgX += x;
        avgY += y;
        count++;
        
      } if (d2 < threshold*threshold){
        stroke(#FF82E2);//FFA80F,F55636,FCC047
        strokeWeight(4);
        point(x, y);
        avgX += x;
        avgY += y;
        count++;
        
      } if (d3 < threshold*threshold){
        stroke(#FFFF00);//FF68FE//FFF600//FFA1D7,FFF70D,95edfc
        strokeWeight(4);
        point(x, y);
        avgX += x;
        avgY += y;
        count++;
        
         } if (d4 < threshold*threshold){
        stroke(#FCC047);//FFA80F,FF68FE,FFFF00,FFA1D7,FCC047,FFA1D7,A459FF
        strokeWeight(4);
        point(x, y);
        avgX += x;
        avgY += y;
        count++;
      }
      }

//Color Palette: 3
  if(number_of_presses==2){
        if (d1 < threshold*threshold) {
        stroke(35,35,35);//C24CF6,FF5938,FAEC8B
        strokeWeight(4);
        point(x, y);
        avgX += x;
        avgY += y;
        count++;
        
      } if (d2 < threshold*threshold){
        stroke(100,100,100);//949292
        strokeWeight(4);
        point(x, y);
        avgX += x;
        avgY += y;
        count++;
        
      } if (d3 < threshold*threshold){
        stroke(180,180,180);//47FCB4,FFB3FD,616060,3f43b0,FCF340,B2D9BC
        strokeWeight(4);
        point(x, y);
        avgX += x;
        avgY += y;
        count++;
        
         } if (d4 < threshold*threshold){
        stroke(255,255,255);//C00819
        strokeWeight(4);
        point(x, y);
        avgX += x;
        avgY += y;
        count++;
      }}
      
//Color Palette: 4 
      if(number_of_presses==3){
        if (d1 < threshold*threshold) {
        stroke(#2a92c4);
        strokeWeight(4);
        point(x, y);
        avgX += x;
        avgY += y;
        count++;
        
      } if (d2 < threshold*threshold){
        stroke(#89675e);
        strokeWeight(4);
        point(x, y);
        avgX += x;
        avgY += y;
        count++;
        
      } if (d3 < threshold*threshold){
        stroke(#a4e7ed);//EBCC9E
        strokeWeight(4);
        point(x, y);
        avgX += x;
        avgY += y;
        count++;
        
         } if (d4 < threshold*threshold){
        stroke(255);
        strokeWeight(4);
        point(x, y);
        avgX += x;
        avgY += y;
        count++;
      }}
      
//Color Palette: 5   
      if(number_of_presses==4){
        if (d1 < threshold*threshold) {
        stroke(#102e47);
        strokeWeight(4);
        point(x, y);
        avgX += x;
        avgY += y;
        count++;
        
      } if (d2 < threshold*threshold){
        stroke(#FF2B0a);
        strokeWeight(4);
        point(x, y);
        avgX += x;
        avgY += y;
        count++;
        
      } if (d3 < threshold*threshold){
        stroke(#EBCC9E);//9f958c
        strokeWeight(4);
        point(x, y);
        avgX += x;
        avgY += y;
        count++;
        
         } if (d4 < threshold*threshold){
        stroke(255);
        strokeWeight(4);
        point(x, y);
        avgX += x;
        avgY += y;
        count++;
      }}
      
//reset the Color Palette loop  
  if(number_of_presses==5){
     number_of_presses=0;}
 }}
 
//The White Border 
  noStroke();
  fill(255);
  rect(0,0,15,width);
  rect(width-15,0,15,width);
  rect(0,0,height,15);
  rect(0,height-15,height,15);
}

//The distance square formula for finding the difference between the currentColor and the trackColor(s).  
  float distSq(float x1, float y1, float z1, float x2, float y2, float z2) {
  float d = (x2-x1)*(x2-x1) + (y2-y1)*(y2-y1) +(z2-z1)*(z2-z1);
  return d;
}

//MousePressed to change the Color Palettes
void mousePressed() {
  number_of_presses+=1;
  println("Color Palette: " + number_of_presses); 
}

//Keypressed enter to take a picture of the Frame. Pictures are saved in folder in which the pde is inside.     
void keyPressed(){
  if (key == ENTER) {
    saveFrame("PRINT No.##.jpeg");
    delay(200);
    
    println("Print Taken");
    println("Please collection your print(s) from the pde folder");
  }
}
