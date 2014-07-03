# encoding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'gistance/version'

Gem::Specification.new do |gem|
  gem.name = 'gistance'
  gem.version = Gistance::VERSION.dup
  gem.license = 'MIT'

  gem.summary = %q{Google Distance Matrix API Ruby wrapper}
  gem.description = %q{Simple Ruby wrapper for the Google Distance Matrix API.}
  gem.homepage = 'https://github.com/sush/gistance'

  gem.authors = ['Aylic Petit']
  gem.email = ['sush@users.noreply.github.com']

  gem.required_ruby_version = '>= 1.9.2'

  gem.files = %w[.yardopts LICENSE README.md CONTRIBUTING.md Rakefile gistance.gemspec]
  gem.files += Dir.glob('{spec,lib}/**/*.rb')
  gem.require_paths = ['lib']
  gem.test_files = Dir.glob('spec/**/*')

  gem.add_dependency 'faraday', '~> 0.9.0'
  gem.add_dependency 'faraday_middleware', '~> 0.9.0'
  gem.add_dependency 'hashie', '~>2.0.5'
  gem.add_dependency 'json', '~>1.8.1'
  gem.add_dependency 'multi_json', '~>1.10.1'
end
