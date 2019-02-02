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

get '/owners/' do
  @owners = Owner.find_all()
  erb(:owners)
end

get '/animals/:id' do
  @animals = Animal.find_by_id(params[:id])
  erb(:show_animal)
end

get '/edit_animal/:id' do
  @animals = Animal.find_by_id(params[:id])
  erb(:edit_animal)
end

get '/donate_pet/' do
  erb(:new)
end

get '/adopt_pet/:id' do
  @animals = Animal.find_by_id(params[:id])
  erb(:adopt)
end

post '/animals/' do
  animals = Animal.new(params)
  animals.save()
  redirect '/animals/'
end

post '/animals/:id/delete' do
 @animal = Animal.find(params['id'])
 @animal.delete
 redirect to '/animals/'
end

get '/edit_animal/' do
  erb(:edit_animal)
end
