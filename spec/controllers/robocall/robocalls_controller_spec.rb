require 'spec_helper'

module Robocall
  describe RobocallsController do


    r = Robocall.new
    r.token = 'MyString'
    r.xml = '<foo>'
    r.save
    # This should return the minimal set of attributes required to create a valid
    # Robocall. As you add validations to Robocall, be sure to
    # adjust the attributes here as well.
    let(:valid_attributes) { { 'token' => r.token, 'id' => r.id } }

    # This should return the minimal set of values that should be in the session
    # in order to pass any filters (e.g. authentication) defined in
    # RobocallsController. Be sure to keep this updated too.
    let(:valid_session) { {} }

    describe "POST see response" do
      describe "with valid params" do
        it "returns the xml" do
          post :connected_to_caller, {'token'=> r.token, 'id'=>r.id}, valid_session
          response.body.should include(r.xml)
        end
      end

      describe "with invalid params" do
        it "does not work when there's a token missmatch" do
          post :connected_to_caller, {'token'=> 'warble', 'id'=>r.id}, valid_session
          response.body.should include('invalid')
        end

      end
    end

  end
end
