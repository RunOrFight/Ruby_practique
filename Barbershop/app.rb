require 'sinatra'
require 'rubygems'
require 'sinatra/reloader'
require 'sqlite3'

db = SQLite3::Database.new 'MyFirstDB.sqlite'

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

  hh = {user_name: "Введите имя",phone_number: "Введите номер" ,date_time: "Введите дату" ,barber: "Выберите парикмахера" ,color: "Выберите цвет"}
  
  @error = hh.select{ |key,_| params[key] ==''}.values.join(", ")
  if @error != ''
    return erb :visit
  else 
    
  file = File.open("./public/users.txt", "a")
  file.puts "User: #{@user_name} Phone: #{@phone_number} Date: #{@date_time} Barber: #{@barber} Color: #{@color}"
  file.close

  erb :message
  end  
end