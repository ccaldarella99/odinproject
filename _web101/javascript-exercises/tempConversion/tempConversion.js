var ftoc = function(t) {
  return Math.round((t-32)*(5/9)*10)/10;
}

var ctof = function(t) {
  return Math.round(((t*(9/5))+32)*10)/10;
}

module.exports = {
  ftoc,
  ctof
}
