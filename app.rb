require('sinatra')
require('sinatra/reloader')
require('./lib/word')
require 'pry'
also_reload('lib/**/*.rb')

get('/') do
  erb(:home)
end
post('/home') do
  new_word = params[:new_word]
  new_definition = params[:new_definition]
  word = Word.new(new_word, new_definition)
  @study_terms = Word.all
  @vocab_list = word.save

  erb(:display)
end
