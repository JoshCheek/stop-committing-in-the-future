TimeServer = Object.new

def TimeServer.inspect
  "TimeServer"
end

def TimeServer.call(env)
  [200, {'Content-Type' => 'text/plain'}, [time.to_s]]
end

def TimeServer.time
  Time.now.utc
end
