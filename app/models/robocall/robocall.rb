require 'securerandom'

module Robocall
  class Robocall < ActiveRecord::Base
    self.table_name = 'robocall_robocalls'
    attr_accessible :token, :xml

    def initialize(attributes = {})
      super
      self.token = SecureRandom.hex
    end
  end
end
