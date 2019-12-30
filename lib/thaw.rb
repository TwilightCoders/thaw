require 'fiddle'

if ENV['RUBY_ENV'] != 'test' && Gem::Requirement.new('~> 2.7') =~ Gem::Version.new(RUBY_VERSION)
  warn("Object#thaw is not supported by Ruby 2.7+")
else
  require 'thaw/object'
end
