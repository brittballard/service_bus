require 'sinatra'
require 'json'
require_relative 'service_bus_helper'

get '/new' do
  erb :new
end

post '/save' do
  ServiceBusHelper.publish params.to_json
  erb :new
end
