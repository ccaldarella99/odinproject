module Hangman
  
  class Game
    attr_accessor :player1, :board, :fileLineLimit
    
    def initialize
      @fileLineLimit = 61_407
      @player1 = Player.new
      @board = Board.new
    end
  end
  
  class Player
    def initialize
    end
  end
  
  class Board
    def initialize
    end
  end
  
  
  
  
end


