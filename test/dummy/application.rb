module DummyApp
  class Base < Sinatra::Base
    register Sinatra::FragmentCache

    #set :fragment_cache_enabled, true
    #set :fragment_cache_output_dir, "tmp/cache"

    get '/' do
      fragment_cache('fooo') do
        { a: 'b' }.to_json
      end
    end
  end
end