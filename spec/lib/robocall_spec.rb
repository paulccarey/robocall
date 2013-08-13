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
    ::Robocall::Robocall.all.should have(1).item
    Robocall.send_robocall(to: "555 555 5555", text: "Hello you there")
    ::Robocall::Robocall.all.should have(2).item
  end

  it 'should delete a record' do
    r = ::Robocall::Robocall.first
    r.updated_at = 3.days.ago
    r.save
    ::Robocall::Robocall.all.should have(1).item
    Robocall.cleanup
    ::Robocall::Robocall.all.should have(0).item
  end

end


