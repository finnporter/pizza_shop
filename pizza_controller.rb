require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )

require_relative( 'models/pizza' )

#INDEX
get "/pizzas" do
  @pizzas = Pizza.all()
  #plural because it returns an array of pizza objects
  erb(:index)
end

#NEW
get "/pizzas/new" do
  erb(:new)
end

#DELETE
post "/pizzas/:id/delete" do
  @pizza = Pizza.find(params["id"].to_i)
  @pizza.delete()
  erb(:delete)
end

#SHOW
get "/pizzas/:id" do
  @pizza = Pizza.find(params["id"].to_i)
  erb(:show)
end

#CREATE
post "/pizzas" do
  @pizza = Pizza.new(params)
  @pizza.save()
  erb(:create)
end

