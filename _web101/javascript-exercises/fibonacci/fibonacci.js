var fibonacci = function(num) {
	let arr1 =[1,1]
	if(num <1) {
		return "OOPS";
	} else {
		for (let i=2; i<num;i++) {
			arr1.push(arr1[i-2]+arr1[i-1]);
		}
		total = arr1
		return arr1[num-1];
	}
}

module.exports = fibonacci
