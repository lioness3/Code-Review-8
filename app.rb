require('sinatra')
require('sinatra/reloader')
require('./lib/word')
require 'pry'
also_reload('lib/**/*.rb')

get('/') do
  erb(:home)
end
get('/home') do
  new_word = params[:new_word]
    new_defintion = params[:new_defintion]
  @vocab = Word.new(new_word, new_defintion)
  erb(:display)
end
