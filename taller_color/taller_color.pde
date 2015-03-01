//taller de color
int radio=100;
void setup(){
  size(600,400);  
  rect(480,20,100,100);         
  colorMode(HSB, 2*PI);
}

void draw(){
  strokeWeight(10);
  float angulo = 0;
  while(angulo<2*PI){      
    stroke(angulo,100,100);          
    point(150-radio*cos(angulo),200-radio*sin(angulo));
    angulo = angulo + 0.01;
  } 
  
}

void mousePressed() {
  noStroke();
  if (mouseButton == LEFT) {    
    color h = get(mouseX, mouseY);
    fill(h);
    rect(480,20,100,100);   
  } 
}
