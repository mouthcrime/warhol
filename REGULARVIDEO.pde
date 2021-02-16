import processing.video.*;

Capture cam;

void setup (){
  size (640, 480);
  cam = new Capture(this, 640, 480, "USB2.0 VGA UVC WebCam", 30);
  cam.start();
}

void draw (){
  if (cam.available()){
    cam.read();
  }
  // Red tint , can be changed using RBG scale
  tint(255, 0, 0);
  image(cam, 0, 0);
}
