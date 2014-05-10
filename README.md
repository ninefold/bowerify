# Bowerify

A little gem that patches Sprockets in order for it to resolve
the [bower](http://bower.io) components relative assets paths
correclty.

Can be used with vanilla `bower` toolchain or in conjunction with
the [bower-rails](https://github.com/42dev/bower-rails) gem.

## Usage

Add the gem to your `Gemfile`

```ruby
gem 'bowerify'
```

Breath normally.

## Bower Components Location

This plugin assumes that you install your bower assets into the
`lib/assets/components` folder. if you need to change that, add
this to your `config/application.rb`

```ruby
  config.bower_components_path = Rails.root.join("path/to/your/components")
```


## Copyright & License

All code in this repository is released under the terms of the MIT license.

Copyrigth (C) 2014 Nikolay Nemshilov
