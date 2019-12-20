require('sinatra')
require('sinatra/reloader')
require('./lib/word')
require 'pry'
also_reload('lib/**/*.rb')

get('/') do
  erb(:home_page)
end
get('/home') do
  if params["new_word"]
    new_word = params[:new_word]
  end
  erg(:display)
end
