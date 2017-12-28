var reverseString = function(inputStr) {
	let revStr = "";
	for(let i=inputStr.length-1; i>=0; i--) {
		revStr += inputStr.charAt(i);
	}
	return revStr;
}

module.exports = reverseString
