const RPS_ARRAY = ["Rock", "Paper", "Scissors"];

function getRandom(randomNumberLimit) {
	return Math.floor(Math.random()*randomNumberLimit);
}

function computer_play() {
	const NUMBER_RPS = 3;
	//let randomNum = getRandom(NUMBER_RPS);
	//return RPS_ARRAY[randomNum];
	return getRandom(NUMBER_RPS);
}

function play_RPS() {
	let message = "";
	let winner = -1;
	let computer = computer_play();
	let userInput = prompt("Enter 'Rock', 'Paper', or 'Scissors'");
	
	let rps = -1;
	if (userInput.match(/rock/i)) {
		rps = 0;
	} else if (userInput.match(/paper/i)) {
		rps = 1;
	} else if (userInput.match(/scissor|scissors/i)) {
		rps = 2;
	}
	
	if(rps == -1) {
		message = "Invalid Input!";
		winner = -1;
	} else if (rps == computer) {
		message = "It's a Draw!\n" + RPS_ARRAY[computer] + " ties with " + RPS_ARRAY[rps];
		winner = 0;
	} else if ((computer == rps + 1) || (computer == 0 && rps == 2)) {
		message = "You Lose!\n" + RPS_ARRAY[computer] + " beats " + RPS_ARRAY[rps];
		winner = 1;
	} else if ((computer +1 == rps) || (computer == 2 && rps == 0)) {
		message = "You Win!\n" + RPS_ARRAY[rps] + " beats " + RPS_ARRAY[computer];
		winner = 2;
	}
	return message;
}


//alert(play_RPS());
alert(game());


function game() {
	let score = [0, 0];
	let winner = -1;
	let message = "";
	for (let i=0; i<5; i++) {
		winner = play_RPS();
		alert(winner);
		if(winner.match(/You Lose/g)) {
			score[0]++;
		} else if (winner.match(/You Win/g)) {
			score[1]++;
		}
	}
	if(score[0] == score[1]) {
		message = "It's a Tie!";
	} else if (score[0] > score[1]) {
		message = "You Lose, " + score[0] + " to " + score[1];
	} else if (score[1] > score[0]) {
		message = "You Win, " + score[1] + " to " + score[0];
	} else {
message = "Error.";
	}
return message;
}

