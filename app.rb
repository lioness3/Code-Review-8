require('sinatra')
require('sinatra/reloader')
require('./lib/word')
require('./lib/definition')
require 'pry'
also_reload('lib/**/*.rb')

get('/') do
  @study_terms = Word.all
  @definitons = Definition.all
  erb(:home)
end
get('/home') do
  new_word = params[:new_word]
  new_definition = params[:new_definition]
  alternate_definition = params[:alternate_definition]
  word = Word.new(new_word, new_definition)
  define = Definition.new(new_word, new_definition, alternate_definition)
  define.save()
  word.save()
  @study_terms = Word.all()
  @definitons = Definition.all()
  erb(:home)
end
post('/home') do
  new_word = params[:new_word]
  new_definition = params[:new_definition]
  alternate_definition = params[:alternate_definition]
  word = Word.new(new_word, new_definition)
  word.save()
  define = Definition.new(new_word, new_definition, alternate_definition)
  define.save()
  @definitons = Definition.all()
  @study_terms = Word.all()
  erb(:home)
end

patch('/home') do
  word.edit(params[:new_definition])
  word.save()
  @study_terms = Word.all
  @definitons = Definition.all
  redirect to('/home')
end
get('/home/edit')do
@study_terms = Word.all
define = Definition.new(new_word, new_definition, alternate_definition)
@definitons = Definition.all
erb(:edit)
end
post('/home/edit')do
@study_terms = Word.all
alternate_definition = params[:alternate_definition]
define = Definition.new(new_word, new_definition, alternate_definition)
define.save()
@definitons = Definition.all
erb(:edit)
end
# delete('/home/:wod') do
#   redirect to('/home')
# end
