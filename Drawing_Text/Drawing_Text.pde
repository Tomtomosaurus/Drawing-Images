//GLOBAL VARIABLES
int appWidth, appHeight;
float backgroundImageX, backgroundImageY, backgroundImageWidth, backgroundImageHeight;
PImage img;
//
void setup() {
  size (800, 626); //Landscape
  //Copy Display Algorithm
  img = loadImage("../Used Images/Kool_Kat.jpeg");
  appWidth = width;
  appHeight = height;
  backgroundImageX = 1;
  backgroundImageY = 1;
  backgroundImageWidth = appWidth-1;
  backgroundImageHeight = appHeight-1;
}
void draw() {
  image(img, backgroundImageX, backgroundImageY, backgroundImageWidth, backgroundImageHeight);
}
