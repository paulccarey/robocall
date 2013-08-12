require 'spec_helper'

describe 'robocall' do



  it 'should create a record' do

  	Robocall.sid = 'x'
 	Robocall.auth_token = 'x'
  	Robocall.from_phone_number = '555 555 5555'
  	Robocall.base_path = "http://localhost:3000"
   	Robocall.send_robocall(to: "555 555 5555", text: "Hello you there")

  end

end


