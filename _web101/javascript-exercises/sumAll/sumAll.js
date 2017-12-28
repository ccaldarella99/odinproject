var sumAll = function(in1, in2) {
	let num1=0, num2=0, _ret=0;
	if(isNaN(in1) || isNaN(in2)) {
		return "ERROR";
	} else if (typeof in1 == "string" || typeof in2 == "string") {
		return "ERROR";
	} else if (in1 < 0 || in2 < 0) {
		return "ERROR";
	} else if (in1 == in2) {
		return in1;
	} else {
		if (in1 > in2) {
			num1 = in2;
			num2 = in1;
		} else {
			num2 = in2;
			num1 = in1;
		} 
		for(let i=num1; i<=num2; i++) {
			_ret += i;
		}
	}
	return _ret;
}

module.exports = sumAll
