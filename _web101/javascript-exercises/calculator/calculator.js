function add (n1, n2) {
	return Number(n1) + Number(n2);
}

function subtract (n1, n2) {
	return Number(n1) - Number(n2);
	
}

function sum (arr1) {
	let _ret = 0;
	for(let i=0; i< arr1.length; i++) {
		_ret += arr1[i];
	}
	return _ret;
}

function multiply (arr1) {
	let _ret = 1;
	for(let i=0; i< arr1.length; i++) {
		_ret *= arr1[i];
	}
	return _ret;	
}

function power(n1, n2) {
	return 	n1**n2;
}

function factorial(n) {
	if (n == 1) {
		return n;
	} else if (n < 1) {
		return 0;
	}
	return n*factorial(n-1);
}

module.exports = {
	add,
	subtract,
	sum,
	multiply,
    power,
	factorial
}
