# HumanBytes

Convert bytesizes into a human-readable format

Either uses decimal byte prefixes or prefixes based on powers of 2 (Ki, Mi, etc.).
The functionality is exposed as a:

- module function named `HumanBytes.human_bytes`
- includable submodule `HumanBytes::MethodVersion` for numeric types
- simple executable named `human_bytes`

Arbitrary precision arithmetic is used so that even astronomical bytesizes are handled correctly.

## Module function
    include HumanBytes
    Humanbytes.human_bytes(1024) #=> '1.00 KiB'
    human_bytes(1050, places: 10) #=> '1.0253906250 KiB'
    human_bytes(1050, places: 3, i: false) #=> '1.050 KB'

## Includable submodule

    Numeric.include(HumanBytes::MethodVersion)
    1024.human_bytes #=> '1.00 KiB'
    1050.human_bytes(places: 10) #=> '1.0253906250 KiB'
    1050.human_bytes(places: 3, i: false) #=> '1.050 KB'

## Executable
    $ echo 1024 | human_bytes -d #=> 1.00 KiB
    $ echo 352853503285093280958325083205832| human_bytes #=> 291873576.99 YiB

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'human_bytes'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install human_bytes

## Usage

TODO: Improve the executable.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment. 

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/[my-github-username]/human_bytes/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

Copyright © Petr Skočík, 2015 
