require_dependency "robocall/application_controller"

module Robocall
  class RobocallsController < ApplicationController
    def connected_to_caller
      r = Robocall.find_by_id(params[:id])
      error = ''
      error = "Caller record #{params[:id]} not found" unless r
      error = "No token provided" unless params[:token]
      error = "The token was invalid" unless r && r.token == params[:token]
      if error != ''
        return render :template => "robocall/robocalls/error", :locals => {:error => error} unless r
      end
      render r.xml
    end
  end
end
