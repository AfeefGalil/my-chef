require 'chefspec'
require 'chefspec/berkshelf'
require 'json'

### Chefspec Configuration ###

cookbook_path = "#{File.dirname(__FILE__)}/../../"

RSpec.configure do |config|
  config.cookbook_path = cookbook_path
  config.role_path = "../roles"
  config.log_level = :warn
  config.platform = 'ubuntu'
  config.version = '20.04'
end