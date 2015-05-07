require File.expand_path '../test_helper.rb', __FILE__

describe Sinatra::FragmentCache do
  let(:cache_path){ "#{ FileUtils.pwd }/test/dummy/tmp/cache" }

  after do
    FileUtils.rm_r cache_path, force: true
  end

  it "When the file_name in nil, the cache's name should be index.cache" do
    get '/', { file_name: nil }
    File.file?("#{ cache_path }/cache_key/index.cache").must_equal true
  end

  it "When the file_name isn't nil, the cache's name shouldn't be index.cache" do
    get '/', { file_name: 'index.html' }
    File.file?("#{ cache_path }/cache_key/index.html").must_equal true
  end
end