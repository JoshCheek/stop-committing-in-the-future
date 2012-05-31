TimeServer = Object.new

def TimeServer.inspect
  "TimeServer"
end

def TimeServer.call(env)
  [200, {'Content-Type' => 'text/plain'}, [time.to_s]]
end

def TimeServer.next_call_returns(time)
  @next_call_returns = time
end

def TimeServer.time
  @next_call_returns || Time.now.utc
ensure
  @next_call_returns = nil
end
