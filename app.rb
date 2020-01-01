require('sinatra')
require('sinatra/reloader')
require('./lib/word')
equire('./lib/definition')
require 'pry'
also_reload('lib/**/*.rb')

get('/') do
  @study_terms = Word.all
  erb(:home)
end
get('/home') do
  @study_terms = Word.all
  new_word = params[:new_word]
  new_definition = params[:new_definition]
  word = Word.new(new_word, new_definition)
  word.save()
  erb(:home)
end
post('/home') do
  redirect to('/home')
end
get('/home/edit')do
  erb(:edit)
end

patch('/home') do
  word.edit(params[:new_definition])
  word.save()
  @study_terms = Word.all
  redirect to('/home')
end
# delete('/home/:word') do
#   redirect to('/home')
# end
