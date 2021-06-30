require 'sinatra'
require 'rubygems'
require 'sinatra/reloader'
require 'sqlite3'

def get_db 
  return SQLite3::Database.new 'MyFirstDB.sqlite'
end

configure do
  db = get_db
  db.execute "CREATE TABLE IF NOT EXISTS 'Barbershop'('ID' INTEGER,
  'Name'  TEXT,
  'Phone' TEXT,
  'Date'  TEXT,
  'Barber'  TEXT,
  'Color' TEXT,
  PRIMARY KEY('ID' AUTOINCREMENT));"
  
end
  


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

    db = get_db
    db.execute 'INSERT INTO
    Barbershop (Name, Phone, Date, Barber, Color) 
    VALUES (?, ?, ?, ?, ?)
    ', [@user_name, @phone_number, @date_time, @barber, @color]  
    erb :message
  end  
end

