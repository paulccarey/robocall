require 'robocall/engine'
require 'twilio-ruby'
require 'haml'
require File.dirname(__FILE__) + "/../app/models/robocall/robocall"

module Robocall

  class << self
    attr_accessor :sid, :auth_token, :from_phone_number, :base_path

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
      callback_record = Robocall.new
      callback_record.xml = xml
      callback_record.save
      # construct the callback URL
      url = base_path+"/robocall/#{callback_record.id}/#{callback_record.token}"
      twilio.account.calls.create(
        :from => from,
        :to   => to,
        :url  => url
      )
    end

    def send_robocall(to: to, text: text, language: 'en-US', from: from_phone_number)
      # Render XML
      template = <<'HAML'
<?xml version='1.0' encoding='utf-8' ?>
%Response
  %Say{:voice => 'alice', :language => language}
    = text
HAML
      data = {}
      data['text'] = text
      data['language'] = language
      xml = Haml::Engine.new(template).to_html(Object.new, data )
      send_robocall_xml(to: to, xml: xml, from: from)
    end

    private

    def get_twilio
      verify_configuration_values(:sid, :auth_token, :from_phone_number, :base_path)
      return Twilio::REST::Client.new sid, auth_token
    end

    def verify_configuration_values(*symbols)
      absent_values = symbols.select{|symbol| instance_variable_get("@#{symbol}").nil? }
      raise("Must configure #{absent_values.join(", ")} before making this request.") unless absent_values.empty?
    end

  end

end
