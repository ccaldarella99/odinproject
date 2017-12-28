var removeFromArray = function() {
	let arr1 = arguments[0];
	for (let i=1; i<arguments.length; i++) {
		for (let j=0; j< arr1.length; j++) {
			if (arr1[j] == arguments[i]) {
				arr1.splice(j,1);
			}
		}
	}
	return arr1;
}

module.exports = removeFromArray
