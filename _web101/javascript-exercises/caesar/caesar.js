var caesar = function(str, shift) {
	let input = str;
	let _ret = "";
	let letter = "";
	let code = 0;
	let temp = 0;
	let newShift = shift%26;
	
	for (let i=0; i< input.length;i++) {
		letter = input.charAt(i);
		code = input.charCodeAt(i);
		
		if(code>=97 && code<=122) {
			temp = code + newShift;
			if(temp<97) {
				temp += 26;
			} else if (temp>122) {
				temp -= 26;
			}
			_ret += String.fromCharCode(temp);
		} else if (code>=65 && code<=90) {
			temp = code + newShift;
			if(temp<65) {
				temp += 26;
			} else if (temp>90) {
				temp -= 26;
			}
			_ret += String.fromCharCode(temp);
		} else {
			_ret += letter;
		}
	}
	
	return _ret;
}

module.exports = caesar
