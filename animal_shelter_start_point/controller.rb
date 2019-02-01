require('sinatra')
require('sinatra/contrib/all')
require('pry')
require_relative('./models/owner')
require_relative('./models/animal')
require_relative('./models/adoptions')
also_reload('./models/*')

get '/' do
  erb(:index)
end

get '/animals/' do
  @animals = Animal.find_all()
  erb(:animals)
end

get '/animals/:id/' do
  @animals = Animal.find_by_id(params[:id])
  erb(:'animals/show')
end
