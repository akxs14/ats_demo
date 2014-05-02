require 'sinatra'

get '/' do
  redirect '/index.html'
end

get '/hi' do
  "hello!"
end
