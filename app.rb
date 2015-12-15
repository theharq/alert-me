ENV['RACK_ENV'] ||= 'development'

require 'rubygems'
require 'bundler'
require 'sinatra'

Bundler.require(:default)

require './models/price'

configure do
  Mongoid.load!('./database.yml', ENV['RACK_ENV'].to_sym)
end

get '/' do
  @prices = Price.order(date: :desc)
  erb :index
end