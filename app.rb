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
  redirect to '/home'
end
get('/home') do
  Word.clear
  Definition.clear
  @study_terms = Word.all
  @definitions = Definition.all
  erb(:home)
end
post('/home') do
    if !(params[:name] == "")
  name = params[:name]
  @word = Word.new({:name => name, :id => @id})
  @word.save()
end
  if !(params[:new_definition] == "")
  defined = params[:new_definition]
  @define = Definition.new(({:name => defined, :word_id => @word_id, :id => @id}))
  @define.save()
end
  @study_terms = Word.all()
  @definitions = Definition.all()
  erb(:home)
end

get('/home/edit/:id') do

  @define = Definition.find(params[:id].to_i())
  @study_terms = Word.all()
  @definitions = Definition.all()

erb(:edit)
end

patch ('/home/edit/:id') do
  @word = Word.find(params[:id].to_i())
 @define =  Definition.find(params[:id].to_i())
  @define.update(params[:new_definition], @word.id)
  @study_terms = Word.all()
  @definitions = Definition.all()
  erb(:home)
end

get ('/home/delete') do
  @word = Word.find(params[:id].to_i())
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
