PShape s;

void setup() {
  size(650, 650, P2D);
  
}

void draw() {
  background(100);
  text("framerate "+frameRate, 10, 50);
  translate(width*0.5, height*0.5);
  rotate(frameRate);
  polygon(0, 0, 300, 10000); 
  
}


void polygon(float x, float y, float radius, int npoints) {
  float angle = TWO_PI / npoints;
  s = createShape();
  s.beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius;
    float sy = y + sin(a) * radius;
    s.vertex(sx, sy);
  }
  s.endShape();
  shape(s, 0, 0);
}

