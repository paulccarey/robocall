require 'spec_helper'

module Robocall
  describe RobocallsController do
    describe 'routing' do
  
      it 'routes to #post' do
        post('/robocalls/1/123a').should route_to('robocalls#update', :id => '1', :token => '123a')
      end
  
    end
  end
end
