# Sinatra::FragmentCache

This gem is to be used to generate cache similar to FragmentCache. You can pass the arguments: a block of code, the cache key and the minutos that the caches should expires.

## Requirements

- Ruby 1.9.3 or greater
- Sinatra ~>1.4

## Installation

```ruby
# Gemfile
source :rubygems

gem 'sinatra', '~1.4'
gem 'sinatra_fragment_cache', '0.0.1'
```

### Options

You can set these options:

```
expires_in (Integer): time in minutes of cache expiration.
file_name (String): is the name of cache file
```

#### Default

```ruby
app.set :fragment_cache_enabled, true
app.set :fragment_cache_output_dir, lambda { "#{ app.root }/tmp/cache" }
```

## Using

### Simple usage

```ruby
require 'rubygems'
require 'bundler'
Bundler.require :default

module DummyApp < Sinatra::Base
  register Sinatra::FragmentCache

  get '/' do
    fragment_cache('cache_key') do
      { foo: 'Bar' }.to_json
    end
  end
end
```

### Sending the cache options

```ruby
require 'rubygems'
require 'bundler'
Bundler.require :default

module DummyApp < Sinatra::Base
  register Sinatra::FragmentCache

  get '/' do
    fragment_cache('cache_key') do
      { foo: 'Bar' }.to_json
    end
  end
end
```

### Disabling the cache on environment development

```ruby
require 'rubygems'
require 'bundler'
Bundler.require :default

module DummyApp < Sinatra::Base
  register Sinatra::FragmentCache

  configure :development do
    set :fragment_cache_enabled, false
  end

  get '/' do
    fragment_cache('cache_key', file_name: 'index.json', expires_in: 60) do
      { foo: 'Bar' }.to_json
    end
  end
end
```

### Changing the cache path

```ruby
require 'rubygems'
require 'bundler'
Bundler.require :default

module DummyApp < Sinatra::Base
  register Sinatra::FragmentCache

  configure do
    set :fragment_cache_output_dir, "#{ FileUtils.pwd }/public/cache"
  end

  get '/' do
    fragment_cache('cache_key') do
      { foo: 'Bar' }.to_json
    end
  end
end
```