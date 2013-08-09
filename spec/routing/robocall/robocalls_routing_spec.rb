require 'spec_helper'

module Robocall
  describe RobocallsController do
    describe 'routing' do
  
      it 'routes to #post' do
        post('/robocall/1/123a').should route_to('robocall/robocalls#connected_to_caller', :id => '1', :token => '123a', :format=> 'xml')
      end
    end
  end
end
