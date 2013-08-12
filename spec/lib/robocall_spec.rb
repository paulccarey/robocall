require 'spec_helper'

describe 'robocall' do

  Robocall.sid = 'x'
  Robocall.auth_token = 'x'
  Robocall.from_phone_number = '555 555 5555'
  Robocall.base_path = "http://localhost:3000"

  before(:each) do
    @twilio = double('Twilio')
    @twilio.stub_chain(:account, :calls, :create).and_return(true)
    Robocall.stub(:get_twilio).and_return(@twilio)
  end

  it 'should create a record' do
    Robocall.send_robocall(to: "555 555 5555", text: "Hello you there")
  end

end


