require_relative 'service_bus_helper'

ServiceBusHelper.subscribe('welcome.email') do |payload|
  puts "Sending email: #{payload}"
end
