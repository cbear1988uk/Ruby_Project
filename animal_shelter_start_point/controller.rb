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

get '/animals/:id' do
  @animals = Animal.find_by_id(params[:id])
  erb(:show_animal)
end

get '/donate_pet/' do
  erb(:new)
end

get '/adopt_pet/' do
  erb(:adopt)
end

post '/animals/' do
  animals = Animal.new(params)
  animals.save()
  redirect '/animals/'
end
