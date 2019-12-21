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
  @words = Word.add_word
  erb(:display)
end
post('/home/define') do
  

end
