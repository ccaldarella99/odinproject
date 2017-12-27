let z;
let isStarted = false;
let minutes = parseInt(document.getElementById('time').textContent.substring(0,2));
let seconds = parseInt(document.getElementById('time').textContent.substring(3,5));
let totalSeconds = (minutes*60) + seconds;
let isBreak = false;
let isBreakLong = false;
let countBreak = 1;
inUse('set-time');

function setTotalSeconds(stringTime) {
	document.getElementById('Timer').textContent = "0:00";
	let stringTimeToMinutes = parseInt(stringTime.substring(0,2));
	let stringTimeToSeconds = parseInt(stringTime.substring(3,5));
	let _ret = (stringTimeToMinutes*60) + stringTimeToSeconds + 1;
	return _ret
}

function setDisplayTime() {
	let displayMin = parseInt(totalSeconds/60);
	let displaySec = totalSeconds%60;
	let _ret = displayMin.toString() + ":" + padding(displaySec);
	return _ret;
}

function startStop() {
	if (isStarted) {
		stop();
		isStarted = false;
	} else {
		z = setInterval(function(){ start() }, 1000);
		isStarted = true;
	}
}

function inUse(itemInUse) {
	document.getElementById('set-long-break').classList.remove('in-use');
	document.getElementById('set-break').classList.remove('in-use');
	document.getElementById('set-time').classList.remove('in-use');
	document.getElementById(itemInUse).classList.add('in-use');
}

function classChanges() {
	if(isBreak) {
		document.getElementById('bg-color').classList.remove('bg-blue');
		document.getElementById('bg-color').classList.add('bg-red');
		document.getElementById('Timer').classList.remove('bg-blue');
		document.getElementById('Timer').classList.add('bg-red');
	} else {
		document.getElementById('bg-color').classList.remove('bg-red');
		document.getElementById('bg-color').classList.add('bg-blue');
		document.getElementById('Timer').classList.remove('bg-red');
		document.getElementById('Timer').classList.add('bg-blue');
	}
}

function padding(inSeconds) {
	let _ret = inSeconds.toString();
	if(_ret.length == 1) {
		_ret = "0" + _ret;
	}
	return _ret;
}

function start() {
	let d = new Date();
	let time = d.getTime();
	
	if(totalSeconds > 1) {
		totalSeconds--;
		document.getElementById('Timer').textContent = setDisplayTime();
	} else {
		if(isBreak) {
			isBreak = false;
			countBreak++;
			if(countBreak > 4) {
				countBreak = 1;
				document.getElementById('block-1').classList.remove('square-hide');
			}
			totalSeconds = setTotalSeconds(document.getElementById('time').textContent);
			inUse('set-time');
		} else {
			isBreak = true;
			if(countBreak % 4 == 0) {
				isBreakLong = true;
				document.getElementById('block-1').classList.remove('bullet-yellow');
				document.getElementById('block-2').classList.remove('bullet-yellow');
				document.getElementById('block-3').classList.remove('bullet-yellow');
			} else if(countBreak == 3) {
				isBreakLong = false;
				document.getElementById('block-1').classList.add('bullet-yellow');
				document.getElementById('block-2').classList.add('bullet-yellow');
				document.getElementById('block-3').classList.add('bullet-yellow');
			} else if(countBreak == 2) {
				isBreakLong = false;
				document.getElementById('block-1').classList.add('bullet-yellow');
				document.getElementById('block-2').classList.add('bullet-yellow');
				document.getElementById('block-3').classList.remove('bullet-yellow');
			} else if(countBreak == 1) {
				isBreakLong = false;
				document.getElementById('block-1').classList.add('bullet-yellow');
				document.getElementById('block-2').classList.remove('bullet-yellow');
				document.getElementById('block-3').classList.remove('bullet-yellow');
			}
			if(!isBreakLong) {
				totalSeconds = setTotalSeconds(document.getElementById('break').textContent);
				inUse('set-break');
			} else {
				totalSeconds = setTotalSeconds(document.getElementById('long-break').textContent);
				inUse('set-long-break');
			}
		}
		classChanges();
	}
}

function stop() {
	clearInterval(z);
}





function addTime(getId) {
//	resetTimer();
	element = document.getElementById(getId);
	elMinute = element.textContent.substring(0,2);
	if(parseInt(elMinute) < 99) {
		let newTime = parseInt(elMinute)+1;
		element.textContent = newTime.toString() + ":00";
		if(getId == "time") {
			document.getElementById('Timer').textContent = newTime.toString() + ":00";
			minutes = newTime;
			seconds = 0;
			totalSeconds = minutes * 60;
		}
	}
}

function decTime(getId) {
//	resetTimer();
	element = document.getElementById(getId);
	elMinute = element.textContent.substring(0,2);
	if(parseInt(elMinute) > 1) {
		let newTime = parseInt(elMinute)-1;
		element.textContent = newTime.toString() + ":00";
		if(getId == "time") {
			document.getElementById('Timer').textContent = newTime.toString() + ":00";
			minutes = newTime;
			seconds = 0;
			totalSeconds = minutes * 60;
		}
	}
}

function resetTimer() {
	//STOP ANY TIMERS
	stop();
	
	isStarted = false;
	countBreak = 1;
	isBreak = false;
	isBreakLong = false;

	document.getElementById('break').textContent = "5:00";
	document.getElementById('long-break').textContent = "15:00";
	document.getElementById('time').textContent = "25:00";
	document.getElementById('Timer').textContent = "25:00";
	
	document.getElementById('set-long-break').classList.remove("in-use");
	document.getElementById('set-break').classList.remove("in-use");
	document.getElementById('set-time').classList.remove("in-use");
	document.getElementById('set-time').classList.add("in-use");
}


