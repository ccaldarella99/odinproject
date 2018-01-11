module Hangman
  require 'yaml'
  
  class Game
    attr_accessor :player1, :board, :fileLineLimit, :word, :guessCorrectly, :wordLength, :wordArray, :randLine
    
    def initialize
      @fileLineLimit = 61_407
      @player1 = Player.new
	    @word = getWord
	    @wordLength = @word.length
      @board = Board.new
	    @guessCorrectly = false
	    @wordArray = fillArr
    end

    
    def to_yaml
      YAML.dump ({
        :wordLength => @wordLength,
        :player => @player1,
        :board => @board,
        :wordArray => @wordArray,
        :word => @word
      })
    end
    
    def save_to_yaml
      @player1.selectSave = false
      filename = "hangman.sav"
      File.open(filename,'w') do |f|
        f.puts to_yaml
      end
      puts "Saved"
    end
    
    def load_from_yaml
      filename = "hangman.sav"
      content = File.read(filename)
      data = YAML.load content
      from_yaml(data[:wordlength],data[:player],data[:board],data[:wordArray],data[:word])
    end
    
    def from_yaml(wordlength, player, board, wordArray, word)
      @fileLineLimit = 61_407
      @player1 = player
	    @word = word
	    @wordLength = @word.length
      @board = board
	    @guessCorrectly = false
	    @wordArray = wordArray
    end
	
    def display
      system 'clear'
#      puts "DISPLAY\n-------\n\n"
      @board.showRules
      @player1.showGuessedLetters
#      puts @word
      @board.showBoard
      showSpaces
      if(!over?)
        pIn = @player1.getPlayerInput
        checkGuess(pIn)
      end 
    end

    def showSpaces 
        print "\n   "
        @wordLength.times { |x| print " #{@wordArray[x]}" }
      if(over?)
        print "\n\nANSWER:\n   "
        @wordLength.times { |x| print " #{@word[x]}"}
      end
      puts "\n\n"
    end

    def checkGuess(guess)
      _ret = []
      i=0
      containsWord = false
      @word.downcase.each_char do |c|
        if(c == guess.downcase)
          @wordArray[i] = c.upcase
          containsWord = true
        end
      i += 1
      end
      isWinner?
      unless(containsWord)
        @board.addLimb
      end
    end
    
    def over?
      if(isWinner?)
        @board.isOver = true
      end
      @board.isOver
    end

    def isWinner?
      @guessCorrectly = !@wordArray.include?("_")
    end

    def fillArr
      @wordArray = []
      @wordLength.times { |x| @wordArray[x] = "_" }
      @wordArray
    end

    def getWord
      _ret = ""
      filename = "5desk.txt"
      f = File.new(filename,'r')
      lines = f.readlines
      while(_ret.length > 12 || _ret.length < 5)
        @randLine = rand(@fileLineLimit)
        _ret = lines[randLine].chomp
      end
      f.close
      _ret.upcase
    end
  end
  
  class Player
    attr_accessor :guessedLetters, :selectSave, :selectLoad
    
    def initialize
	    @guessedLetters = []
      @selectSave = false
      @selectLoad = false
    end
	
    def showGuessedLetters
	    print "   "
	    @guessedLetters.each { |x| print " #{x.upcase}"}
	    puts ""
    end
    
    def getPlayerInput
	    input = ""
	    while(input.length != 1 && input.upcase != "SAVE" && input.upcase != "LOAD" && input.upcase != "EXIT" && input.upcase != "QUIT")
	      puts "Enter a Letter to guess."
		    input = gets.chomp
        if(input.length == 1 && @guessedLetters.include?(input))
          puts "Hmmm... It looks like you already guessed the letter \'#{input.upcase}\'"
          input = ""
        elsif(input.upcase == "LOAD")
          @selectLoad = true
        elsif(input.upcase == "SAVE")
          @selectSave = true
        elsif(input.upcase == "EXIT" || input.upcase == "QUIT")
          exit
        end
	    end
      if(input.length == 1)
        @guessedLetters << input
      end
	    input
	  end
  end
  
  class Board
	  attr_accessor :board, :limbs, :numLimbs, :limbOrder, :isOver
    
    def initialize
      @numLimbs = 0
      @limbs = ["O","/","|","/ ","\\","\\"," "]
      @limbOrder = [2,3,3,4,3,4,5]
      @board = buildBoard
      @isOver = false
    end
	
    def buildBoard
      board0 = "          _____"
      board1 = "         |     |"
      board2 = "         |     "
      board3 = "         |    "
      board4 = "         |    "
      board5 = "         |"
      board6 = "       -----"
      board = [board0,board1,board2,board3,board4,board5,board6]
    end
	  
    def showRules
      puts "RULES: \nYou must guess a 5-12 Letter word."
      puts "You can guess any letter."
      puts "But you may only get 6 wrong before you lose!"
      puts "Good Luck!\n\n"
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

#**** Start Game ****#
  game = Game.new
  
  while(!game.over?)
    if(game.player1.selectSave)
      game.save_to_yaml
      exit
    elsif(game.player1.selectLoad)
      game.load_from_yaml
    end
    game.display
  end
  game.display
  
  if(game.guessCorrectly)
    puts "     ***  YOU WIN! ***\n\n"
  else
    puts "     *** GAME OVER ***\n\n"
  end
  
end
