require 'eventmachine'
require 'faye'

EM.run do

  client = Faye::Client.new "http://localhost:3000/faye"
  client.subscribe "/messages/public" do |data|
    puts "Received: #{data}"
  end

end