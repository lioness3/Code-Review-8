require('sinatra')
require('sinatra/reloader')
require('./lib/album')
require 'pry'
also_reload('lib/**/*.rb')

get('/') do
  erb(:home_page)
end
get('/home') do
  if params["word1"]
    word1 = params[:word1]
  end

end
