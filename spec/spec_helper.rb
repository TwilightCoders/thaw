ENV['RUBY_ENV'] = 'test'
require 'simplecov'
require 'stringio'

SimpleCov.start do
  add_filter 'spec'

  # Generate JSON for qlty coverage (only if JSON formatter is available)
  formatters = [SimpleCov::Formatter::HTMLFormatter]

  begin
    require 'simplecov_json_formatter'
    formatters << SimpleCov::Formatter::JSONFormatter
  rescue LoadError
    # JSON formatter not available, use HTML only
  end

  formatter SimpleCov::Formatter::MultiFormatter.new(formatters)
end

require 'thaw'

RSpec.configure do |config|
  config.order = 'random'
end
