require 'sinatra'
require 'sinatra/reloader'

output = "<br><img src=\'https://tinyurl.com/y97g69ua\'>"
cheat = "false"
@@bg_color = "red"
@@count = -1

def reset
  @@count = 0
  random_number = rand(0..100)
end
random_number = rand(0..100)

def check_guess(guess, random_number, cheat)
  win = false
  @@count += 1
  out = guess
  difference = (guess.to_i - random_number).abs
  if(guess == nil || guess == "")
    if(cheat == true)
      out += "The SECRET NUMBER is: #{random_number}"
    end
    return out
  elsif(guess.to_i > random_number)
    if(difference <= 5)
      out += " Almost! It is a little high <br><img src =\'https://tinyurl.com/ybo8lyvn'><br>Guesses: " + @@count.to_s
      @@bg_color = "#fcc"
      if(cheat == true)
        out += "<br>The SECRET NUMBER is: #{random_number}"
      end
    else
      out += " IS TOO DAMN HIGH! <br><img src =\'https://tinyurl.com/y8ecfp7m\'><br>Guesses: " + @@count.to_s
      @@bg_color = "#f99"
      if(cheat == true)
        out += "<br>The SECRET NUMBER is: #{random_number}"
      end
    end
  elsif(guess.to_i < random_number)
    if(difference <= 5)
      out += " Almost! It is a little low <br><img src =\'https://tinyurl.com/ybo8lyvn'><br>Guesses: " + @@count.to_s
      @@bg_color = "#fcc"
      if(cheat == true)
        out += "<br>The SECRET NUMBER is: #{random_number}"
      end
    else
      out += " is too low! <br><img src =\'https://tinyurl.com/yac7rhjr\'><br>Guesses: " + @@count.to_s
      @@bg_color = "#f99"
      if(cheat == true)
        out += "<br>The SECRET NUMBER is: #{random_number}"
      end
    end
  else
    out += " is correct! <br><img src=\'https://tinyurl.com/znjv4yj\'><br>Guesses: " + @@count.to_s + "<br>A new number is being generated"
    out += "<br><h1>The SECRET NUMBER is: #{random_number}</h1>"
    @@bg_color = "#0f5"
    @@count = 5
    win = true
  end
  if(@@count >= 5 && !win)
    out = "<h1>YOU LOSE!</h1><img src=\'https://tinyurl.com/y8qhqwz8\'><br>A new number is being generated"
    out += "<br><h1>The SECRET NUMBER was: #{random_number}</h1>"
    @@bg_color = "red"
  end
  out
end


get '/' do
  if(@@count >= 5)
    random_number = reset
  end
  guess = params["guess"]
  cheat = params["cheat"]
  output = check_guess(guess, random_number, cheat)
  erb :index, :locals => {:random_number => random_number, :output => output, :cheat => cheat, :bg_color => @@bg_color}
end

