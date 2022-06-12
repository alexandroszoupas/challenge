require_relative "config/application"
require_relative "router"
# require_relative "app"

# require "sinatra"
# require "sinatra/reloader" if development?
# require "sinatra/activerecord"
# require "pry-byebug"
# require "better_errors"

Router.new.run
# #1. show list of all the restaurants
# get "/" do
#   @batteries = Battery.all
#   erb :index
# end


# #2. show details about one restaurant
# get "/batteries/:id" do
#   id = params[:id]
#   @battery = Battery.find(id)
#   erb :show
# end
