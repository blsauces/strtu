PImage photo;
float x, y, rotation;
boolean mvn= false;
float scaling = 1.0;
boolean showLittleScreen = true, overLS= false;
float lsX, lsY;
float tX, tY; 
float traslacion;
mapScreen ms;
String file = "a.jpg";

void setup() {
  photo = loadImage(file);
  size(photo.width, photo.height);
  ms = new mapScreen(file);
}
void draw() {
  background(0);
  pushMatrix();
  scale(scaling/ms.mRect.quant);
  rotate(rotation);
  image(photo, -(-traslacion + ms.mRect.realX), -ms.mRect.realY);
  popMatrix();
  if (showLittleScreen) {
    ms.drawMapScreen();
  }
}
void mTranslate(float transX, float transY) {
  tX = transX; 
  tY = transY;
  translate(tX, tY);
}
void mousePressed() {
  x = radians(mouseX - photo.width/2);
  y = radians(mouseY - photo.height/2);
  //print("x: " + mouseX + ", y: " + mouseY + "\n" );
  if (rotation == 0) {
    if (showLittleScreen && mouseX >= ms.mRect.realX && mouseX <= (ms.mRect.largo*ms.mRect.quant + ms.mRect.realX) && mouseY <= (ms.mRect.alto*ms.mRect.quant + ms.mRect.realY) && mouseY >= ms.mRect.realY) {
      ms.mRect.isMoving = true;
      //print("Shit's moving \n");
    }
  }
}
void mouseWheel(MouseEvent event) {
  ms.mRect.mMouseWheel(event);
}
void mouseDragged() {
  if (ms.mRect.isMoving) {
    ms.mRect.mMouseDragged();
  }
}
void mouseReleased() {
  if (ms.mRect.isMoving) {
    ms.mRect.mMouseReleased();
  }
}
void keyPressed() {
  if (key == 'p') {
    showLittleScreen = !showLittleScreen;
  }
  if (key == 'r') {
    rotation += PI/12;
  }
  if (key == 't') {
    rotation -= PI/12;
  }
}
