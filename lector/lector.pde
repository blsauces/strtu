String[] puntos;
void setup(){
 size(500,500,P3D);
 background(255);
 noSmooth();
 //strokeWeight(10);
 translate(250,250,0);
  puntos = loadStrings("Im46.off");
}

void draw(){
  clear();
  camera(250.0, 250.0 ,mouseY, // eyeX, eyeY, eyeZ
         0.0, 0.0, 0.0, // centerX, centerY, centerZ
         1.0, 0.0, 0.0); // upX, upY, upZ
         
         
   for (int i = 2; i < puntos.length; i++) {
    String[] punto = split(puntos[i], " ");        
    float x = Float.parseFloat(punto[0])*300;
    float y = Float.parseFloat(punto[1])*300;
    float z = Float.parseFloat(punto[2]);
    float r = Integer.parseInt(punto[3]);
    float g = Integer.parseInt(punto[4]);
    float b = Integer.parseInt(punto[5]);
    stroke(r,g,b);
    point(x,y,z);   
  }
}

void mouseWheel(MouseEvent event) {
  float e = event.getCount();
    camera(30.0, 0.0, e, // eyeX, eyeY, eyeZ
         0.0, 0.0, 0.0, // centerX, centerY, centerZ
         0.0, 1.0, 0.0); // upX, upY, upZ
  println(e);
}


