class mapScreen {
  PImage screen;
  rectView mRect;
  float coordX, coordY, iniScale;
  
  mapScreen(String file) {
    screen = loadImage(file);
    print( width + ", " + height);
    iniScale = 0.6;
    coordX = width*iniScale;
    coordY = 0;
    setRectangle(0, 0, 1 - iniScale);
  }
  void setRectangle(float x, float y, float boxSize) {
    mRect = new rectView (x, y, boxSize);
    mRect.setCoordinates(coordX, coordY);
  }
  void drawMapScreen() {
    pushMatrix(); 
    traslacion = (-tX + width*.6);
    translate(-tX + width*.6, -tY);
    scale(.4);
    image(screen, 0, 0);
    mRect.drawRect();
  }
}

class rectView {  
  float minX;  
  float maxX;
  float minY;
  PShape rectangle;
  float x, y, realX, realY;
  float alto, largo;  
  boolean isMoving = false;
  float scale, quant = 1;  
  int pastMouseX;  
  int pastMouseY;

  rectView(float x, float y, float boxSize) {
    this.x = x; 
    this.y = y;
    print(realX);
    scale = boxSize;
    this.largo = width*boxSize;
    this.alto = height*boxSize;
    this.realX=width-this.largo;
    minX=realX;
    maxX=realX+height*boxSize;
  }  
  void setCoordinates(float xx, float yy) {
      this.realX = xx;
      this.realY = yy;
  }
  void setDims(float l, float a) {
    this.largo = l;
    this.alto = a;
  }
  void drawRect() {    
    pastMouseX = mouseX;
    pastMouseY = mouseY;
    stroke(255);
    strokeWeight(3);
    fill(255, 0, 0, 0);
    scale(quant/scale);
    rotate(rotation);
    rect(realX - traslacion, realY, largo, alto);
    popMatrix();
  }
  float getLargoScalado() {
    return largo/scale;
  }
  float getAltoScalado() {
    return alto/scale;
  }
  void mMouseDragged() {
    if (isMoving) {
      setCoordinates(mouseX, mouseY);
    }
  }
  void mMouseReleased() {
    isMoving = false;    
  }
  void mMouseWheel(MouseEvent event) {
    if (quant - event.getCount()*0.1  <= 1 && quant - event.getCount()*0.1 >= 0.1) {
      quant -= event.getCount()*0.1;
      scaling += event.getCount()*(0.004);
	  print("ok  ");
    }
    println("q "+quant+"  s "+scaling+"  e.c "+event.getCount()*0.1+"  q/s "+quant/scale);
  }
}
