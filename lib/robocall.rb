require 'robocall/engine'

require 'twilio-ruby'

module Robocall
  class << self
    attr_accessor :sid, :auth_token, :from_phone_number

    def send_text(to: to, text: text, from: from_phone_number)
      twilio = get_twilio
      twilio.account.sms.messages.create(
        :from => from,
        :to   => to,
        :body => text
      ) 
    end

    def send_robocall_xml(to: to, xml: xml, from: from_phone_number)
      twilio = get_twilio
      # Store the xml in a record
      # construct the callback URL
      # set up RoboCall!
    end

    private

    def get_twilio
      verify_configuration_values(:sid, :auth_token, :from_phone_number)
      return Twilio::REST::Client.new sid, auth_token
    end

    def verify_configuration_values(*symbols)
      absent_values = symbols.select{|symbol| instance_variable_get("@#{symbol}").nil? }
      raise("Must configure #{absent_values.join(", ")} before making this request.") unless absent_values.empty?
    end

  end

end
