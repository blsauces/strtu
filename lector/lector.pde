import remixlab.proscene.*;
import remixlab.dandelion.core.*;
import remixlab.dandelion.geom.*;

Scene scene;

String[] puntos;
float upx=0,upy=1,upz=0,angX=0;
float posx=400,posy=0,posz=0,minf1=100,minf2=100,minf3=100;
PShape guitarra, f1,f2,f3;
InteractiveFrame fr1, fr2, fr3;
boolean framerate=false;

void setup(){
 hint(DISABLE_DEPTH_TEST);
 //hint(ENABLE_DEPTH_SORT);
 size(700,700,P3D);
 scene = new Scene(this);
 scene.eye().frame().setDampingFriction(0);
 
 
 fr1 = new InteractiveFrame(scene);    
 
 f1 = createShape();
 f1.beginShape();
 f1.fill(100,124,210);
  f1.rotateX(1.25);
  f1.vertex(10, 18, -5);
  f1.vertex(15, 20, 10);
  f1.vertex(15, 75, 21);
  f1.vertex(10, 95, 13);
  f1.vertex(20, 60, 23);
  f1.vertex(25, 75, 13);
  f1.endShape(CLOSE);
  
  fr2 = new InteractiveFrame(scene, fr1);
  fr2.translate(60, -40, -30);
  fr2.scale(1.2);
  
  f2 = createShape();
  f2.beginShape();
  f2.translate(-5, 15, 25);
  f2.fill(200,224,110);
  f2.vertex(3, 20, 10);
  f2.vertex(7, 4, 16);
  f2.vertex(15, 17, 11);
  f2.endShape(CLOSE);
 
    
  fr3 = new InteractiveFrame(scene, scene.eye().frame());
  fr3.translate(-100, 0, -250);
  
 /*
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
 */
}

void draw(){
  background(0);
            
  pushMatrix();
  scene.applyTransformation(fr1);
  scene.drawAxes(40);  
  //shape(f1,0,0);
  pushMatrix();
  scene.applyTransformation(fr2);
  scene.drawAxes(40);       
  //shape(f2,0,0); 
  popMatrix();
  popMatrix();
  
  //eye
  pushMatrix();
  scene.applyTransformation(scene.eye().frame());
  pushMatrix();
  scene.applyTransformation(fr3);
  scene.drawAxes(40);  
  popMatrix();
  popMatrix();  
         
 
 Vec pos1 = scene.eye().projectedCoordinatesOf(fr1.position());
 Vec pos2 = scene.eye().projectedCoordinatesOf(fr2.position());

 
     //PRUEBA 1
     boolean test1 = true;
     if(pos1.x() == pos2.x())test1 = false;
     if(pos1.y() == pos2.y())test1 = false;


    //PRUEBA 2
     boolean test2 = true;      
     if(pos1.z() < pos2.z())test1 = false;                 
    
    //PRUEBA 3
     boolean test3 = true;     
    if(pos2.z() > pos1.z())test1 = false;                   

    System.out.println("test1 :" + test1);
    System.out.println("test2 :" + test2);
    System.out.println("test3 :" + test3);

    if(test1&&test2&&test3){
      shape(f2,0,0);
      shape(f1,0,0);      
    }
    else{      
      shape(f1,0,0);
      shape(f2,0,0);
    }
}

void keyPressed(){  
  /*
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
  */
  
  if(scene.eye().frame().dampingFriction() == 0)
    scene.eye().frame().setDampingFriction(0.5);
  else
    scene.eye().frame().setDampingFriction(0);
  println("Camera damping friction now is " + scene.eye().frame().dampingFriction());
}



