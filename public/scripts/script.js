window.onerror = function(){//errorMsg, url, lineNumber, column, errorObj
	alert(JSON.stringify(arguments));
};

window.onload = function() {
	
};


/*var p5 = function(p5) {
  return function(p) {
    var r = p.random(0, 255);
    var g = p.random(0, 255);

    p.setup = function() {
        var myCanvas = p.createCanvas(400, 400);
		myCanvas.parent('principal');
		myCanvas.id("scintillating_grid")
		p.strokeWeight(3);        // medium weight lines 
		p.smooth();               // antialias lines
		p.stroke(100, 100, 100);  // dark grey colour for lines
		p.noLoop();
    };

    p.draw = function() {
		p.background(0);          // black background
		var step = 25;          // grid spacing
		
		//vertical lines
		for (var x = step; x < p.width; x = x + step) {
			p.line(x, 0, x, p.height);
		}
		
		//horizontal lines
		for (var y = step; y < p.height; y = y + step) {
			p.line(0, y, p.width, y);
		}
		
		// Circles
		p.ellipseMode(p.CENTER);
		p.stroke(255, 255, 255);  // white circles
		for (var i = step; i < p.width -5; i = i + step) {
			for (var j = step; j < p.height -15; j = j + step) {
				p.strokeWeight(5); 
				p.point(i, j);
				p.strokeWeight(3); 
			}
		}
    };
  };
};*/


(function(){
	var app=angular.module("index",["ngRoute"/*,'angular-p5'*/])/*.factory('exampleSketch', ['p5', p5])*/;
	 

	var mainController=function($scope,$http){
		$scope.message="helloe";
		$scope.point=7;
			
		/*var videosSuccess=function(response){
			console.log(response.data);			
			for(var i=0;i<json.videos.nombre.length;i++){				
				video=document.createElement("video");
				video.setAttribute("src","./videos/"+json.videos.nombre[i]);	
				video.setAttribute("controls", "controls");
				video.setAttribute("preload", "metadata");
				video.setAttribute("type","video/webm");
				document.getElementById("listarvideosdiv").appendChild(video);						
			}
			div=document.createElement("div");
			div.setAttribute("style","clear:both;");
			document.getElementById("listarvideosdiv").appendChild(div);
		};
		var videosError=function(response){
			console.log(response.status+response.statusText);
		};
		$http({
			method: 'GET',
			url: "http://localhost/videos.json",
			//,headers: {'Content-Type': 'application/x-www-form-urlencoded'}
		}).then(videosSuccess,videosError);*/
		
		$scope.getVideoUrl=function(nombre){
			return "./videos/"+nombre;
		};	
		
	};	
	app.controller("mainController",mainController);
	
	
	
	
}());


