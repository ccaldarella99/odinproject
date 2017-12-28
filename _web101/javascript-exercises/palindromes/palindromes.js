function removePunc(oldStr) {
	let _ret = "";
	for(let i=0; i<oldStr.length; i++) {
		if (oldStr.charCodeAt(i) >= 97  && oldStr.charCodeAt(i) <= 122) {
			_ret += oldStr.charAt(i)
		}
	}
	return _ret;
}

var palindromes = function(str) {
	let input = removePunc(str.toLowerCase());
	let tupin = "";
	for (let i=input.length-1; i>=0;i--) {
		tupin += input.charAt(i);
	}
	if (input == tupin) {
		return true;
	}
	return false;
}

module.exports = palindromes
