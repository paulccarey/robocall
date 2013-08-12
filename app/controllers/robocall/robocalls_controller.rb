require_dependency "robocall/application_controller"

module Robocall
  class RobocallsController < ApplicationController

    before_filter :set_format

    def set_format
      request.format = 'xml'
    end

    def connected_to_caller
      @r = Robocall.find_by_id(params[:id])
      #debugger
      error = ''
      error = "Caller record #{params[:id]} not found" unless @r
      error = "No token provided" unless params[:token]
      error = "The token was invalid" unless @r && @r.token == params[:token]
      if error != ''
        @error = error
        render :xml => "<Say>#{error}</Say>", :content_type => 'application/xml'
      else
        render :xml => @r.xml, :content_type => 'application/xml'
      end
    end
  end
end
