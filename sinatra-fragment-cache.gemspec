require File.expand_path('../lib/sinatra_fragment_cache/version', __FILE__)

Gem::Specification.new do |s|
  s.name        = 'sinatra_fragment_cache'
  s.version     = SinatraFragmentCache::VERSION
  s.date        = '2015-05-06'
  s.licenses    = ['MIT']
  s.summary     = 'Sinatra Fragment Cache!'
  s.description = 'Creating a fragment cache with sinatra!'
  s.authors     = ['Adriano Tadao Sabadini Matsumoto']
  s.email       = 'drianotadao@gmail.com '
  s.files       = ['lib/sinatra_fragment_cache.rb']
  s.homepage    = 'https://github.com/adrianotadao/sinatra-fragment-cache'

  s.add_dependency 'sinatra', '~>1.4'

  s.add_development_dependency 'minitest', '~>5.5'
  s.add_development_dependency 'sinatra-contrib'
end