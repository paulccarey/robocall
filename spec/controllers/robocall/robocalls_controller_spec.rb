require 'spec_helper'

module Robocall
  describe RobocallsController do
  
    # This should return the minimal set of attributes required to create a valid
    # Robocall. As you add validations to Robocall, be sure to
    # adjust the attributes here as well.
    let(:valid_attributes) { { 'token' => 'MyString', 'xml' => '<foo>' } }
  
    # This should return the minimal set of values that should be in the session
    # in order to pass any filters (e.g. authentication) defined in
    # RobocallsController. Be sure to keep this updated too.
    let(:valid_session) { {} }
  
    describe "POST see response" do
      describe "with valid params" do
        it "returns the xml" do
          expect {
            post :create, {:robocall => valid_attributes}, valid_session
          }.to change(Robocall, :count).by(1)
        end
  
	it "cleans up the record after the callback has been received" do
          pending
	end
      end
  
      describe "with invalid params" do
        it "does not work when there's a token missmatch" do
          pending
        end
  
        it "does not work when there's no token" do
          pending
        end

        it "does not work when there's no id" do
          pending
        end
      end
    end
  
  end
end
