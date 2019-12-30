[![Version      ](https://img.shields.io/gem/v/thaw.svg)](https://rubygems.org/gems/thaw)
[![Build Status ](https://travis-ci.org/TwilightCoders/thaw.svg)](https://travis-ci.org/TwilightCoders/thaw)
[![Code Climate ](https://api.codeclimate.com/v1/badges/606df1b8c3c69772a11d/maintainability)](https://codeclimate.com/github/TwilightCoders/thaw/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/606df1b8c3c69772a11d/test_coverage)](https://codeclimate.com/github/TwilightCoders/thaw/test_coverage)

## Thaw

Flip the frozen bit on ruby objects, to unfreeze (thaw) them.

Note: You probably don't need to use this gem, you probably want to [`.dup`](https://www.rubyguides.com/2018/11/dup-vs-clone/) your objects instead.

### Compatibility

To-date, `thaw` works in Ruby `2.0` through `2.6`<sup>1</sup>.

Check the [build status](https://travis-ci.org/TwilightCoders/thaw) for the most current compatibility.

<sup>1</sup>There seems to be a segmentation fault in Ruby `2.7` that I haven't had time to investigate.

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
