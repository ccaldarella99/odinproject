require 'sinatra'
require 'sinatra/reloader'

random_number = rand(0..100)
output = ""

def check_guess(guess, random_number)
  out = guess
  if(guess == nil || guess == "")
    return out
  elsif(guess.to_i > random_number)
    out += " IS TOO DAMN HIGH! <br><img src =\'https://tinyurl.com/y8ecfp7m\'>"
  elsif(guess.to_i < random_number)
    out += " is too low! <br><img src =\'https://tinyurl.com/yac7rhjr\'>"
  else
    out += " is correct! <br><img src=\'https://tinyurl.com/znjv4yj\'>"
    out += "<br>The SECRET NUMBER is: #{random_number}"
  end
  out
end


get '/' do
  guess = params["guess"]
  output = check_guess(guess, random_number)
  erb :index, :locals => {:random_number => random_number, :output => output}
end

