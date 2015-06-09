import remixlab.proscene.*;



String[] puntos;
float upx=0,upy=1,upz=0;
float posx=400,posy=0,posz=0;
PShape guitarra;
boolean framerate=false;

void setup(){
 hint(DISABLE_DEPTH_TEST);
 //hint(ENABLE_DEPTH_SORT);
 size(700,700,P3D);
 
 puntos = loadStrings("merge.off");
 guitarra = createShape();
 guitarra.beginShape(TRIANGLES);
 for (int i = 30934; i < puntos.length; i++) {
    String[] punto = split(puntos[i], " ");   
    int p1 = Integer.parseInt(punto[1]);
    int p2 = Integer.parseInt(punto[2]);
    int p3 = Integer.parseInt(punto[3]);
    String[][] a={split(puntos[p1+2], " "),split(puntos[p2+2], " "),split(puntos[p3+2], " ")};
    for(int j=0;j<3;j++){    
      guitarra.stroke(Integer.parseInt(a[j][3]),Integer.parseInt(a[j][4]),Integer.parseInt(a[j][5]));
      guitarra.fill(Integer.parseInt(a[j][3]),Integer.parseInt(a[j][4]),Integer.parseInt(a[j][5]));
      guitarra.vertex(Float.parseFloat(a[j][0])*300,Float.parseFloat(a[j][1])*300,Float.parseFloat(a[j][2])*300);
    }    
  }
  guitarra.endShape();
 
}

void draw(){
  if(framerate)System.out.println(frameRate);
  clear();
  background(255);
  camera(posx, posy ,posz, // eyeX, eyeY, eyeZ
         0.0, 0.0, 0.0, // centerX, centerY, centerZ
         upx, upy, upz); // upX, upY, upZ
  float dirY = (mouseY / float(height) - 0.5) * 2;
  float dirX = (mouseX / float(width) - 0.5) * 2;
  directionalLight(204, 204, 204, -dirX, -dirY, -1);  
  
  stroke(255,0,0);//red x
  line(-100, 0, 0, 100, 0, 0);
  stroke(0,255,0);//green y
  line(0, -100, 0, 0, 100, 0);
  stroke(0,0,255);//blue z
  line(0, 0, -100, 0, 0, 100);
  
  shape(guitarra,0,0);
  rotateX(HALF_PI);
  shape(guitarra,-100,0);
  //frame.coordinatesOf(new Vec(Float.parseFloat(a[j][0])*300,Float.parseFloat(a[j][1])*300,Float.parseFloat(a[j][2])*300));
  System.out.println(frame);
}

void keyPressed(){  
  switch(key){      
      case 'q': posx+=5; break;
      case 'w': posx-=5; break;
      
      case 'a':guitarra.rotateZ(0.1);break;
      case 's':guitarra.rotateY(0.1);break;
      case 'd':guitarra.rotateX(0.1);break;
      
      case 'z':guitarra.scale(0.9);break;
      case 'x':guitarra.scale(1.1);break;
      
      case 'f':framerate=!framerate;break;
      
  }
  System.out.println("x"+posx+" y"+posy+" z"+posz+"   ");
}
void mouseDragged(){
  posz-=pmouseX-mouseX;
  posy+=pmouseY-mouseY;
  
}



