document.addEventListener('keydown', (e) => {
	const keyName = e.key;
	const keyCode = keyName.charCodeAt(0);
	//alert(keyCode);
	if(keyCode >=48 &&  keyCode <=57) { 
		clickNum(keyName);
	} else if (keyCode == 42 || keyCode == 43 || keyCode == 45 || keyCode == 47) {
		clickOp(keyName);
	} else if (keyCode == 69) {
		equals();
//	} else if (keyCode == 27) {
//		clearDisplay();
	}
});

const disp = document.getElementById("display");
let key = "";
let op = "";
let secondNum = false;
let firstEq = true;
let firstOp = true;
let hasDecimal = false;

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
	if (op == "add" ||op == "+") {
		return add(num1, num2);
	} else if(op == "subtract" ||op == "-") {
		return subtract(num1, num2);
	} else if(op == "multiply" ||op == "*") {
		return multiply(num1, num2);
	} else if(op == "divide" ||op == "/") {
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

function decimalPoint() {
	if(!hasDecimal) {
		hasDecimal = true;
		clickNum('.');
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
	hasDecimal = false;
}



function clearDisplay() {
	disp.innerHTML = "0";
	key = "";
	op = "";
	secondNum = false;
	firstEq = true;
	firstOp = true;
	hasDecimal = false;
}




