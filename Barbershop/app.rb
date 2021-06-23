require 'sinatra'

get '/' do
  erb "Hello all Ruby-programmers!"
end

get '/about' do 
  erb :about
end

get '/visit' do
  erb :visit
end

get '/contacts' do
  erb :contacts
end