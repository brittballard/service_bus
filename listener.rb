require_relative 'service_bus_helper'

ServiceBusHelper.subscribe('notification.email') do |payload|
  puts "Sending email: #{payload}"
end
