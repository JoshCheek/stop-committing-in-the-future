require File.expand_path '../lib/time_server', __FILE__
TimeServer.next_call_returns Time.now.utc - 2
run TimeServer
