require 'sinatra'

get '/' do
  erb "Hello!"
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

post '/visit' do
  @user_name = params[:user_name]
  @phone_number = params[:phone_number]
  @date_time = params[:date_time]

  file = File.open("users.txt", "a")
  file.puts "User: #{@user_name} Phone: #{@phone_number} Date: #{@date_time}"
  file.close

  erb :message
end