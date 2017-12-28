var repeatString = function(getStr, times) {
	let msg = "";
	if (times >30) {
		times = 30;
	}

	if (times == 0){
		msg = "";
	} else if (times < 0) {
		msg = "ERROR";
	} else {
		for (let i=0; i<times; i++) {
			msg += getStr;
		}
	}
	return msg;
}

module.exports = repeatString
