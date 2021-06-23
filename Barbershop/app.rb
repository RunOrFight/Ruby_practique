require 'sinatra'
require 'rubygems'
require 'sinatra/reloader'

get '/' do
  erb "Hello!"
end

get '/about' do
  @error = "something wrong!" 
  erb :about
end

get '/visit' do
  erb :visit
end

get '/contacts' do
  erb :contacts
end

post '/visit' do
  @user_name = params[:user_name]
  @phone_number = params[:phone_number]
  @date_time = params[:date_time]
  @barber = params[:barber]
  @color = params[:color]

  file = File.open("./public/users.txt", "a")
  file.puts "User: #{@user_name} Phone: #{@phone_number} Date: #{@date_time} Barber: #{@barber} Color: #{@color}"
  file.close

  erb :message
end