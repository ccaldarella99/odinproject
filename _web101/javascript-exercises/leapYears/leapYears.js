var leapYears = function(leapyear) {
	if (leapyear%100 == 0) {
		if (leapyear%400 == 0) {
			return true;
		} else {
			return false;
		}
	} else if (leapyear%4 == 0) {
		return true;
	}
	return false;
}

module.exports = leapYears
