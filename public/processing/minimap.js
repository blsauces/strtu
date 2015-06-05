var navigationCanvas,
minimapCanvas,
navigationScale,
minimapScale,
canvasWidth,
canvasHeight,
graphicWidth,
graphicHeight,
translationX,
translationY,
mouseOver,
rotacion,
img;


function preload() {
	img = loadImage("fotos/a.jpg");
}

function setup() {
	canvasWidth=document.getElementById("principal").offsetWidth;
	canvasHeight=windowHeight/2;
	navigationScale=1;
	minimapScale=0.25;
	translationX=0;
	translationY=0;
	mouseOver=false;
	/*graphicWidth=canvasWidth;
	graphicHeight=canvasHeight;*/
	graphicWidth=img.width;
	graphicHeight=img.height;
	
	
	var containerCanvas = createCanvas(canvasWidth, canvasHeight);
	containerCanvas.parent('minimapDiv');
	containerCanvas.id("containerCanvas");
	containerCanvas.mouseOver(function(){mouseOver=true});
	containerCanvas.mouseOut(function(){mouseOver=false});
	
	navigationCanvas=createGraphics(graphicWidth, graphicHeight,'p2d');//'p2d'		
	
	minimapCanvas=createGraphics(graphicWidth, graphicHeight,'p2d');//'p2d''webgl'
	minimapCanvas.scale(minimapScale);
	
    //smooth();
    //noLoop();
	
	textStyle(BOLD);
	textSize(50);
	textFont("Liberation_sans");
}

function draw() { 

	//background(0);
	//imageMode(CENTER);
	navigationCanvas.background(255);	
	drawScene(navigationCanvas);
	image(navigationCanvas, 0, 0);
	
	//imageMode(CORNER);/
	minimapCanvas.background(0);	
	drawScene(minimapCanvas);
	drawPOV(minimapCanvas);
	image(minimapCanvas, canvasWidth-minimapScale*graphicWidth, canvasHeight-minimapScale*graphicHeight);
	
	//fill(255);
	stroke(0);	
	strokeWeight(1);
	text(frameRate().toFixed(1), 12, 40);
	//text(translationX*navigationScale, 12, 80);
	//text(Math.round(canvasWidth-graphicWidth*navigationScale), 12, 120);
}

function drawScene(pg){
	pg.push();
	pg.translate(translationX,translationY);
	pg.rotate(rotacion);	
	pg.image(img);
	drawAxis(pg);	
	pg.fill(0, 255, 255);
	pg.rect(500+translationX, 0+translationY, 100, 10, 5);
	
	pg.push();
	pg.translate(150+translationX, 120+translationY);
	pg.rotate(QUARTER_PI+rotacion); 
	drawAxis(pg);
	pg.fill(255, 0, 255);
	pg.rect(0+translationX, 0+translationY, 30, 10, 5);
	pg.rotate(QUARTER_PI+rotacion);//?
	
	pg.push();
	pg.translate(100+translationX, 100+translationY);
	pg.rotate(QUARTER_PI+rotacion);
	drawAxis(pg);
	pg.fill(255, 255, 0);
	pg.rect(0+translationX, 0+translationY, 30, 10, 5);
	
	pg.pop();
	pg.pop();
	pg.fill(0, 255, 0);
	pg.triangle(30+translationX, 75+translationY, 58+translationX, 20+translationY, 86+translationX, 75+translationY);
	
	
	pg.pop();
}

function drawAxis(pg) {
	pg.strokeWeight(2);
	pg.stroke(255, 0, 0);
	pg.line(0+translationX, 0+translationY, 100+translationX, 0+translationY);
	pg.text("X", 100 + 5+translationX, 0+translationY);
	
	pg.stroke(0, 0, 255);
	pg.line(0+translationX, 0+translationY, 0+translationX, 100+translationY );
	pg.text("Y", 0+translationX, 100 + 15+translationY);
}

function drawPOV(pg){
	pg.noFill();
	pg.strokeWeight(5);
	pg.stroke(255,0,0);
	
	pg.rect(0, 0,canvasWidth/navigationScale,canvasHeight/navigationScale);	
}

function actualizarValor(id,valor){
	document.getElementById(id).innerHTML=valor;	
}
function setFramerate(n){
	frameRate(n);
}
function setMinimapScale(n){
	minimapCanvas.scale(1/minimapScale);
	minimapScale = parseFloat(n);
	minimapCanvas.scale(minimapScale);   
}
function setRotacion(n){
	rotacion=n*PI/180;   
}
function mouseDragged(){
	if(mouseOver){
		var X=parseInt(translationX+((winMouseX-pwinMouseX)/navigationScale));
		if(X <= 0 && X*navigationScale >= canvasWidth-graphicWidth*navigationScale){translationX=X;}
		var Y=parseInt(translationY+((winMouseY-pwinMouseY)/navigationScale));	
		if(Y <= 0 && Y*navigationScale >= canvasHeight-graphicHeight*navigationScale){translationY=Y;}
		console.log(canvasWidth,X,navigationScale,graphicWidth*navigationScale,(winMouseY-pwinMouseY));
	}
}
function mouseWheel(e){
	if(mouseOver){
		console.log(e);
		if(e.detail!=0){var delta=(e.detail%(0.0989898989898/navigationScale));}
		else{var delta=(e.deltaY%(0.0989898989898/navigationScale));}
		console.log(delta,navigationScale,(navigationScale-delta)*graphicWidth,canvasWidth);
		if ((navigationScale-delta)*graphicWidth >= canvasWidth && (navigationScale-delta)*graphicHeight >= canvasHeight && navigationScale-delta <= 8) {
			
			navigationCanvas.scale(1/navigationScale);			
			navigationScale =navigationScale-delta;
			navigationScale=(navigationScale);
			navigationCanvas.scale(navigationScale);
			if(translationX*navigationScale <= Math.round(canvasWidth-graphicWidth*navigationScale)){
				translationX+=Math.round(canvasWidth-graphicWidth*navigationScale-translationX*navigationScale);
			}
			if(translationY*navigationScale <= Math.round(canvasHeight-graphicWidth*navigationScale)){
				translationY+=Math.round(canvasHeight-graphicHeight*navigationScale-translationY*navigationScale);
			}
		}
		
		
		
	}
	
}
function windowResized() {
  resizeCanvas(document.getElementById("principal").offsetWidth, windowHeight/2);
}