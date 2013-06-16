require 'sinatra'

get '/teacher' do
  erb :teacher
end

get '/student' do
  erb :student
end