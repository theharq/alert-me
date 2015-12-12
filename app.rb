require 'rubygems'
require 'bundler'
require 'sinatra'

Bundler.require(:default)

require './models/price'

configure do
  Mongoid.load!('./database.yml')
end

get '/' do
  @prices = Price.order(date: :desc)
  erb :index
end