function isVowel(str) {
	let check = str.charCodeAt(0);
	if(check == 97 || check == 101 || check == 105 || check == 111 || check == 117) {
		return true;
	}
	return false;
}

function translate(str) {
	let arr1 = str.split(" ");
	let arr2 = [];
	let _ret = "";
	let temp = "";
	let first = "";
	
	for(let i=0; i<arr1.length; i++) {
		temp = arr1[i];
		first = temp.toLowerCase();
		first = first.charAt(0);
		
		if(isVowel(first)) {
			arr2.push(temp + "ay");
		} else if(temp.charAt(0) == "q" && temp.charAt(1) == "u") {
			arr2.push(temp.slice(2,temp.length) + first + temp.charAt(1) + "ay");
		} else if(temp.charAt(1) == "q" && temp.charAt(2) == "u") {
			arr2.push(temp.slice(3,temp.length) + first + temp.charAt(1) + temp.charAt(2) + "ay");
		} else if(!isVowel(temp.charAt(1)) && !isVowel(temp.charAt(2))) {
			arr2.push(temp.slice(3,temp.length) + first + temp.charAt(1) + temp.charAt(2) + "ay");
		} else if(!isVowel(temp.charAt(1))) {
			arr2.push(temp.slice(2,temp.length) + first + temp.charAt(1) + "ay");
		} else {
			arr2.push(temp.slice(1,temp.length) + first + "ay");
		}
	}
	_ret = arr2.join(" ");
	return _ret;
}


module.exports = {
	translate
}

