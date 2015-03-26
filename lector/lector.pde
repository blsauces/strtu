
 size(500,500,P3D);
 background(0);
 noSmooth();
 strokeWeight(10);
 String[] puntos = loadStrings("Im46.off");
  
  for (int i = 2; i < puntos.length; i++) {
    String[] punto = split(puntos[i], " ");        
    float x = Float.parseFloat(punto[0])*100;
    float y = Float.parseFloat(punto[1])*100;
    float z = Float.parseFloat(punto[2])*100;
    float r = Integer.parseInt(punto[3]);
    float g = Integer.parseInt(punto[4]);
    float b = Integer.parseInt(punto[5]);
    stroke(r,g,b);
    point(x,y,z);   
  }



