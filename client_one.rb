require 'sinatra'
require_relative 'service_bus_helper'

get '/publish' do
  ServiceBusHelper.publish 'Hello, world!'
end
