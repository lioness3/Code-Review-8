require('sinatra')
require('sinatra/reloader')
require('./lib/word')
require('./lib/definition')
require 'pry'
also_reload('lib/**/*.rb')

get('/') do
  @study_terms = Word.all
  erb(:home)
end
get('/home') do
  new_word = params[:new_word]
  new_definition = params[:new_definition]
  alternate_definition = params[:alternate_definition]
  word = Word.new(new_word, new_definition, alternate_definition)
  word.save()
  @study_terms = Word.all
  erb(:home)
end
post('/home') do
  alternate_definition = params[:alternate_definition]
  word.save
  @study_terms = Word.all
  erb(:home)
end

patch('/home') do
  word.edit(params[:new_definition])
  word.save()
  @study_terms = Word.all
  redirect to('/home')
end
get('/home/edit')do
erb(:edit)
end
post('/home/edit')do
alternate_definition = params[:alternate_definition]
word.save()
@study_terms = Word.all
erb(:edit)
end
# delete('/home/:word') do
#   redirect to('/home')
# end
