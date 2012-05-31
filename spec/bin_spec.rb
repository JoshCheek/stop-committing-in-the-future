require 'spec_helper'

describe TimeChecker, '#error_message' do
  
  before(:all) { start_server }
  after(:all)  { stop_server }
  
  let(:checker) { described_class.new now, url }

  def server_returns(return_time)
    TimeServer.next_call_returns return_time
  end


  def expect_pass(return_time)
    server_returns return_time
    checker.error_message.should be_nil
  end
  context 'when the times match within one second, it returns nil' do
    example('one second ago')      { expect_pass one_second_ago }
    example('right now')           { expect_pass now }
    example('one second from now') { expect_pass one_second_from_now }
  end


  def expect_fail(return_time)
    server_returns return_time
    message = checker.error_message
    message.should include Time.now.utc.to_s
    message.should include return_time.to_s
  end
  context 'when the times do not match within one second, it returns 1, and a message saying so' do
    example('two seconds ago')      { expect_fail two_seconds_ago }
    example('two seconds from now') { expect_fail two_seconds_from_now }
  end
end
