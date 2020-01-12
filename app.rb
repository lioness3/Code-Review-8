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
  @words = Word.all
  @definitions = Definition.all()
  erb(:words)
end

get('/words/new') do
  erb(:new_word)
end

post('/words') do
  name = params[:name]
  word = Word.new({:name => name, :id => nil})
  word.save()
  @words = Word.all
  @definitions = Definition.all()
  erb(:words)
end

get('/words/:id') do
  @word = Word.find(params[:id].to_i())
  @definitions = Definition.all()
  erb(:word)
end

post('/words/:id/definitions') do
  @word = Word.find(params[:id].to_i())
  definition = Definition.new({:name => params[:new_definition], :word_id => @word.id, :id => nil})
  definition.save
  @definition = Definition.find(params[:definition_id].to_i())
  @definitions = Definition.all()
  erb(:word)
end


get('/words/:id/definitions/:definition_id') do
  @word = Word.find(params[:id].to_i())
  @definition = Definition.find(params[:definition_id].to_i())
    @definitions = Definition.all()
erb(:edit_definitions)
end


patch('/words/:id/definitions/:definition_id') do
  @word = Word.find(params[:id].to_i())
  @definition = Definition.find(params[:definition_id].to_i())
  @definition.update(params[:new_definition], @word.id)
  @definition.save
  @words = Word.all()
  @definitions = Definition.all()
  erb(:word)
end

delete('/words/:id/definitions/:definition_id') do
  @word = Word.find(params[:id])
  @definition = Definition.find(params[:definition_id].to_i())
  @definition.delete
  erb(:edit)
end
