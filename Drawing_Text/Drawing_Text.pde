//GLOBAL VARIABLES
int appWidth, appHeight, imgWidth = 800, imgHeight = 626;
float backgroundImageX, backgroundImageY, backgroundImageWidth, backgroundImageHeight, smallerDimension, largerDimension, imageWidthRatio, imageHeightRatio, imgWidthAdjusted=0.0, imgHeightAdjusted=0.0;
PImage img;
Boolean nightMode=false, widthLarger=false;
//
void setup() {
  size (800, 626); //Landscape
  //Copy Display Algorithm from Hello World
  img = loadImage("../Used Images/Kool_Kat.jpeg");
  appWidth = width;
  appHeight = height;
  //
  //Note: Dimensions are found in the image file / Right Click / Properties / Details

  //Aspect Ratio of Background Image
  if (imgWidth >= imgHeight) { //True if Landscape or Square
    largerDimension = imgWidth;
    smallerDimension = imgHeight;
    widthLarger = true;
  } else { //False if Portrait
    largerDimension = imgHeight;
    smallerDimension = imgWidth;
    widthLarger = false;
  }
  //
  /*Aspect Ratio Calculations (older)
   if(widthLarger == true) imageWidthRatio = largerDimension / largerDimension;
   if(widthLarger == true) imageHeightRatio = smallerDimension / largerDimension;
   if(widthLarger == false) imageWidthRatio = smallerDimension / largerDimension;
   if(widthLarger == false) imageHeightRatio = largerDimension / largerDimension;
   */
  //
  //Better Smage Stretch Algorithm
  //We know the idth id tha larger dimension
  if (appWidth >= imgWidth) {
    imgWidthAdjusted = appWidth;
    //
    if (widthLarger == true) imageWidthRatio = largerDimension / largerDimension;
    if (widthLarger == false) imageWidthRatio = smallerDimension / largerDimension;
    //
    if (appHeight >= imgHeight) {
      //Calculated Dimension because smaller than width
      if (widthLarger == true) imageHeightRatio = smallerDimension / largerDimension;
      if (widthLarger == false) imageHeightRatio = largerDimension / largerDimension;
      imgHeightAdjusted = imgWidthAdjusted * imageHeightRatio;
    } else {
      //Image smaller than CANVAS needs separate algorithm
    }
    //Image smaller than CANVAS needs separate algorithm
  } else {
  }
  //Population
  //Aspect Ratio Calculations
  backgroundImageX = 1;
  backgroundImageY = 1;
  backgroundImageWidth = appWidth-1;
  backgroundImageHeight = appHeight-1;
  //
  println (appWidth, imgWidth, imgWidthAdjusted);
  println (appHeight, imgHeight, imgHeightAdjusted);
}
void draw() {
  tint(0, 255, 255);
  image(img, backgroundImageX, backgroundImageY, imgWidthAdjusted, imgHeightAdjusted);
}
