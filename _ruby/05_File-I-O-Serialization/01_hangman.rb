module Hangman
  
  class Game
    attr_accessor :player1, :board, :fileLineLimit, :word, :guessCorrectly, :wordLength
    
    def initialize
      @fileLineLimit = 61_407
      @player1 = Player.new
	  @word = getWord
	  @wordLength = @word.length
      @board = Board.new#(@word)
	  @guessCorrectly = false
    end
	
	def display
	  @board.showBoard
	  if(!over?)
	    pIn = @player1.getPlayerInput
	    p checkGuess(pIn)
	    @board.addLimb
	  end 
	  showSpaces
	end
	
	def showSpaces
	  puts ""
	  if(!over?)
	    @wordLength.times { |x| print " _" }
      else
	    @board.showBoard
	    puts "ANSWER:"
		@wordLength.times { |x| print " #{@word[x]}"}
      end
	  puts ""
	end
	
	def checkGuess(guess)
	  _ret = []
	   i=0
	  @word.downcase.each_char do |c|
		if(c == guess.downcase)
		  _ret << i
		end
		i += 1
	  end
	  _ret
	end
	
	def over?
	  @board.isOver
	end
	
	def isWinner?
	  guessCorrectly
	end
	
	private
	def getWord
      _ret = ""
	  filename = "5desk.txt"
	  f = File.new(filename,'r')
	  lines = f.readlines
	  while(_ret.length > 12 || _ret.length < 5)
	    randLine = rand(@fileLineLimit)
	    _ret = lines[randLine].chomp
	  end
	  f.close
	  _ret
	end
  end
  
  class Player
  attr_accessor :guessedLetters
    def initialize
	  @guessedLetters = []
    end
	
    def getPlayerInput
	  input = ""
	  while(input.length != 1)
	    puts "Enter a Letter to guess."
		input = gets.chomp
	  end
	  input
	end
  end
  
  class Board
	attr_accessor :board, :limbs, :numLimbs, :limbOrder, :isOver#, :word
	
    def initialize#(gameWord)
		@numLimbs = 0
		@limbs = ["O","/","|","/","\\","\\"," "]
		@limbOrder = [2,3,3,4,3,4,5]
		@board = buildBoard
		@isOver = false
#		@word = gameWord
    end
	
	def buildBoard
		board0 = "     _____"
		board1 = "    |     |"
		board2 = "    |     "
		board3 = "    |    "
		board4 = "    |    "
		board5 = "    |"
		board6 = "  -----"
		board = [board0,board1,board2,board3,board4,board5,board6]
	end
	
	def showBoard
		@board.each { |line| puts line }
	end
	
	def addLimb
		@board[@limbOrder[@numLimbs]] += @limbs[@numLimbs]
		@numLimbs +=1
		if(@numLimbs > 5)
		  @isOver = true
		end
	end
  end
  
  game = Game.new
  #game.display
  
  while(!game.over?)
    puts game.word
    game.display
  end
    #game.display
  
  #End results of game win/lose
  
end
