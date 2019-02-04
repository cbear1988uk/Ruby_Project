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
  @animals = Animal.find_available_animals
  erb(:animals)
end

get '/unavailable/' do
  @animals = Animal.find_unavailable_animals
  erb(:unavailable)
end

get '/owners/' do
  @owners = Owner.find_all()
  erb(:owners)
end

get '/animals/:id' do
  @animals = Animal.find_by_id(params[:id])
  erb(:show_animal)
end

get '/unavailable/:id' do
  @animals = Animal.find_by_id(params[:id])
  erb(:show_unavailable_animal)
end

get '/edit_animal/:id' do
  @animals = Animal.find_by_id(params[:id])
  erb(:edit_animal)
end

get '/donate_pet/' do
  erb(:new)
end

get '/add_new/' do
  erb(:add_new_owner)
end

get '/adopt_pet/:id' do
  @animals = Animal.find_by_id(params[:id])
  erb(:adopt)
end

post '/owners/' do
  owners = Owner.new(params)
  owners.save()
  redirect '/owners/'
end

get '/owners/:id' do
  @owners = Owner.find_by_id(params[:id])
  erb(:show_owners)
end

post '/animals/' do
  animals = Animal.new(params)
  animals.save()
  redirect '/animals/'
end

post '/animals/:id/delete' do
 @animal = Animal.find_by_id(params['id'])
 @animal.delete
 redirect to '/animals/'
end

post '/edit_animal/:id' do
  animals = Animal.new(params)
  animals.update()
  redirect "/animals/"
end

get '/edit_owner/:id' do
  @owners = Owner.find_by_id(params[:id])
  @owners.update
  erb(:edit_owner)
end

get '/delete_animal/:id' do
  @animals = Animal.find_by_id(params[:id])
  @animals.update
  erb(:delete_animal)
end

post '/owners/:id/delete' do
 @owner = Owner.find_by_id(params['id'])
 @owner.delete
 redirect to '/owners/'
end

get '/delete_owner/:id' do
  @owners = Owner.find_by_id(params[:id])
  @owners.update
  erb(:delete_owner)
end
