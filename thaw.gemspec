require_relative 'lib/thaw/version'

Gem::Specification.new do |spec|
  spec.name          = "thaw"
  spec.version       = Thaw::VERSION.dup
  spec.authors       = ['Dale Stevens']
  spec.email         = "dale@twilightcoders.net"

  spec.summary       = %Q{⚠️ DANGEROUS: Unfreeze Ruby objects (use Object#dup instead)}
  spec.description   = %Q{Attempts to unfreeze Ruby objects by manipulating internal flags. EXTREMELY DANGEROUS on modern Ruby versions - causes crashes and memory corruption. Use Object#dup instead.}
  spec.homepage      = "http://github.com/twilightcoders/thaw"
  spec.license       = "MIT"

  spec.files         = Dir['CHANGELOG.md', 'README.md', 'LICENSE', 'lib/**/*.rb', 'ext/**/*.{rb,c,h}']
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']
  spec.extensions    = ['ext/thaw/extconf.rb']

  spec.metadata['allowed_push_host'] = 'https://rubygems.org'

  spec.required_ruby_version = '>= 2.7'

  spec.add_development_dependency 'bundler', '>= 2.0'
  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'rake-compiler', '~> 1.0'
  spec.add_development_dependency 'rspec', '~> 3.10'
  spec.add_development_dependency 'simplecov_json_formatter', '~> 0.1'

  # Post-install warning message
  spec.post_install_message = <<~MESSAGE
    ┌─────────────────────────────────────────────────────────────────────────────┐
    │ ⚠️  DANGER: You have installed the 'thaw' gem                               │
    │                                                                             │
    │ This gem is EXTREMELY DANGEROUS and will likely crash your Ruby process    │
    │ on modern Ruby versions (2.7+). It manipulates internal object             │
    │ representation which can cause:                                             │
    │                                                                             │
    │ • Segmentation faults                                                      │
    │ • Memory corruption                                                        │
    │ • Undefined behavior                                                       │
    │ • Application crashes                                                      │
    │                                                                             │
    │ RECOMMENDED ALTERNATIVE: Use Object#dup to create mutable copies          │
    │                                                                             │
    │ Example:                                                                    │
    │   frozen_string = "hello".freeze                                            │
    │   mutable_copy = frozen_string.dup  # ✅ SAFE                              │
    │   # NOT: frozen_string.thaw         # ❌ DANGEROUS                         │
    │                                                                             │
    │ If you absolutely must use this gem, read the README carefully:            │
    │ https://github.com/TwilightCoders/thaw                                     │
    │                                                                             │
    │ This gem is maintained for historical purposes only.                       │
    └─────────────────────────────────────────────────────────────────────────────┘
  MESSAGE
end
