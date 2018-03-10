module TicTacToe
  
  class Game
    attr_accessor :board, :player1, :player2, :turn, :winner, :computer, :level
    
    def initialize(set_comput=nil, auto_player=nil, auto_level=nil)
      @board = Board.new
      @turn = "X"
      @computer = set_comput
      @computer ||= isComputer
      @player1 = Player.new(auto_player, auto_player, auto_player)
      @player2 = Player.new(@player1.token, @computer == "2" ? false : true, auto_player)
      if(!auto_level)
        @level = @computer == "2" ? 0 : getLevel
      else
        @level = auto_level
      end
    end
    
    def getLevel(auto_set=nil)
      if(auto_set == nil)
        puts "\nPick a Level:   1) Easy   2) Medium   3) Harder   4) Hardest"
        getLevelInput = gets.chomp
        if(getLevelInput.to_i > 3 || getLevelInput.upcase == "HARDEST")
          @level = 3
        elsif(getLevelInput.to_i > 2 || getLevelInput.upcase == "HARDER")
          @level = 2
        elsif(getLevelInput.to_i > 1 || getLevelInput.upcase == "Medium")
          @level = 1
        else
          @level = 0
        end
      elsif(auto_set >=0 && auto_set <=3)
        @level = auto_set
      else
        @level = 2
      end
    end
    
    def isComputer(auto_set=nil)
      if(auto_set == nil)
        loop do
          system "clear"
          puts "How many human Players will be participating today?"
          numPlayers = gets.chomp
          return numPlayers if(numPlayers == "1" || numPlayers == "2")
        end
      elsif(auto_set == "1" || auto_set == "2")
        return auto_set
      else
        return "1"
      end
    end
    
    def over?
      !isWinner? ? @board.board.include?(" ") : !isWinner?
    end
    
    def isWinner?
      xs = @board.board.each_index.select { |i| @board.board[i]=="X" }
      os = @board.board.each_index.select { |i| @board.board[i]=="O" }
      board.winning.each do |w|
        @winner = (w - os).empty? ? "O" : nil
        if @winner then break end
        @winner = (w - xs).empty? ? "X" : nil
        if @winner then break end
      end
      @winner
    end
    
    def getNumber
      getMove = 0
      hasGotNumber = false
      while(!hasGotNumber)
        getMove = getInput
        if(getMove == "Q" || getMove == "QUIT" || getMove == "EXIT")
          exit
        elsif(getMove.to_i.is_a? Integer)
          getMove = getMove.to_i
          if(getMove < 10 && getMove > 0)
            hasGotNumber = isTaken(getMove-1)
          else
            puts "Please pick a number from 1 through 9"
          end
        else
          puts "Please enter \'Q\', \'QUIT\', or \'EXIT\' to leave the game."
          puts "Or enter a numer from 1 through 9 to continue"
        end
      end
      getMove
    end
    
    def getInput
      if(@computer == "2" || @player1.token == @turn)
        playerName = @player1.token == @turn ? @player1.name : @player2.name
        puts "Pick a square, #{playerName}"
        getNumberInput = gets.chomp.upcase
      else
        getNumberInput = generateNumber
      end
      getNumberInput
    end
    
    def generateNumber
      if(@level < 1)
        return rand(1..9)
      end
      i=0
      bestMove = [0,0]
      all = []
      compWin = @board.board.each_index.select { |i| @board.board[i]==@player2.token }
      human = @board.board.each_index.select { |i| @board.board[i]==@player1.token }
      board.winning.each do |w|
        c = (w - compWin)
        h = (w - human)
        available = c- human
        all << available
        puts "Winning Squares: #{available}"
        if(c.length == 1 && available.length > 0 && available.detect(c[0]))
          bestMove = [20, c[0] + 1]
        end
        if(h.length == 1 && available.length > 0 && available.detect(h[0]))
          if(bestMove[0] < 15)
            bestMove = [15, h[0] + 1]
          end
        end
        if(c.length == 2 && available.length > 0 && available.detect(c[0]))
          if(bestMove[0] < 10)
            bestMove = [10, c[rand(0..1)] + 1]
          end
        end
        if(available.length == 1)
          if(bestMove[0] < 5)
            bestMove = [5, available[0] + 1]
          end
        end
      end
      all  = all.flatten
      if(@level == 2 && bestMove[0] == 0 && all.length < 9)
        mode = all.inject(Hash.new(0)) { |k, v| k[v] += 1; k }
        mode = mode.sort_by {|k,v| v}.reverse.to_h
        addToBest = mode.max_by {|k,v| v}
        bestMove[0] = addToBest[1]
        bestMove[1] = addToBest[0]+1
      end
      if(bestMove[0] == 0)
        bestMove[1] = rand(1..9)
      end
      puts bestMove[1]
      bestMove[1]
    end
    
    def nextTurn(getMove=nil)
      getMove ||= getNumber
      @board.writeMoveToBoard(getMove-1, @turn)
      system "clear"
      nameToken
      @board.show_example
      @board.show
      @turn = @turn == "X" ? @turn = "O" : @turn = "X"
    end
    
    def isTaken(square=nil)
      if(@board.board[square] == " ")
        return true
      end
      puts "This Square is taken, please select another."
      false
    end
    
    def nameToken
      puts "Player 1 is named: #{@player1.name} - they are #{@player1.token}s"
      puts "Player 2 is named: #{@player2.name} - they are #{@player2.token}s"
    end
    
  end
  
  
  class Player
    attr_accessor :name, :token
    
    def initialize(isTwo=nil, isComputer=nil, set_name=nil)
      if(isComputer)
        @name = "COMPUTER"
      else
        if(isTwo)
          print "\nOkay Player2. "
        else
          print "\nOkay Player1. "
        end
        if(!set_name)
          puts "WHAT! ...is your name?"
          @name = gets.chomp
        else
          oneTwo = isTwo == nil ? "2" : "1"
          @name = "Player#{isTwo}"
        end
        puts "Your name is #{@name}!"
      end
      if isTwo
        @token = isTwo == "X" ? "O" : "X"
        puts "#{@name} has been assigned #{@token}s"
      else
        while(@token != "X" && @token != "O")
          puts "Your pick! Xs or Os?"
          @token = gets.chomp.upcase
        end
      end
    end
    
  end
  
  
  class Board
    attr_accessor :board, :winning

    def initialize
      @board = []
      @example = []
      1.upto(9) { |x| @board[x-1] = " " }
      1.upto(9) { |x| @example[x-1] = x.to_s }
      @turn = "X"
      @winning = 
        [[0,1,2],[3,4,5],[6,7,8],
         [0,3,6],[1,4,7],[2,5,8],
         [0,4,8],[2,4,6]]
    end
    
    def show(input=nil)
      input ||= @board.dup
      puts "\n #{input[0]} | #{input[1]} | #{input[2]} "
      puts "---|---|---"
      puts " #{input[3]} | #{input[4]} | #{input[5]} "
      puts "---|---|---"
      puts " #{input[6]} | #{input[7]} | #{input[8]} \n\n"
    end
    
    def show_example
      show(@example)
      puts "Pick a number to take the square."
      puts "You cannot take a square that is already taken.\n"
    end
    
    def writeMoveToBoard(play, xo)
      @board[play] = xo
    end
  end
  
#  game = Game.new
#  
#  system "clear"
#  game.nameToken
#  game.board.show_example
#  game.board.show
#  
#  while game.over? do
#      game.nextTurn
#  end
#  
#  if(game.winner.nil?)
#    puts "\nWe'll call it a draw."
#  elsif (game.winner == game.player1.token)
#    puts "\n#{game.player1.name} Wins!"
#  elsif (game.winner == game.player2.token)
#    puts "\n#{game.player2.name} Wins!"
#  end
#  puts "\n"
end


#tictactoe = TicTacToe
#game = tictactoe::Game.new(1, "X", 2)
#game.nameToken
#game.board.show_example
#game.board.show
#
#while game.over? do
#    game.nextTurn
#end
#
#if(game.winner.nil?)
#  puts "\nWe'll call it a draw."
#elsif (game.winner == game.player1.token)
#  puts "\n#{game.player1.name} Wins!"
#elsif (game.winner == game.player2.token)
#  puts "\n#{game.player2.name} Wins!"
#end


