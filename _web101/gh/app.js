
function search() {
	var q = document.getElementById('q').value;
	q = q.replace(/\s/g, '+');
	location = 'https://www.google.com/search?q='+q;
	return false;
}

