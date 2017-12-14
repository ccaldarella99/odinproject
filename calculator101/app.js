const disp = document.getElementById("display");
let key = "";
let op = "";
let secondNum = false;
let firstEq = true;
let firstOp = true;

function add(n1, n2) {
	return parseInt(n1) + parseInt(n2);
}

function subtract(n1, n2) {
	return n1-n2;
}

function multiply(n1, n2) {
	return n1*n2;
}

function divide(n1, n2) {
	let snarky = ["How about entering a denominator that is NOT zero?",
			"Please stop trying to break the calculator by dividing by zero.",
			"HEY! We don't allow dividing by zero around here!"];
	if (n2 == 0) {
		alert(snarky[Math.floor(Math.random()*3)]);
		clearDisplay();
		return "0";
	} else {
		return n1/n2;
	}
}

function operate(op, num1, num2) {
	if (op == "add") {
		return add(num1, num2);
	} else if(op == "subtract") {
		return subtract(num1, num2);
	} else if(op == "multiply") {
		return multiply(num1, num2);
	} else if(op == "divide") {
		return divide(num1, num2);
	}
}

function equals() {
	let _ret;
	if (op != "" && key != "") {
		_ret = operate(op, key, disp.innerHTML);
		if(firstEq) {
			key = disp.innerHTML;
			firstEq = false;
		}
		disp.innerHTML = _ret;
firstEq = false;
	}
}

function clickNum(number) {
	if (disp.innerHTML == "0" && !secondNum) {
		disp.innerHTML = number;
	} else if (secondNum) {
		key = disp.innerHTML;
		disp.innerHTML = number;
		secondNum = false;
	} else if (disp.innerHTML.length < 14) {
		disp.innerHTML += number;
	}
}



function clickOp(operation) {
	if (firstOp) {
		firstOp = false;
	} else {
		equals();
	}
	op = operation;
	secondNum = true;
}



function clearDisplay() {
	disp.innerHTML = "0";
	key = "";
	op = "";
	secondNum = false;
	firstEq = true;
	firstOp = true;
}




