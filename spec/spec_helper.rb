$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))

require 'pry'
require 'rspec'
require 'memo_rage'
require 'helpers/webmock_helper'

RSpec.configure do |config|
  config.before(:each) do
    # Do nothing
  end
end
