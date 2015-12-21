ENV['RACK_ENV'] ||= 'development'

require 'rubygems'
require 'bundler'
require 'sinatra'

Bundler.require(:default)

require './models/price'

configure do
  Mongoid.load!('./database.yml', ENV['RACK_ENV'].to_sym)

  Pony.options = {
    from: 'noreply@example.com',
    via: :smtp,
    via_options: {
      address: 'smtp.sendgrid.net',
      port: '587',
      domain: 'heroku.com',
      user_name: ENV['SENDGRID_USERNAME'],
      password: ENV['SENDGRID_PASSWORD'],
      authentication: :plain,
      enable_starttls_auto: true
    }
  }
end

get '/' do
  @prices = Price.order(date: :desc)
  erb :index
end