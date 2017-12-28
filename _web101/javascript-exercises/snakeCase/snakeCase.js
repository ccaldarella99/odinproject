function isLower(str) {
	let code = str.charCodeAt(0);
	if (code >= 97  && code <= 122){
		return true;
	}
	return false;
}

function isCap(str) {
	let code = str.charCodeAt(0);
	if (code >= 65  && code <= 90) {
		return true;
	}
	return false;
}

var snakeCase = function(str) {
	let input = str;
	let _ret = input.charAt(0).toLowerCase();
	let countLower = 0;
	let letter = "";
	let prev = "";
	
	for(let i=1; i<input.length; i++) {
		letter = input.charAt(i);
		prev = _ret.charAt(_ret.length-1);
	
		if(isLower(letter)) {
			_ret += letter;
			countLower++;
		} else if (isCap(letter)) {
			if(i>3 && countLower > 3){
				_ret += "_" + letter.toLowerCase();
			} else {
				_ret += letter.toLowerCase();
			}
			countLower = 0;
		} else {
			if(prev != "_") {
				_ret += "_";
				countLower = 0;
			}
		}

	}
	if(_ret.charAt(_ret.length-1) == "_") {
		_ret = _ret.slice(0, _ret.length-1);
	}
	
	return _ret;
}

module.exports = snakeCase
