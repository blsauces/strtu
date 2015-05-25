/**
This sketch shows how geometric transformations could be regarded as
changing the frame (coordinate system) of reference. It also shows how
to use a matrix stack of transformations to "navigate" among frames.
See: http://processing.org/reference/pushMatrix_.html

A scene graph is just a hierarchy of nested frames. Here we implement
the following scene graph:

    W
    ^
    |
    |   
    L1
    ^
    |
    |
    L2

As you could see, there's no camera node, and there's no interactivity whatsoever.
That's the homework!

Using off-screen rendering we draw the above scene twice.
See: http://processing.org/reference/PGraphics.html

Press any key and see what happens.

 -jp
*/

PFont font;
PGraphics canvas1, canvas2;
String renderer = P2D;
// if opengl is not supported comment the prev line and uncomment this:
//String renderer = JAVA2D;
//dim
int w = 640;
int h = 720;

int x = 0;
int y = 0;
float z = 1;
float ang = 0;

void setup() {
  size(w, h, renderer);
  canvas1 = createGraphics(width, height/2, renderer);
  canvas2 = createGraphics(width, height/2, renderer);    
  font = createFont("Aharoni",42);
}

public void draw() {
  background(255);
  canvas1.beginDraw();
  canvas1.background(255);
  // call scene off-screen rendering on canvas 1  
    drawScene(canvas1);
  canvas1.endDraw();
  // draw canvas onto screen
  image(canvas1, 0, 0);

  canvas2.beginDraw();
  canvas2.background(255);
  // call scene off-screen rendering on canvas 1  
    drawScene(canvas2);
  canvas2.endDraw();
  // draw canvas onto screen
  image(canvas2, 0, 360);  
}

void drawScene(PGraphics pg) {
  //draw camera translations
  if (pg.equals(canvas1)){
  pg.translate(x,y);
  pg.rotate(ang);
  pg.scale(z);  
  }
  else{
  pg.pushMatrix();
  pg.scale(1/z);    
  pg.rotate(-ang);
  pg.translate(-x,-y);  
  
  pg.fill(255,252,61,100);
  pg.rect(0,0,width,height/2);
  pg.popMatrix();
  }   
  
  // draw world coord sys axes
  drawAxis(pg, 1);   

  pg.strokeWeight(1);
  pg.stroke(0);
  
  pg.fill(230,230,0);
  pg.ellipse(335,180,50,50);
  
  pg.fill(40,170,0);
  pg.rect(320,165,40,10);
  
  pg.fill(0,0,0);
  pg.rect(340,165,20,15);
  
  pg.fill(250,0,0);
  pg.rect(100,110,80,90);       
 
  pg.fill(250,250,250);  
  pg.rect(170, 200, 300, 50);
  
  pg.fill(250,250,250);  
  pg.rect(300, 145, 20, 55);
  
  pg.fill(250,250,250);  
  pg.triangle(170, 200, 300, 200, 300, 150);  
  
  pg.fill(250,250,250);  
  pg.triangle(500, 250, 510, 200, 590, 250);

  pg.fill(0,0,0);  
  pg.rect(360, 205, 100, 45);
  
  pg.fill(250,0,0);
  pg.quad(300,250,226,180,200,186,200,250);
  
  pg.fill(250,250,250);
  pg.rect(320,185,90,15);
  
  pg.fill(250,0,0);
  pg.quad(440,190,430,210,400,205,390,185);
  
  pg.fill(250,0,0);
  pg.quad(440,190,430,210,400,205,390,185);
  
  pg.fill(0,0,0);
  pg.triangle(417,186,390,176,380,185);
  
  pg.fill(0,0,0);
  pg.ellipse(170,220,90,90);
  
  pg.fill(50,50,50);
  pg.ellipse(170,220,40,40);

  pg.fill(0,0,0);
  pg.ellipse(470,220,90,90);   
  
  pg.fill(50,50,50);
  pg.ellipse(470,220,40,40);
    
  pg.textFont(font, 22);
  pg.text("Shell", 280, 230);
  pg.text("Honda", 230, 195);
  
}

void drawAxis(PGraphics pg) {
  drawAxis(pg, 1);
}

void drawAxis(PGraphics pg, float s) {
  // X-Axis
  pg.strokeWeight(2);
  pg.stroke(255, 0, 0);
  pg.fill(255, 0, 0);
  pg.line(0, 0, 100 * s, 0);
  pg.text("X", 100 * s + 5, 0);
  // Y-Axis
  pg.stroke(0, 0, 255);
  pg.fill(0, 0, 255);
  pg.line(0, 0, 0, 100 * s);
  pg.text("Y", 0, 100 * s + 15);
}

void keyPressed() {  
  switch(key){
    //translate
    case 'w':  y=--y;        
    case 's':  y=y+1;               
    case 'a':  x=--x;               
    case 'd':  x=x+1;               
    //scale
    case 'r':  z=z+0.01;
    case 'f':  z=z-0.01;
    //rotate
    case 'q':  ang=ang+0.01;
    case 'e':  ang=ang-0.01;
  }  
}

void mouseDragged(){
  x = mouseX;
  y = mouseY;  
}

void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  z = z + e/10;
  println(e);
}
