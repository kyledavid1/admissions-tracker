"use strict";
$(document).ready(function(){
	console.log("loaded");


function startTimer(duration, display) {
    var timer = duration, minutes, seconds;

    setInterval(function () {
        minutes = parseInt(timer / 60, 10);
        seconds = parseInt(timer % 60, 10);

        minutes = minutes < 10 ? "0" + minutes : minutes;
        seconds = seconds < 10 ? "0" + seconds : seconds;

        display.textContent = minutes + ":" + seconds;

        if (--timer < 0) {
            timer = duration;
        }
    }, 1000);
}	

window.onload = function () {
    var tenMinutes = 60 * 10,
        display = document.querySelector('#timer');
    $(".start").click(function() {
	startTimer(tenMinutes, display)
	});
};
});