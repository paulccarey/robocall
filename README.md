## About

A rails gem to easily add sending synthesized messages from Rails to any phone number. 

## Install

Add the robocall gem to your Gemfile:

```
gem 'robocall'
```

In conf/environment.rb, add the configuration:

``` ruby
Robocall.from_phone_number = '555-555-5555'
Robocall.sid               = 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
Robocall.auth_token        = 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'

