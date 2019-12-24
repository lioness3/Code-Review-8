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
  word.save()
  @study_terms = Word.all
  erb(:display)
end
get('/home/display') do
  @study_terms = Word.all
  erb(:edit)
end
patch('/home/display') do
  @study_terms = Word.all
  @new_definition = @word.edit(params[:new_definition])
  @new_word = self.new_word
  erb(:display)
end
