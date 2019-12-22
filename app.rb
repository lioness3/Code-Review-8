require('sinatra')
require('sinatra/reloader')
require('./lib/word')
require 'pry'
also_reload('lib/**/*.rb')

get('/') do
  erb(:home)
end
post('/home') do
  @vocab = Word.new(params[:new_word],params[:new_defintion])
  erb(:display)
end
post('/home/define') do
  @defintion = params[:new_defintion]
  erb(:define)
end
get('/home/define/show') do

  erb(:flashcards)
end
