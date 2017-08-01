require 'spec_helper'

describe 'robocall' do

  before(:each) do
    Robocall.sid = 'x'
    Robocall.auth_token = 'x'
    Robocall.from_phone_number = '555 555 5555'
    Robocall.base_path = 'http://localhost:3000'

    @twilio = double('Twilio')
    @twilio.stub_chain(:account, :calls, :create).and_return(true)
    Robocall.stub(:get_twilio).and_return(@twilio)
  end

  it 'should create a record' do
    expect {
      Robocall.send_robocall(to: "555 555 5555", text: "Hello you there")
    }.to change { ::Robocall::Robocall.count }.by(1)
  end

  it 'should delete a record' do
    Robocall.send_robocall(to: "555 555 5555", text: "Hello you there")
    r = ::Robocall::Robocall.first
    r.updated_at = 3.days.ago
    r.save
    
    expect(::Robocall::Robocall.count).to eq(1)
    Robocall.cleanup
    expect(::Robocall::Robocall.count).to eq(0)
  end

end


