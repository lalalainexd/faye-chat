require 'eventmachine'
require 'faye'

EM.run do

  client = Faye::Client.new "http://localhost:3000/faye"
  client.subscribe "/messages/public" do |data|
    #if the sender is a student, then send message to teache ronly?? something
    #liek that...
    #
    puts "Received: #{data}"
  end

end