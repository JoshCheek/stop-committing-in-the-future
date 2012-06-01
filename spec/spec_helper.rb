require 'time_server'
load File.expand_path '../../bin/pre-commit', __FILE__

require 'rack'
require 'timecop'
require 'webrick'
require 'stringio'


module Freezetime
  def two_seconds_ago
    now - 2
  end

  def one_second_ago
    now - 1
  end

  def now
    Time.utc 2008, 7, 8, 9, 10, 11
  end

  def one_second_from_now
    now + 1
  end

  def two_seconds_from_now
    now + 2
  end

  def freeze_time
    Timecop.freeze now
  end

  def unfreeze_time
    Timecop.return
  end
end


module ManageServer
  def port
    8080
  end

  def url
    "http://0.0.0.0:#{port}/"
  end

  def start_server
    @server_thread = Thread.new do
      Rack::Server.start app: TimeServer, Port: port, server: 'webrick', AccessLog: [] , Logger: WEBrick::Log.new(StringIO.new)
    end
    sleep 2
  end

  def stop_server
    @server_thread.kill
  end
end


RSpec.configure do |config|
  config.include ManageServer

  config.include Freezetime
  config.before(:all) { freeze_time }
  config.after(:all)  { unfreeze_time }
end
