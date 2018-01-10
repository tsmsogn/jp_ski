# JpSki

[![Build Status](https://travis-ci.org/tsmsogn/jp_ski.svg?branch=master)](https://travis-ci.org/tsmsogn/jp_ski)

JpSki is utils for Japanese ski resort.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'jp_ski'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install jp_ski

## Usage

Get all ski resorts

    JpSki.list_ski_resort
    # => [#<JpSki::Ski:0x007fb76d2cf4f8 @name="石狩平原スキー場", @pref="北海道", @area="北海道">,...] 

## Contributing

1. Fork it ( https://github.com/[my-github-username]/jp_ski/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
