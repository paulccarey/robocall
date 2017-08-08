$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "robocall/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "robocall"
  s.version     = Robocall::VERSION
  s.authors     = ["Reto Stamm"]
  s.email       = ["reto.stamm@originate.com"]
  s.homepage    = "https://github.com/Originate/robocall"
  s.summary     = "Easy way to send robocalls with Rails and Twilio."
  s.description = "Provides all the infrastructure to send synthesized robocalls with Twilio."
  s.licenses    = ['MIT']

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency 'rails', '> 4.0', '< 5.0'
  s.add_dependency 'twilio-ruby'
  s.add_dependency 'haml-rails'

  s.add_development_dependency "sqlite3"
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'rspec-collection_matchers'
  s.add_development_dependency 'factory_girl_rails'
end
