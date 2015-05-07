module DummyApp
  class Base < Sinatra::Base
    register Sinatra::FragmentCache

    get '/' do
      fragment_cache('cache_key', file_name: params[:file_name]) do
        { a: 'b' }.to_json
      end
    end
  end
end