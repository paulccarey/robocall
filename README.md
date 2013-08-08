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
Robocall.from_phone_number = '555-555-5555'
Robocall.sid               = 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
Robocall.auth_token        = 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'
```


