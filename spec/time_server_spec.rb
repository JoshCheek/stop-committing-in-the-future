require 'spec_helper'

describe "TimeServer" do
  describe '.inspect' do
    it "returns 'TimeServer' so it's not so friggin confusing" do
      TimeServer.inspect.should == 'TimeServer'
    end
  end

  describe '.call' do
    it 'returns 200 OK' do
      TimeServer.call({})[0].should == 200
    end

    it 'has a plain content type' do
      TimeServer.call({})[1]['Content-Type'].should == 'text/plain'
    end

    it 'returns the current type as its content' do
      TimeServer.call({})[2].should == [now.to_s]
    end
  end

  describe '.time' do
    it 'returns the current time in UTC' do
      TimeServer.time.should == now
    end
  end
end
