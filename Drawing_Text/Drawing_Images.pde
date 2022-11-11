//GLOBAL VARIABLES
int appWidth, appHeight, imgWidth = 800, imgHeight = 626;
float backgroundImageX, backgroundImageY, backgroundImageWidth, backgroundImageHeight, smallerDimension, largerDimension, imageWidthRatio, imageHeightRatio; 
float imgWidthAdjusted=0.0, imgHeightAdjusted=0.0;
float imgWidthAdjusted2=0.0, imgHeightAdjusted2=0.0;
float imgWidthAdjusted3=0.0, imgHeightAdjusted3=0.0;
float topX, topY, topWidth, topHeight, bottomX, bottomY, bottomWidth, bottomHeight;
PImage img, img2, img3;
int tintDayMode=255, tintDayModeOpacity=50, tintRed=64, tintGreen=64, tintBlue=40, tintNightModeOpacity=85;
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
  int imgWidth = 800;
  int imgHeight = 626;
  int imgWidth2 = 1000;
  int imgHeight2 = 800;
  //int picWidth3 = 325;
  //int picHeight3 = 485;
  //
  //Image Orientation: Landscape, Square, Portrait;
  float smallerDimension, largerDimension, imageWidthRatio=0.0, imageHeightRatio=0.0;
  float smallerDimension2, largerDimension2, imageWidthRatio2=0.0, imageHeightRatio2=0.0;
  float smallerDimension3, largerDimension3, imageWidthRatio3=0.0, imageHeightRatio3=0.0;
  Boolean widthLarger=false, heightLarger=false, widthLarger2=false, heightLarger2=false;

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
  //Teaching Example: width is known to be larger
  //Better Image Stretch Algorithm
  if (appWidth >= imgWidth) {
    imgWidthAdjusted = appWidth; //Stretching larger dimension
    //
    if (widthLarger == true) imageWidthRatio = largerDimension / largerDimension;
    //
    if (appHeight >= imgHeight) {
      //Calculated Dimension b/c smaller than width
      if (widthLarger == true) imageHeightRatio = smallerDimension / largerDimension;
      imgHeightAdjusted = imgWidthAdjusted * imageHeightRatio;
      if (appHeight < imgHeightAdjusted) {
        println("STOP: image is too big for CANVAS");
        exit(); //stop further use of the APP
      }
    } else {
      //Image smaller than CANVAS needs separate algorithm
      println("CANVAS is smaller than Image");
    }
  } else {
    //Image smaller than CANVAS, needs separate algorithm
    println("CANVAS is smaller than Image");
  }
  //Population
  //Aspect Ratio Calculations
  img = loadImage("../Images Used/Landscape/kool_kat.jpg");
  img2 = loadImage("../Images Used/Landscape/INSERT ANOTHER LANDSCAPE IMAGE HERE");
  img3 = loadImage("../Images Used/Portrait/INSERT A PORTRAIT IMAGE HERE");
  backgroundImageX = appWidth*0;
  backgroundImageY = appHeight*0;
  backgroundImageWidth = appWidth-1;
  backgroundImageHeight = appHeight-1;
  topX = appWidth * 1/4;
  topY = appHeight * 1/20;
  topWidth = appWidth * 1/2;
  topHeight = appHeight * 13/20;
  bottomX = appWidth *1/2;
  bottomY = appHeight * 3/4;
  bottomWidth = appWidth * 1/4;
  bottomHeight = appHeight * 4/20;
  //
  println (appWidth, imgWidth, imgWidthAdjusted);
  println (appHeight, imgHeight, imgHeightAdjusted);
  //
  //Verify Variable Values after Algorithm
  println("App Width:", appWidth, " and App Height:", appHeight);
  println("Image dimensions are:", imgWidth, imgHeight);
  println("Larger Image dimension is:", largerDimension);
  println("Adjusted Image dimesnions are (stretch is goal):", imgWidthAdjusted, imgHeightAdjusted);
  //Rectangular Layout and Image Drawing to CANVAS
  //rect( backgroundImageX, backgroundImageY, backgroundImageWidth, backgroundImageHeight );
  rect( topX, topY, topWidth, topHeight );
  rect( bottomX, bottomY, bottomWidth, bottomHeight );
  //Algorithm uses rect-variables
  if ( imgWidth2 >= imgHeight2 ) { //True if Landscape or Square
    largerDimension2 = imgWidth2;
    smallerDimension2 = imgHeight2;
    widthLarger2 = true;
    //Landscape Image larger image to smaller rectangle (or larger)
    imgWidthAdjusted2 = topWidth; //stretch or reduce
    imageHeightRatio2 = smallerDimension2 / largerDimension2;
    imgHeightAdjusted2 = imgWidthAdjusted2 * imageHeightRatio2;
    println("here", imgWidthAdjusted2, imgHeightAdjusted2);
    if ( imgHeightAdjusted2 > topHeight ) {
      println("STOP: image is too big for rectangle layout");
      exit(); //stop further use of the APP
    }
  } else { //False if Portrait
    largerDimension2 = imgHeight2;
    smallerDimension2 = imgWidth2;
    heightLarger2 = true;
    //Portrait Image larger image to smaller rectangle (or larger)
    //Students to create
  }
  //Background Image must be single executed code
  if ( nightMode == false ) tint(tintDayMode, tintDayModeOpacity); //Gray Scale, Day use: use 1/2 tint value for white (i.e. 128/256=1/2)
  if ( nightMode == true ) tint(tintRed, tintGreen, tintBlue, tintNightModeOpacity); //RGB: Night Mode
  image( img, backgroundImageX, backgroundImageY, imgWidthAdjusted, imgHeightAdjusted);
}
void draw() {
  image(img2, topX, topY, imgWidthAdjusted2, imgHeightAdjusted2);
  image(img3, bottomX, bottomY, bottomWidth, bottomHeight);
}
void keyPressed() {
}//End keyPressed
//
void mousePressed() {
  //  
  //Mouse Pressed will control background image
  if ( mouseButton == LEFT) {
    nightMode = true;
    rect( backgroundImageX, backgroundImageY, backgroundImageWidth, backgroundImageHeight );
    tint(64, 64, 40, 85); //RGB: Night Mode
    image( img, backgroundImageX, backgroundImageY, imgWidthAdjusted, imgHeightAdjusted);
  }
  if ( mouseButton == RIGHT ) {
    nightMode = false;
    rect( backgroundImageX, backgroundImageY, backgroundImageWidth, backgroundImageHeight );
    tint(255, 50); //Gray Scale: use 1/2 tint value for white (i.e. 128/256=1/2)
    image(img, backgroundImageX, backgroundImageY, imgWidthAdjusted, imgHeightAdjusted);
  }
}//End mousePressed
//
//End Main Program
