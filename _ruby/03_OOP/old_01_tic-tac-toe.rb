class TicTacToe
  
  attr_accessor :xoVal, :xoArr, :turn, :numTurn, :positions, :assign, :game, :numPlayers, :endMsg
  
  def initialize
    @xoArr = ['X', 'O']
#    @numPlayers = getNumberOfPlayers
#    if (@numPlayers == 1)
#      @xoVal = exesOrOhs
#    else
      @xoVal = 0
#    end
    @turn = @xoVal
    @numTurn = 0
    @positions = [[" "," "," "],[" "," "," "],[" "," "," "]]
    @assign = [["1","2","3"],["4","5","6"],["7","8","9"]]
    @game = true
  endMsg = ""
    show_rules(assign)
  end

  def tictactoe_game
    puts "Per tradition, X\'s go first"
    while(@game == true)
      puts ""
      show_board(@positions)
      input = gets.chomp
      if input.match(/q|quit|exit/i)
        @game = false
        puts "Exiting..."
      elsif input.match(/\?|h|help/i)
        show_rules(@assign)
      elsif input.match(/\d/)
#  			positions = setPos(positions, input, 0)
        setPos(input.to_i)
      end
      if(checkForWinner)
        game_over
      end
      if(@numTurn >= 9)
        @endMsg ||= "Let's call it a Draw!"
        game_over
      end
    end
    puts "\nGame has ended.\n"# - #{input}"
  end
  
  def game_over
    show_board(@positions)
    puts "\n\n   ***" + @endMsg + "***   \n\n"
    @game = false
    exit
  end
  
  def checkForWinner
    checkSumRows
    checkSumCols
    checkSumDiag
  end
  
  private
  def checkSumRows
    i = 0
    while i < 3
      sum = @positions[i][0] + @positions[i][1] + @positions[i][2]
      if(sum == "XXX")
        @endMsg = "X\'s have Won!"
        game_over
      elsif (sum == "OOO")
        @endMsg = "O\'s have Won!"
        game_over
      end
      i += 1
    end
    @endMsg
  end
  
  def checkSumCols
    i = 0
    while i < 3
      sum = @positions[0][i] + @positions[1][i] + @positions[2][i]
      if(sum == "XXX")
        @endMsg = "X\'s have Won!"
        game_over
      elsif (sum == "OOO")
        @endMsg = "O\'s have Won!"
        game_over
      end
      i += 1
    end
    @endMsg
  end
  
  def checkSumDiag
    diag1 = @positions[0][0] + @positions[1][1] + @positions[2][2]
    diag2 = @positions[0][2] + @positions[1][1] + @positions[2][0]
      if(diag1 == "XXX" || diag2 == "XXX")
        @endMsg = "X\'s have Won!"
        game_over
      elsif(diag1 == "OOO" || diag2 == "OOO")
        @endMsg = "O\'s have Won!"
        game_over
      end
    @endMsg
  end
  
  def setPos(play)
    if(play.to_i > 0 && play.to_i < 10)
      puts "Played square: #{play}"
      setPositionArray(play)
    else
      puts "Please enter a number (1-9)"
    end
  end
  
  def show_board(p)
    puts "\n      #{p[0][0]}|#{p[0][1]}|#{p[0][2]}"
    puts "      -----"
    puts "      #{p[1][0]}|#{p[1][1]}|#{p[1][2]}"
    puts "      -----"
    puts "      #{p[2][0]}|#{p[2][1]}|#{p[2][2]}\n"
  end

  def show_rules(p)
    puts "Enter a number to the corresponding square."
    show_board(p)
    puts "\nEnter \'q\' to quit."
    puts "Enter \'?\', \'h\', or \'help\' to see this menu again."
  end

  def setPositionArray(pos)
    if(pos > 0 && pos < 4)
      a = 0
    elsif(pos>3 && pos < 7)
      a = 1
    elsif(pos >6 && pos < 10)
      a = 2
    else
      puts "Please enter a number between 1 and 9"
    end
    b = (pos%3) - 1
    if(@positions[a][b] == " ")
      @positions[a][b] = @xoArr[@turn.to_i]
      @turn = @turn == 0 ? @turn = 1 : @turn = 0
      @numTurn += 1
    end
  end
  
  def getNumberOfPlayers()
    getNum = true
    puts "Tic-Tac-Toe is a two-player game."
    while getNum == true
      puts "How many human players?"
      numberOfHumanPlayers = gets.chomp
      if(numberOfHumanPlayers.match(/1/i))
        puts "There is one human player"
        getNum = false
      elsif(numberOfHumanPlayers.match(/2/i))
        puts "There are two human players"
        getNum = false
      else
        puts "hmmm... that was not a \'1\' nor a \'2\'."
        puts "Please try again."
      end
    end
    numberOfHumanPlayers.to_i
  end

  def exesOrOhs
    getXO = true
    while getXO == true
      puts "Select \'X\'s or \'O\'s"
      xo = gets.chomp
      if(xo.match(/x/i))
        xo = 0
        puts "You are \'X\'s"
        getXO = false
      elsif(xo.match(/O/i))
        xo = 1
        puts "You are \'O\'s"
        getXO = false
      elsif(xo.match(/\d+/i))
        m = xo.match(/\d+/i)
        if(m[0].to_i < 2)
          xo = 0
         puts "You are \'X\'s"
         getXO = false
       else
          xo = 1
          puts "You are \'O\'s"
          getXO = false
        end
      else
        puts "hmmm... that was not an \'X\' nor an \'O\'."
        puts "Please try again."
      end
    end
    xo
  end
end


Game1 = TicTacToe.new
Game1.tictactoe_game

#tictactoe_game
#system('pause')
