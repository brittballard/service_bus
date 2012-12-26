require 'amqp'
require 'net/smtp'

module ServiceBusHelper
  FANOUT = 'user.create'
  HOST   = 'amqp://127.0.0.1'

  def self.subscribe(queue)
    AMQP.start(HOST) do |connection|
      channel  = AMQP::Channel.new(connection)
      exchange = channel.fanout(FANOUT)

      channel.queue(queue, auto_delete: true).bind(exchange).subscribe do |payload|
        yield(payload)
      end
    end
  end

  def self.publish(message)
    AMQP.start(HOST) do |connection|
      channel  = AMQP::Channel.new(connection)
      exchange = channel.fanout(FANOUT)

      exchange.publish message
    end
  end
end
