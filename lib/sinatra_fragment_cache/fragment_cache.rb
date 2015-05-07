module Sinatra
  module FragmentCache
    attr_accessor :path, :options, :cache_path

    def fragment_cache(path, options = {}, &block)
      @path = path
      @options = options
      @cache_path = "#{ FileUtils.pwd }/tmp/cache/#{ path }/index.cache"

      return block.call unless settings.cache_enabled

      @_out_buf = []
      if cache = read_fragment
        @_out_buf << cache
      else
        pos = @_out_buf.length
        tmp = block.call
        write_fragment tmp[pos..-1]
      end
    end

    def read_fragment
      now = Time.now
      if File.file?(cache_path)
        if options[:expires]
          (current_age = (now - File.mtime(cache_path)).to_i / 60)
          return false if (current_age > options[:expires])
        end
        return File.read(cache_path)
      end
      false
    end

    def write_fragment(buf)
      create_path!
      f = File.new(cache_path, "w+")
      f.write(buf)
      f.close
      buf
    end

    def create_path!
      FileUtils.mkdir_p "tmp/cache/#{ path }"
    end

    def self.registered(app)
      app.extend Sinatra
      app.helpers FragmentCache
    end
  end
end