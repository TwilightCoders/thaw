ENV['RUBY_ENV'] = 'test'
require 'simplecov'

SimpleCov.start do
  add_filter 'spec'
end

require 'thaw'

RSpec.configure do |config|
  config.order = 'random'
end
