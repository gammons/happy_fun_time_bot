$LOAD_PATH.unshift(File.expand_path(File.join('../lib', File.dirname(__FILE__)))) unless $LOAD_PATH.include? File.join('../lib', File.dirname(__FILE__))
$LOAD_PATH.unshift(File.dirname(__FILE__)) unless $LOAD_PATH.include? File.dirname(__FILE__)

require 'rspec'
require 'happy_fun_time_bot'

# Requires supporting files with custom matchers and macros, etc,
# in ./support/ and its subdirectories.
#Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}

RSpec.configure do |config|
  
end
