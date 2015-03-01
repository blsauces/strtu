/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/26605*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
// Scintillating Grid 
// Author: Rupert Russell
// October 2, 2010
// Schtauf, M., Lingelbach, B., Wrist, E.R. (1997)
// The scintillating grid illusion. Vision Research,
// 37, 1033-1038.
// JS port by Jean Pierre Charalambos
var ilusiones=0;

function setup() {
    var myCanvas = createCanvas(document.getElementById("principal").offsetWidth, windowHeight/2);
    myCanvas.parent('scintillatingDiv');
	myCanvas.id("scintillating_grid")
    strokeWeight(3);        // medium weight lines 
    smooth();               // antialias lines
    stroke(100, 100, 100);  // dark grey colour for lines
    //noLoop();
 
}

function draw() { 
	
	var color=[parseInt(document.getElementById("colorSelector").value.slice(0,2),16),parseInt(document.getElementById("colorSelector").value.slice(2,4),16),parseInt(document.getElementById("colorSelector").value.slice(4,6),16)];
	var pointSize=document.getElementById("pointSizeSlider").value;
    document.getElementById("pointSizeText").innerHTML=document.getElementById("pointSizeSlider").value;
	var lineSize=document.getElementById("lineSizeSlider").value;
    document.getElementById("lineSizeText").innerHTML=document.getElementById("lineSizeSlider").value;
	var rhombusSize=document.getElementById("rhombusSizeSlider").value;
	document.getElementById("rhombusSizeText").innerHTML=document.getElementById("rhombusSizeSlider").value;
	randomSeed(document.getElementById("randomSeedSlider").value);
	document.getElementById("randomSeedText").innerHTML=document.getElementById("randomSeedSlider").value;
	
	background(color[0],color[1],color[2]);// black background
    var step = parseInt(document.getElementById("stepSizeSlider").value);
    document.getElementById("stepSizeText").innerHTML=document.getElementById("stepSizeSlider").value;          // grid spacing
	
	
    var pair=false;
    if(ilusiones%3==0){// Circles
		strokeWeight(lineSize);
		stroke((color[0]+100)%255, (color[1]+100)%255, (color[2]+100)%255);  // dark grey colour for lines
		//vertical lines
		for (var x = step; x < width; x = x + step) {
			line(x, 0, x, height);
		}
		
		//horizontal lines
		for (var y = step; y < height; y = y + step) {
			line(0, y, width, y);
		}
		ellipseMode(CENTER);
		stroke(255-color[0], 255-color[1], 255-color[2]);  // white circles
		for (var i = -step; i < width +step; i = i + step) {
			for (var j = -step; j < height +step; j = j + step) {
				strokeWeight(pointSize); 
				point(i, j);
			}
		}
	}else if(ilusiones%3==1){
		strokeWeight(0);
		var i2=0;
		for (var i = step; i < width +step*2; i = i + step) {
			//if((width/step)%2>0 && i>i2){pair=!pair;i2=i;}
			for (var j = step; j < height +step*2; j = j + step) {
				text("step: "+step+" width"+width, 12, 40);
				pair=!pair;
				if(pair) {
					fill((color[0]+200)%255,(color[1]+200)%255,(color[2]+200)%255);
					beginShape(QUADS);
					vertex(i,j);
					vertex(i-step,j);
					vertex(i-step,j-step);
					vertex(i,j-step);
					vertex(i,j);
					endShape();
				}
			}
		}		
		for (var i = -step; i < width +step; i = i + step) {
			for (var j = -step; j < height +step; j = j + step) {	
				
				if((floor(random(100))%2)===0)pair=!pair;
				
				if(pair)fill(255, 255, 255);
				else fill(0, 0, 0);
				beginShape(QUADS);
				vertex(i, j);
				vertex(i-rhombusSize/4, j-rhombusSize/4); 
				vertex(i, j-rhombusSize/2); 	
				vertex(i+rhombusSize/4, j-rhombusSize/4);
				vertex(i,j);				
				endShape();
				if(pair) fill(0, 0, 0);
				else fill(255, 255, 255);
				beginShape(QUADS);
				vertex(i, j);
				vertex(i+rhombusSize/4, j-rhombusSize/4); 
				vertex(i+rhombusSize/2, j); 
				vertex(i+rhombusSize/4, j+rhombusSize/4);
				vertex(i,j);
				endShape();
				if(pair)fill(255, 255, 255);
				else fill(0, 0, 0);
				beginShape(QUADS);
				vertex(i, j);
				vertex(i+rhombusSize/4, j+rhombusSize/4); 
				vertex(i, j+rhombusSize/2); 
				vertex(i-rhombusSize/4, j+rhombusSize/4);
				vertex(i,j);
				endShape();
				if(pair) fill(0, 0, 0);
				else fill(255, 255, 255);
				beginShape(QUADS);
				vertex(i, j);
				vertex(i-rhombusSize/4, j+rhombusSize/4); 
				vertex(i-rhombusSize/2, j);
				vertex(i-rhombusSize/4, j-rhombusSize/4);
				vertex(i,j);
				endShape();
				//translate(rhombusSize/2,rhombusSize/2);
				//rotate(45);
				
			}
		}
	}else if(ilusiones%3==2){
		strokeWeight(0);
		var range=random(-step,step);
		for (var j = step; j < height +100; j = j + step) {	
				range=random(-step,step);
		for (var i = -step; i < (width+step*2); i = i + step) {
			pair=!pair;
			
				if(pair) fill(255-color[0], 255-color[1], 255-color[2]);
				else fill(color[0], color[1], color[2]);
				beginShape(QUADS);
				vertex(i+range,j);
				vertex(i+range-step,j);
				vertex(i+range-step,j-step);
				vertex(i+range,j-step);
				vertex(i+range,j);
				endShape();
			}
		}
		strokeWeight(lineSize);
		for (var y = step; y < height; y = y + step) {
					line(0, y, width, y);
		}		
	}
	fill(0);
	strokeWeight(3);
	textStyle(BOLD);
	textSize(50);
	textFont("Liberation_sans");
	text(floor(frameRate()), 12, 40);
}


function windowResized() {
  resizeCanvas(document.getElementById("principal").offsetWidth, windowHeight/2);
}