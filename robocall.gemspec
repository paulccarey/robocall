$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "robocall/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "robocall"
  s.version     = Robocall::VERSION
  s.authors     = ["Reto Stamm"]
  s.email       = ["reto.stamm@originate.com"]
  s.homepage    = "https://github.com/retospect/robocall"
  s.summary     = "Easy way to send robocalls with Rails and Twilio."
  s.description = "Provides all the infrastructure to send synthesized robocalls with Twilio."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.13"
  # s.add_dependency "jquery-rails"

  s.add_development_dependency "sqlite3"
end
