require('sinatra')
require('sinatra/reloader')
require('./lib/word')
require('./lib/definition')
require 'pry'
also_reload('lib/**/*.rb')

get('/') do
  # Word.clear
  # Definition.clear
  @study_terms = Word.all
  @definitions = Definition.all
  erb(:home)
end
get('/home') do
  @study_terms = Word.all
  @definitions = Definition.all
  erb(:home)
end
post('/home') do
  name = params[:new_word]
  word = Word.new({:name => name, :id => nil})
  word.save()
  defined = params[:new_definition]
  define = Definition.new(({:name => defined, :word_id => @word_id, :id => nil}))
  define.save()
  @study_terms = Word.all()
  @definitions = Definition.all()
  erb(:home)
end

get('/home/edit') do
  @word = Word.find(params[:id].to_i())
    @word.update(params[:name])
  @study_terms = Word.all()
  @definitions = Definition.all()
erb(:edit)
end

patch('/home/edit') do
  @word = Word.find(params[:id].to_i())
  @word.update(params[:name])
  @study_terms = Word.all()
  @definitions = Definition.all()
  erb(:edit)
end
get ('/home/delete') do
  @word = Word.find(params[:id].to_i())
  @word.delete()
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
