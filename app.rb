require('sinatra')
require('sinatra/reloader')
require('./lib/word')
require 'pry'
also_reload('lib/**/*.rb')

get('/') do
  @study_terms = Word.all
  erb(:home)
end
post('/home') do
  new_word = params[:new_word]
  new_defintion = params[:new_defintion]
  vocab = Word.new(new_word, new_defintion)
 @study_term = vocab.save()
  erb(:display)
end
get('/home/display') do
  redirect to('/home')
end
