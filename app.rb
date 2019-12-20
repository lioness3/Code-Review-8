require('sinatra')
require('sinatra/reloader')
require('./lib/word')
require 'pry'
also_reload('lib/**/*.rb')

get('/') do
  erb(:home)
end
post('/home') do
  @new_word = params[:new_word]
  vocab = Word.new(@new_word)
  @@words = vocab.add_word
  erb(:display)
end
