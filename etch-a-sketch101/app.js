let innerH = window.innerHeight -100;
let CANVAS_HEIGHT = innerH - 130;
let CANVAS_SIZE = CANVAS_HEIGHT;
let maxNum = 128;
let startNumberOfBoxes = 32;
let numPx = Math.floor(CANVAS_SIZE/startNumberOfBoxes);
let boxStyle = 'display:inline-block; margin:0; border:1px #ccf solid; ';
CANVAS_SIZE = (numPx) * startNumberOfBoxes +6;

const setBody = document.querySelector('body');
setBody.setAttribute('style', 'background-color:#f00;');

const topContainer = document.querySelector('#container');

const image = document.createElement('img');
image.setAttribute('src', 'http://fundemix.com/images/licensedLogos_etch.gif');
image.setAttribute('style', 'display:block; margin: 0 auto;');
topContainer.appendChild(image);

const container = document.createElement('div');
	container.setAttribute('style','margin:auto; display:flex; flex-wrap:wrap; border: 2px solid #333;');
	container.classList.add('next-container');
	topContainer.appendChild(container);

function getAttr() {
	let getNum = prompt("How many boxes?");
	if(!isNaN(getNum)) {
		clearBoxes();
		if(getNum > maxNum) {
			getNum = maxNum;
		}
		makeBoxes(getNum);
	} else {
		alert("Please enter a number.");
	}
}

function clearBoxes() {
	let all = [];
	all = container.querySelectorAll('div');
	for(let i=0; i<all.length; i++) {
		container.removeChild(all[i]);
	}
}

function makeBtn() {
	let bdy = document.querySelector('body');
	let btn = document.createElement('button');
	btn.setAttribute('style','background-color: #7cf; position: absolute; bottom: 20px; left:20px; padding: 10px; width: 75px; position: fixed; display: block;');
	btn.textContent = "Reset";
	btn.addEventListener('click', getAttr);
	btn.classList.add('reset');
	bdy.appendChild(btn);
}

function shakeBtn() {
	let bdy = document.querySelector('div');
	let btn = document.createElement('button');
	btn.setAttribute('style','background-color: #7cf; position: absolute; bottom: 20px; left:125px; padding: 10px; width: 75px; position: fixed; display: block;');
	btn.textContent = "SHAKE";
	btn.addEventListener('click', shakeBoxes);
	btn.classList.add('shake');
	bdy.appendChild(btn);
}

function shakeBoxes() {
	clearBoxes();
	makeBoxes(Math.floor(CANVAS_SIZE/(numPx+2)));
}

function shadeBox() {
			this.setAttribute('style', 'width:' + numPx + 'px; height:' + numPx + 'px; ' + boxStyle + ' background-color:#aaa;');
}

function makeBoxes(numBoxes) {
	var sq = numBoxes * numBoxes;
	for(let i=0;i<sq;i++) {
			setAttr(numBoxes);
	}
	var actualPx = (numPx+2) * numBoxes;
	CANVAS_SIZE = actualPx+4;
	topContainer.setAttribute('style', 'width:' + CANVAS_SIZE + 'px; height:' + innerH + 'px; background-color:#f00; margin: 0 auto;');
//	alert("numPx: " + numPx + "\nnumBoxes: " + numBoxes + "\nactualPx: " + actualPx + "\nnumSq: " + sq + "\nCsize: " + CANVAS_SIZE + "\nCheight: " + CANVAS_HEIGHT);
}

function setAttr(numBoxes) {
	const div = document.createElement('div');
	let boxNum = numBoxes;

	if(numBoxes > maxNum) {
		boxNum = maxNum;
	}
	numPx = Math.floor(CANVAS_HEIGHT/boxNum)-2;

	div.setAttribute('style', 'width:' + numPx + 'px; height:' + numPx + 'px; ' + boxStyle + ' background-color:#fff;');
	div.addEventListener('mouseover', shadeBox);
	div.classList.add('content');
	container.appendChild(div);
}


makeBoxes(startNumberOfBoxes);
shakeBtn();
makeBtn();

