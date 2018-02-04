require 'sinatra'
require 'sinatra/reloader'

random_number = rand(0..100)


get '/' do
  erb :index, :locals => {:random_number => random_number}
end

