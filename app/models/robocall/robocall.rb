module Robocall
  class Robocall < ActiveRecord::Base
    attr_accessible :token, :xml
  end
end
