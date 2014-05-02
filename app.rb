require 'sinatra'

get '/' do
  redirect '/index.html'
end

post '/register' do
  puts "#{params}"
end

