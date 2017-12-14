
function add(n1, n2) {
	return n1+n2;
}

function subtract(n1, n2) {
	return n1-n2;
}

function multiply(n1, n2) {
	return n1*n2;
}

function divide(n1, n2) {
	return n1/n2;
}

function operate(op, num1, num2) {
	if (op == "add") {
		returns add(num1, num2);
	} else if(op == "subtract") {
		returns subtract(num1, num2);
	} else if(op == "multiply") {
		returns multiply(num1, num2);
	} else if(op == "divide") {
		returns divide(num1, num2);
	}
}
