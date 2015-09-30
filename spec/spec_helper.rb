require 'simplecov'
require 'coveralls'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]

SimpleCov.start do
  add_filter 'spec'
  add_filter 'lib/gistance/response'
end

require 'rspec'
require 'vcr'
require 'json'
require 'webmock/rspec'
require 'gistance'

Dir['./spec/support/**/*.rb'].each { |f| require f }

WebMock.disable_net_connect!(allow: 'coveralls.io')

VCR.configure do |c|
  c.cassette_library_dir = 'spec/cassettes'
  c.hook_into :webmock
  c.configure_rspec_metadata!
end

RSpec.configure do |c|
  c.treat_symbols_as_metadata_keys_with_true_values = true
end

def google_distance_matrix_url
  "#{Gistance.api_endpoint}?language=en&sensor=false&units=metric"
end

def client
  Gistance.new
end
