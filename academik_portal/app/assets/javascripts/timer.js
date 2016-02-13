"use strict";
$(document).ready(function(){

(function(){
	var timer = function(){
		$('.start').click(function(){
			console.log("clicked!");
			setInterval(function(){
				alert("Time's Up")
			// },600000)
		}, 1000)
			// var minutes = Math.floor(1000 % 60);
			// var seconds = Math.floor(1000 % 60);
			// var countdown = (minutes -= 1000) && (seconds -= 1000);
			})
		// return minutes, seconds
	timer();
		};
	})
});

