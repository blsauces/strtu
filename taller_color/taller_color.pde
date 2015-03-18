//taller de color
int radio=100;
color h=color(1,1,1);
color h2=color(1,1,1);

void setup(){
  size(600,700);  
  rect(480,20,100,100);         
  colorMode(HSB, 2*PI,100,100);
  
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
  //HSV
  strokeWeight(0);
  fill(h);
  rect(480,20,100,100); 
  text("hue="+(hue(h)*255)/(2*PI)+"\nsaturation="+saturation(h)+"\nbrightness="+brightness(h),300,250);
  fill(hue(h),100,saturation(h));
  rect(280,20,50,saturation(h));
  fill(hue(h),0,brightness(h));
  rect(350,20,50,brightness(h));  
  //HSL  
  fill(h2);
  rect(480,320,100,100); 
  text("hue="+(hue(h)*255)/(2*PI)+"\nsaturation="+saturation(h)+"\nlightness="+brightness(h2),300,550);
  fill(hue(h),400,saturation(h));
  rect(280,320,50,saturation(h));
  fill(hue(h2),(brightness(h2)*saturation(h2))/(1-abs(2*(brightness(h2)/2)*(2-saturation(h2))-1)),(brightness(h2)/2)*(2-saturation(h2)));
  rect(350,320,50,(brightness(h2)/2)*(2-saturation(h2)));
  
}

void mousePressed() {
  noStroke();
  if (mouseButton == LEFT) {    
    h = get(mouseX, mouseY);
    h2 = get(mouseX, mouseY);
  } 
  }

void keyPressed() {
  noStroke();
  if (key == 's') {    
    h = color(hue(h),(saturation(h)-1)%(100),brightness(h));
  } 
  if (key == 'b') {    
    h = color(hue(h),saturation(h),(brightness(h)-1)%(100));
  } 
  if (key == 'l') {
    float ll = ((brightness(h2)-1.0))%100) * 2.0;    
    float ss = brightness(h2) <= 1.0 ? ll : 2.0 - ll; 
    float l = (ll  + ss) / 2.0;
    float s = (2 * ss) / (ll + ss);  
    h2 = color(hue(h2),s,l);
  }
  
}
