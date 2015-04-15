String[] puntos;
float upx=0,upy=1,upz=0;
float posx=400,posy=0,posz=0;
PShape guitarra;
boolean retenido=false;
boolean framerate=false;

void setup(){
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
      guitarra.fill(Integer.parseInt(a[j][3]),Integer.parseInt(a[j][4]),Integer.parseInt(a[j][5]));
      guitarra.stroke(Integer.parseInt(a[j][3]),Integer.parseInt(a[j][4]),Integer.parseInt(a[j][5]));
      guitarra.vertex(Float.parseFloat(a[j][0])*300,Float.parseFloat(a[j][1])*300,Float.parseFloat(a[j][2])*300);
    }    
  }
  guitarra.endShape();
 
}

void draw(){
  clear();
  background(255);
  camera(posx, posy ,posz, // eyeX, eyeY, eyeZ
         0.0, 0.0, 0.0, // centerX, centerY, centerZ
         upx, upy, upz); // upX, upY, upZ
  
  if(framerate)System.out.println(frameRate);
  
  stroke(255,0,0);//red x
  line(-100, 0, 0, 100, 0, 0);
  stroke(0,255,0);//green y
  line(0, -100, 0, 0, 100, 0);
  stroke(0,0,255);//blue z
  line(0, 0, -100, 0, 0, 100);  
    
  if(retenido){
    beginShape(TRIANGLES);
    for (int i = 30934; i < puntos.length; i++) {
      String[] punto = split(puntos[i], " ");   
      int p1 = Integer.parseInt(punto[1]);
      int p2 = Integer.parseInt(punto[2]);
      int p3 = Integer.parseInt(punto[3]);
      String[][] a={split(puntos[p1+2], " "),split(puntos[p2+2], " "),split(puntos[p3+2], " ")};
      for(int j=0;j<3;j++){    
        fill(Integer.parseInt(a[j][3]),Integer.parseInt(a[j][4]),Integer.parseInt(a[j][5]));
        stroke(Integer.parseInt(a[j][3]),Integer.parseInt(a[j][4]),Integer.parseInt(a[j][5]));
        vertex(Float.parseFloat(a[j][0])*300,Float.parseFloat(a[j][1])*300,Float.parseFloat(a[j][2])*300);
      }    
    }
    endShape();
  }else{
    shape(guitarra,0,0);
  }
  
  
  
}

void keyPressed(){  
  switch(key){      
      case 'q': posz+=5; break;
      case 'a': posz-=5; break;
      case 'w': posy+=5; break;
      case 's': posy-=5; break;
      case 'e': posx+=5; break;
      case 'd': posx-=5; break;
      
      case 'z':guitarra.rotateZ(0.1);break;
      case 'x':guitarra.rotateY(0.1);break;
      case 'c':guitarra.rotateX(0.1);break;
      case 'v':guitarra.scale(0.9);break;
      case 'b':guitarra.scale(1.1);break;
      
      case 'r':retenido=!retenido;break;
      case 'f':framerate=!framerate;break;
  }
  System.out.println("x"+posx+" y"+posy+" z"+posz+"   retenido"+retenido);
}



