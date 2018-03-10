require "tic-tac-toe"

describe TicTacToe do
  it "should play 2-player, p1 wins as Xs" do
    tictactoe = TicTacToe
    game = tictactoe::Game.new("2", "X", 2)
    game.nextTurn(1)
    game.nextTurn(2)
    game.nextTurn(3)
    game.nextTurn(4)
    game.nextTurn(5)
    game.nextTurn(6)
    game.nextTurn(7)
    game.winner == game.player1.token
#    if(game.winner.nil?)
#      puts "\nWe'll call it a draw."
#    elsif (game.winner == game.player1.token)
#      puts "\n#{game.player1.name} Wins!"
#    elsif (game.winner == game.player2.token)
#      puts "\n#{game.player2.name} Wins!"
#    end
  end
end

describe TicTacToe do
  it "should play 2-player vs computer" do
    tictactoe = TicTacToe
    game = tictactoe::Game.new(1, "X", 2)
    game.nextTurn
    game.nextTurn(2)
    game.nextTurn
    game.nextTurn(4)
    game.nextTurn
    game.nextTurn(6)
    game.nextTurn unless game.winner
    game.nextTurn(8) unless game.winner
    game.nextTurn unless game.winner
    game.nextTurn(1) unless game.winner
    game.winner == game.player1.token
    game.winner == game.player2.token
  end
end
