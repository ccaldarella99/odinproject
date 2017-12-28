function echo(input) {
	return input;
}

function shout(input) {
	return input.toUpperCase();
}

function repeat() {
	let _ret = arguments[0] + " " + arguments [0];
	if(arguments[1] > 2) {
		for (let i=2; i< arguments[1]; i++) {
			_ret += " " + arguments[0]
		}
	}
	return _ret;
}

function pieceOfWord() {
	if(arguments[1] > 1) {
		return arguments[0].slice(0,arguments[1]);
	}
	return arguments[0].charAt(0);
}

function firstWord(input) {
	let arr1 = input.split(" ");
	return arr1[0];
}

function capitalize(word) {
	return word.charAt(0).toUpperCase() + word.slice(1);
	// This function just capitalizes the word given to it, use in conjunction with titleCreator
}

function titleCreator(input) {
	let arr1 = input.split(" ");
	arr1[0] = capitalize(arr1[0]);
	for (let i=1; i< arr1.length; i++) {
		if (arr1[i].length > 3 && arr1[i] != "over")  {
			arr1[i] = capitalize(arr1[i]);
		}
	}
	return arr1.join(" ");
}

module.exports = {
	echo,
	shout,
	repeat,
	pieceOfWord,
	firstWord,
	titleCreator
}
