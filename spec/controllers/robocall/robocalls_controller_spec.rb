require 'spec_helper'

module Robocall
  describe RobocallsController, type: :controller do


    let(:robocall) { Robocall.create!(token: 'MyString', xml: '<foo>') }


    # This should return the minimal set of attributes required to create a valid
    # Robocall. As you add validations to Robocall, be sure to
    # adjust the attributes here as well.
    let(:valid_attributes) { { 'token' => robocall.token, 'id' => robocall.id } }

    # This should return the minimal set of values that should be in the session
    # in order to pass any filters (e.g. authentication) defined in
    # RobocallsController. Be sure to keep this updated too.
    let(:valid_session) { {} }

    describe "POST see response" do
      describe "with valid params" do
        it "returns the xml" do
          post :connected_to_caller, { 'token' => robocall.token, 'id' => robocall.id }, valid_session
          response.body.should include(robocall.xml)
        end
      end

      describe "with invalid params" do
        it "does not work when there's a token missmatch" do
          post :connected_to_caller, { 'token' => 'warble', 'id' => robocall.id }, valid_session
          response.body.should include('invalid')
        end

      end
    end

  end
end
