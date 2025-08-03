[![Gem Version](https://badge.fury.io/rb/thaw.svg)](https://badge.fury.io/rb/thaw)
[![CI](https://github.com/TwilightCoders/thaw/actions/workflows/ci.yml/badge.svg)](https://github.com/TwilightCoders/thaw/actions/workflows/ci.yml)
[![Maintainability](https://qlty.sh/badges/8dcc3d6f-7bae-4b03-bd4a-aba0103be001/maintainability.svg)](https://qlty.sh/gh/TwilightCoders/projects/thaw)
[![Test Coverage](https://qlty.sh/badges/8dcc3d6f-7bae-4b03-bd4a-aba0103be001/test_coverage.svg)](https://qlty.sh/gh/TwilightCoders/projects/thaw/metrics/code?sort=coverageRating)
![GitHub License](https://img.shields.io/github/license/twilightcoders/thaw)

## Thaw

Flip the frozen bit on ruby objects, to unfreeze (thaw) them.

Note: You probably don't need to use this gem, you probably want to [`.dup`](https://www.rubyguides.com/2018/11/dup-vs-clone/) your objects instead.

### Compatibility

The gem **supports Ruby 2.7+** with significant safety concerns:

- **Native C extension**: The only available implementation, extremely dangerous
- **Safe fallback**: If compilation fails, shows error message and guides users to Object#dup

**⚠️ IMPORTANT:** The native extension is **extremely dangerous** and may cause crashes, memory corruption, or undefined behavior.

**Strong Recommendation:** Use [`Object#dup`](https://www.rubyguides.com/2018/11/dup-vs-clone/) instead of trying to unfreeze objects.

### Native C Extension

The gem uses a **native C extension** to implement object unfreezing:

```bash
gem install thaw
```

**⚠️ EXTREME WARNING:** The native extension:
- Manipulates Ruby's internal object representation directly
- **Will likely cause segmentation faults** on modern Ruby versions
- May have platform-specific compilation issues
- Goes against Ruby's fundamental design principles
- Requires a C compiler and Ruby development headers

### No Ruby Fallback

The dangerous Ruby/Fiddle fallback implementation has been **removed for safety**. If the native extension isn't available, the gem will show clear error messages and guide users toward `Object#dup`.

### Current Status

The gem is maintained for:
- Historical compatibility and documentation
- Clear deprecation warnings to guide users toward better alternatives
- Demonstration of the risks involved in low-level object manipulation

### Installation

The best way to install is with RubyGems:

    $ [sudo] gem install thaw

Or better still, just add it to your Gemfile:

    gem 'thaw'

### Example

    string = "hello"
    string.frozen?
    => false
    string.thawed?
    => true
    string.freeze
    string.frozen?
    => true
    string.thawed?
    => false
    string.thaw
    string.frozen?
    => false
    string.thawed?
    => true

## Development

After checking out the repo, run `bundle` to install dependencies. Then, run `bundle exec rspec` to run the tests.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/TwilightCoders/thaw. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## Credits

Shamelessly ripped from [ndnenkov](https://stackoverflow.com/users/2423164/ndnenkov)'s answer on [StackOverflow](https://stackoverflow.com/questions/35633367/how-to-unfreeze-an-object-in-ruby).

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
