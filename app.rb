require('sinatra')
require('sinatra/reloader')
require('./lib/word')
require('./lib/definition')
require 'pry'
also_reload('lib/**/*.rb')

get('/') do
  # Word.clear
  # Definition.clear
  redirect to '/words'
end
get('/words') do
  @study_terms = Word.all
  erb(:words)
end
post('/words') do
  name = params[:name]
  word = Word.new({:name => name, :id => nil})
  word.save()
  redirect to '/words'
end
get('/words/:id') do

  erb(:definition)
end
get('/words/:id/definition') do
  erb(:definition)
end
post('/words/:id/definition') do
  name = params[:name]
  definition = Definition.new({:name => name, :word_id => @word_id :id => nil})
  definition.save()
  erb(:definition)
end

get('/words/edit/:id') do
  # @word = Word.find(params[:id].to_i())
  @define = Definition.find(params[:id].to_i())
  @study_terms = Word.all()
  @definitions = Definition.all()
erb(:edit)
end

patch ('/words/edit/:id') do
  # binding.pry
  # @word = Word.find(params[:id].to_i())
 @define =  Definition.find(params[:id].to_i())
  @define.update(params[:new_definition], @word.id)
  @study_terms = Word.all()
  @definitions = Definition.all()
erb(:words)
end

get ('/words/delete') do
  @word = Word.find(params[:id].to_i())
  @study_terms = Word.all()
  @definitions = Definition.all()
  erb(:words)
end

delete('/words/delete') do
  word = Word.find(params[:new_word])
  word.delete
  word.save
  @study_terms = Word.all()
  @definitions = Definition.all()
  erb(:words)
end
