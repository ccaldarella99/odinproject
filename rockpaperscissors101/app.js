let yourScore=0;
let computerScore=0;
let tieScore=0;

function shoot(rps) {
  let rpsWord = ["Rock", "Paper", "Scissors"];
  let generatedRps = Math.floor((Math.random()*1000)%3);
  let message = "You: " + rpsWord[rps];
  message += "<br>Computer: " + rpsWord[generatedRps] + "<br><br>";
  if(rps == generatedRps){
    message += "It is a Draw!";
	tieScore++;
  } else if (generatedRps == rps + 1 || (generatedRps == 0 && rps == 2)) {
    message += "The Computer Wins!";
	computerScore++;
  } else if (generatedRps + 1== rps || (generatedRps == 2 && rps == 0)) {
    message += "You Win!";
	yourScore++;
  }
  message += "<br>Try Again!"
  document.getElementById("output").innerHTML = message;
  document.getElementById("you").innerHTML = "You: " + yourScore;
  document.getElementById("comp").innerHTML = "Computer: " + computerScore;
  document.getElementById("ties").innerHTML = "Ties: " + tieScore;
}

function shoot2() {
  let message = "";
  let getRps = prompt("Type: 'Rock', 'Paper', or 'Scissors'");
  let rpsWord = ["Rock", "Paper", "Scissors"];
  let generatedRps = Math.floor((Math.random()*1000)%3);
  let rps = -1;
  if(getRps.match(/rock/i))
    {rps = 0;}
  else if(getRps.match(/paper/i))
    {rps = 1;}
  else if(getRps.match(/scissors/i))
    {rps = 2;}
  if (rps == -1) {
	  message = "Invalid input";
	  return -1;
  }
  else if(rps == generatedRps){
    message += "It is a Draw!";
	  tieScore++;
  } else if (generatedRps == rps + 1 || (generatedRps == 0 && rps == 2)) {
    message += "You Lose! " + rpsWord[generatedRps] + " beats " + rpsWord[rps];
	  computerScore++;
  } else if (generatedRps + 1== rps || (generatedRps == 2 && rps == 0)) {
    message += "You Win! " + rpsWord[rps] + " beats " + rpsWord[generatedRps];
	  yourScore++;
  }
  console.log(message);
  document.getElementById("output").innerHTML = message;
  document.getElementById("you").innerHTML = "You: " + yourScore;
  document.getElementById("comp").innerHTML = "Computer: " + computerScore;
  document.getElementById("ties").innerHTML = "Ties: " + tieScore;
//  alert(message);
	return 0;
}

function game() {
  for(let i = 0; i < 5; i++)
  { i += shoot2(); }
}
