require('sinatra')
require('sinatra/reloader')
require('./lib/word')
require 'pry'
also_reload('lib/**/*.rb')

get('/') do
  erb(:home)
end
post('/home') do
  @new_word = params[:new_word]
  @new_defintion = params[:new_defintion]
  @study_terms = Word.all

  erb(:display)
end
get('/home/display') do
  erb(:display)
end
