module ConnectFour
  
  class Game
    attr_accessor :winner, :board

    def initialize
      @winner=false
      @board = Board.new
    end
    
    def playCmd
      @board.show
    end
    
    def play
    end

    def isWinner?
      @winner
    end
  end
  
  class Player
  end
  
  class Board
    attr_accessor :pos

    def initialize
      @pos = [[" ", " ", " "," ", " ", " "," "],
              [" ", " ", " "," ", " ", " "," "],
              [" ", " ", " "," ", " ", " "," "],
              [" ", " ", " "," ", " ", " "," "],
              [" ", " ", " "," ", " ", " "," "],
              [" ", " ", " "," ", " ", " "," "]]
    end
    
    def show
      line = " ----------------------------- "
      nonL = " | "
      13.times do |x|
        if(x%2 > 0)
            puts "#{nonL}#{pos[x/2].join(nonL)}#{nonL}"
        else
          puts line
        end
      end
    end
    
  end
  
end

#cf = ConnectFour
#game = cf::Game.new
#game.playCmd
