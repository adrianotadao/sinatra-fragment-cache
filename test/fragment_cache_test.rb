require File.expand_path '../test_helper.rb', __FILE__

describe Sinatra::FragmentCache do
  before do
    app.set :fragment_cache_output_dir, "#{ FileUtils.pwd }/test/dummy/tmp/cache"
  end

  after do
    FileUtils.rm_r app.fragment_cache_output_dir, force: true
  end

  it "When the file_name is nil, the cache's name should be index.cache" do
    get '/', { file_name: nil }
    File.file?("#{ app.fragment_cache_output_dir }/cache_key/index.cache").must_equal true
  end

  it "When the file_name isn't nil, the cache's name shouldn't be index.cache" do
    get '/', { file_name: 'index.html' }
    File.file?("#{ app.fragment_cache_output_dir }/cache_key/index.html").must_equal true
  end

  it "When the fragment cache_path is changed, the path should be created on the same" do
    app.set :fragment_cache_output_dir, "#{ FileUtils.pwd }/public/cache"
    get '/', { file_name: 'index.html' }
    File.file?("#{ app.fragment_cache_output_dir }/cache_key/index.html").must_equal true
  end
end