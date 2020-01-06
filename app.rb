require('sinatra')
require('sinatra/reloader')
require('./lib/word')
require('./lib/definition')
require 'pry'
also_reload('lib/**/*.rb')

get('/') do
  @study_terms = Word.all
  @definitions = Definition.all
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
  @definitions = Definition.all()
  binding.pry
  erb(:home)
end
post('/home') do
  new_word = params[:new_word]
  new_definition = params[:new_definition]
  alternate_definition = params[:alternate_definition]
  word = Word.new(new_word, new_definition)
  word.add_definition(params[:alternate_definition])
  define = Definition.new(new_word, new_definition, alternate_definition)
  @chosen_word = word.new_word
  word.save()
  define.save()
  @definitions = Definition.all()
  @study_terms = Word.all()
  erb(:home)
end
get('/home/edit') do
  @term = Word.find(@chosen_word)
  @study_terms = Word.all()
  @definitions = Definition.all()
erb(:edit)
end

patch('/home/edit') do
  @term = Word.find(@chosen_word)
  @vocab = Defintion.find(params[:new_definition])
  @vocab.edit(params[:new_definition])
  @vocab2 = Definition.find(params[:alternate_definition])
    @vocab2.edit(params[:alternate_definition])

  @study_terms = Word.all()
  @definitions = Definition.all()
  erb(:edit)
end
get ('/home/delete') do
  @study_terms = Word.all()
  @definitions = Definition.all()
  erb(:home)
end
delete('/home/delete') do
  word = Word.find(params[:new_word])
  word.delete
  word.save
  @study_terms = Word.all()
  @definitions = Definition.all()
  erb(:home)
end

post('/home/edit') do
  new_word = params[:new_word]
  new_definition = params[:new_definition]
  alternate_definition = params[:alternate_definition]
  word = Word.new(new_word, new_definition)
  word.add_definition(params[:alternate_definition])
  define = Definition.new(new_word, new_definition, alternate_definition)
  @chosen_word = word.new_word
  word.save()
  define.save()
  @definitions = Definition.all()
  @study_terms = Word.all()
  erb(:home)
end
