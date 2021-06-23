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

  hh = {user_name: "Введите имя",phone_number: "Введите номер" ,date_time: "Введите дату" ,barber: "Выберите парикмахера" ,color: "Выберите цвет"}
  
  hh.each do |key, value|
    if params[key] == ""
      @error = "#{value}"
      return erb :visit  
      end  
  end
  file = File.open("./public/users.txt", "a")
  file.puts "User: #{@user_name} Phone: #{@phone_number} Date: #{@date_time} Barber: #{@barber} Color: #{@color}"
  file.close

   erb :message  
end