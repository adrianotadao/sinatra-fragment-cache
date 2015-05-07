ENV['RACK_ENV'] = 'test'

require File.expand_path '../dummy/application.rb', __FILE__
require 'minitest/autorun'
require 'rack/test'
require 'sinatra_fragment_cache'
require 'sinatra'

def app
  DummyApp::Base
end

class MiniTest::Spec
  include Rack::Test::Methods
end