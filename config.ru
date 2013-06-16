require 'faye'
# require File.expand_path('../app', __FILE__)

require './server'

class ServerAuth
  def incoming(message, callback)
    if message['channel'] =~ %r{.+public}
      if message['data']['auth_token'] != "foo"
        message['error'] = 'STOP CHEATING. NO SHARING ANSWERS'
      end
    end
    callback.call(message)
  end
end

Faye::WebSocket.load_adapter('thin')
use Faye::RackAdapter, mount: '/faye', extensions: [ServerAuth.new]
run Sinatra::Application