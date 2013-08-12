![Gem Version](https://badge.fury.io/rb/robocall.png)
![CircleCI](https://circleci.com/gh/Originate/robocall.png?circle-token=f5b18cbae4729bcb1b41cccb7f20415c57318b15)

## About

A rails gem to easily add sending synthesized messages from Rails to any phone number. 

## Install

Add the robocall gem to your Gemfile:
``` ruby
gem 'robocall'
```

Update your bundle and run the migrations from the command line:
``` shell
bundle install
rake robocall:install:migrations
rake db:migrate
```

In conf/environment.rb, add the configuration:
``` ruby
# Your twilio.com phone number, sid and auth token
Robocall.from_phone_number = '555-555-5555'
Robocall.sid               = 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
Robocall.auth_token        = 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'
# Basepath for the callback URL, your server name
Robocall.base_path         = 'http://example.com'
```

Now, you can send calls and texts easily using:
``` ruby
Robocall.send_text(to: '555 555 5555', text: 'Hey you!')
Robocall.send_robocall(to: '555 555 5555', text: 'This is a bad joke alert.')
Robocall.send_robocall(to: '555 555 5555', text: 'Hola', lanugage: :spanish)
# Send a twiml xml message as defined here: http://www.twilio.com/docs/api/twiml
Robocall.send_robocall_xml(to: '555 555 5555', xml: xml)
```

Note: that texts are sent out pretty much from anywhere, but robocalls require the system to be set up on a publically accessible server, because Twilio wants to talk to you. 


