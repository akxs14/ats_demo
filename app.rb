require 'sinatra'
require_relative 'lib/db'

get '/' do
  redirect '/index.html'
end

post '/register' do
  DB.register_user(params)
  redirect '/index.html'
end

get '/user/:id' do
  DB.get_user(params["id"])
end