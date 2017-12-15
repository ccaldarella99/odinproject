const CANVAS_SIZE = 576;
let startNumberOfBoxes = 6;

const container = document.querySelector('#container');
container.setAttribute('style', 'width:' + CANVAS_SIZE + 'px; height:' + CANVAS_SIZE + 'px; background-color:#ddd;');


function getAttr() {
	let getNum = prompt("How many boxes?");
	if(!isNaN(getNum)) {
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
	clearBoxes();
	let btnPtn = CANVAS_SIZE + 20;
	let btn = document.createElement('button');
	btn.setAttribute('style','background-color:#7cf;position:absolute;top:' + btnPtn + 'px;padding:10px;width:75px;');
	btn.textContent = "Size";
	btn.addEventListener('click', getAttr);
	container.appendChild(btn);
}

function shadeBox() {
		div.setAttribute('style','background-color:#333;');
}

function makeBoxes(numBoxes) {
	for(let i=0;i<numBoxes;i++) {
		for(let j=0;j<numBoxes;j++) {
			setAttr(numBoxes);
		}
	}
}

function setAttr(numBoxes) {
	const div = document.createElement('div');
	let boxNum = numBoxes;
	let numPx = 0;

	if(numBoxes > 192) {
		boxNum = 192;
		numPx = 1;
	} else {
		numPx = Math.floor(CANVAS_SIZE/boxNum)-4;
	}

	div.setAttribute('style','color:#fff; background-color:#aaa; border:0px #00f solid; width:' + numPx + 'px; height:' + numPx + 'px; margin:0; padding:0px; display:inline-block;');
	div.addEventListener('onclick', shadeBox);

	for (let i=0; i<numBoxes;i++) {
		//row-container
		for (let j=0; j<numBoxes; j++) {
			div.classList.add('content');
			container.appendChild(div);
		}
	}
}




makeBoxes(startNumberOfBoxes);
makeBtn();

