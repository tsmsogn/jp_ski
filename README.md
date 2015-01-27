# JpSki

[![Build Status](https://travis-ci.org/tsmsogn/jp_ski.svg?branch=master)](https://travis-ci.org/tsmsogn/jp_ski)

Japan ski areas

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

Get all ski areas

    JpSki::Ski.all
    # => [#<JpSki::Ski:0x007fb76d2cf4f8 @name="石狩平原スキー場", @pref="北海道", @area="北海道">,...] 

Get ski ares with JpSki::Ski.find

    JpSki::Ski.find uuid: '81f5bc66-2fca-4beb-b74b-b851b0067c71'
	=> #<JpSki::Ski:0x007febad879a10 @uuid="81f5bc66-2fca-4beb-b74b-b851b0067c71", @name="石狩平原スキー場", @pref="北海道", @area="北海道", @postal_code="0610208", @address="北海道石狩郡当別町弁華別">

    JpSki::Ski.find name: 'M'
	# => [#<JpSki::Ski:0x007fb76d2489f8 @name="manogamiスキー場", ...]
	
	JpSki::Ski.find pref: '北海道'
    # => [#<JpSki::Ski:0x007fb76d2cf4f8 @name="石狩平原スキー場", @pref="北海道", @area="北海道">,...] 
	
	JpSki::Ski.find top: '>= 1100'
	=> [#<JpSki::Ski:0x007febada8b038 @uuid="0ee0caf8-649e-440a-a0a5-e852feb956f8", @name="札幌国際スキー場", @pref="北海道", @area="北海道", @postal_code="0612301", @address="北海道札幌市南区定山渓937", @top=1100, @bottom=630, @max_slope=3600, @max_angle=30>]
	
	JpSki::Ski.find bottom: '> 629'
	=> [#<JpSki::Ski:0x007febada0ad48 @uuid="0ee0caf8-649e-440a-a0a5-e852feb956f8", @name="札幌国際スキー場", @pref="北海道", @area="北海道", @postal_code="0612301", @address="北海道札幌市南区定山渓937", @top=1100, @bottom=630, @max_slope=3600, @max_angle=30>]
	
	JpSki::Ski.find max_slope: '== 3600'
	=> [#<JpSki::Ski:0x007febad8ec948 @uuid="0ee0caf8-649e-440a-a0a5-e852feb956f8", @name="札幌国際スキー場", @pref="北海道", @area="北海道", @postal_code="0612301", @address="北海道札幌市南区定山渓937", @top=1100, @bottom=630, @max_slope=3600, @max_angle=30>]
	
	JpSki::Ski.find max_angle: '> 30'
	=> nil

## Contributing

1. Fork it ( https://github.com/[my-github-username]/jp_ski/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
