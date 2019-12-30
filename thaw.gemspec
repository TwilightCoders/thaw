require_relative 'lib/thaw/version'

Gem::Specification.new do |spec|
  spec.name          = "thaw"
  spec.version       = Thaw::VERSION.dup
  spec.authors       = ['Dale Stevens']
  spec.email         = "dale@twilightcoders.net"

  spec.summary       = %Q{Unfreeze your objects}
  spec.homepage      = "http://github.com/twilightcoders/thaw"
  spec.license       = "MIT"

  spec.files         = Dir['CHANGELOG.md', 'README.md', 'LICENSE', 'lib/**/*']
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.metadata['allowed_push_host'] = 'https://rubygems.org'

  spec.required_ruby_version = '>= 2.0'

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake'
end
