//taller de color
int radio=100;
color h=color(1,1,1);

void setup(){
  size(600,400);  
  rect(480,20,100,100);         
  colorMode(HSB, 2*PI);
  
}

void draw(){
  background(0);
  strokeWeight(20);
  float angulo = 0;
  while(angulo<2*PI){      
    stroke(angulo,100,100);          
    point(150-radio*cos(angulo),200-radio*sin(angulo));
    angulo = angulo + 0.01;
  } 
  strokeWeight(0);
  fill(h);
  rect(480,20,100,100); 
  text("hue="+(hue(h)*255)/(2*PI)+"\nsaturation="+(saturation(h)*255)/(2*PI)+"\nbrightness="+(brightness(h)*255)/(2*PI),300,250);
  
}

void mousePressed() {
  noStroke();
  if (mouseButton == LEFT) {    
    h = get(mouseX, mouseY);
  } 
}

void keyPressed() {
  noStroke();
  if (key == 's') {    
    h = color(hue(h),(saturation(h)+0.1)%(2*PI),brightness(h));
  } 
  if (key == 'b') {    
    h = color(hue(h),saturation(h),(brightness(h)+0.1)%(2*PI));
  } 
}
