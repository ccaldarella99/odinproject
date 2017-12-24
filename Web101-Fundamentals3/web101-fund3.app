
function add7(number1) {
	return number1 + 7;
}

function multiply(number1, number2) {
	return number1 * number2;
}

function capitalize(inStr) {
	return inStr.charAt(0).toUpperCase() + inStr.slice(1, inStr.length);
}

function lastLetter(inStr) {
	return inStr.charAt(inStr.length - 1);
}


function fundamentals3() {
	let capStr = "capItaLiZE tHe fiRSt LETter";
	
	let writeTo = document.getElementById("web101-fund3");
	writeTo.innerHTML = "Add 7 to 10: " + add7(10);
	writeTo.innerHTML += "<br>Multiply 6 x 7: " + multiply(6,7);
	writeTo.innerHTML += "<br>" + capStr + ": " + capitalize(capStr);
	writeTo.innerHTML += "<br>Last letter of previous string: " + lastLetter(capStr);
}

fundamentals3();

