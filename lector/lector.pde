String[] puntos0;
String[] puntos90;
String[] puntos180;
String[] puntos270;
String[] puntos;
float upx=0,upy=1,upz=0,roll=PI/2;
float posx=-400,posy=0,posz=0;


void setup(){
 size(800,800,P3D);
 background(255);
 noSmooth();
 //strokeWeight(10);
 //translate(250,250,0);
 puntos0 = loadStrings("Im46.off");
 puntos90 = loadStrings("Im47.off");
 puntos180 = loadStrings("Im48.off");
 puntos270 = loadStrings("Im49.off");
 puntos = loadStrings("merge.off");
 //
}

void draw(){
  clear();
  upx = cos(roll);
  upy = -sin(roll);  // negate to match screen coords
  camera(posx, posy ,posz, // eyeX, eyeY, eyeZ
         0.0, 0.0, 0.0, // centerX, centerY, centerZ
         upx, upy, upz); // upX, upY, upZ
    
  stroke(255,0,0);//red x
  line(-100, 0, 0, 100, 0, 0);
  stroke(0,255,0);//green y
  line(0, -100, 0, 0, 100, 0);
  stroke(0,0,255);//blue z
  line(0, 0, -100, 0, 0, 100);
  
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
  
  /*rotateZ(PI);         
  for (int i = 2; i < puntos0.length; i++) {
    String[] punto = split(puntos0[i], " ");        
    float x = Float.parseFloat(punto[0])*300;
    float y = Float.parseFloat(punto[1])*300;
    float z = Float.parseFloat(punto[2]);
    float r = Integer.parseInt(punto[3]);
    float g = Integer.parseInt(punto[4]);
    float b = Integer.parseInt(punto[5]);
    stroke(r,g,b);
    point(x,y,z);
        
  }
  rotateY(PI/2);
  for (int i = 2; i < puntos90.length; i++) {
    String[] punto = split(puntos90[i], " ");        
    float x = (Float.parseFloat(punto[0])*300)-60;
    float y = Float.parseFloat(punto[1])*300;
    float z = Float.parseFloat(punto[2])+90;
    float r = Integer.parseInt(punto[3]);
    float g = Integer.parseInt(punto[4]);
    float b = Integer.parseInt(punto[5]);
    stroke(r,g,b);
    point(x,y,z);     
  }
  rotateY(PI/2);
  rotateZ(PI/70);
  for (int i = 2; i < puntos180.length; i++) {
    String[] punto = split(puntos180[i], " ");        
    float x = (Float.parseFloat(punto[0])*300)-140;
    float y = (Float.parseFloat(punto[1])*300)+10;
    float z = Float.parseFloat(punto[2])+10;
    float r = Integer.parseInt(punto[3]);
    float g = Integer.parseInt(punto[4]);
    float b = Integer.parseInt(punto[5]);
    stroke(r,g,b);
    point(x,y,z);     
  }
  rotateZ(-PI/70);
  rotateY(PI/2);
  for (int i = 2; i < puntos270.length; i++) {
    String[] punto = split(puntos270[i], " ");        
    float x = (Float.parseFloat(punto[0])*300)-60;
    float y = Float.parseFloat(punto[1])*300;
    float z = Float.parseFloat(punto[2])-50;
    float r = Integer.parseInt(punto[3]);
    float g = Integer.parseInt(punto[4]);
    float b = Integer.parseInt(punto[5]);
    stroke(r,g,b);
    point(x,y,z);     
  }*/
  
  
}

void keyPressed(){
  
  switch(key){
      case 'c': roll -= 0.05f; break;
      case 'v': roll += 0.05f; break;
      case 'q': posz+=5; break;
      case 'a': posz-=5; break;
      case 'w': posy+=5; break;
      case 's': posy-=5; break;
      case 'e': posx+=5; break;
      case 'd': posx-=5; break;
  }
  System.out.println("x"+posx+" y"+posy+" z"+posz);
}

