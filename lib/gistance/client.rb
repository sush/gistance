require 'gistance/connection'
require 'gistance/request'

require 'gistance/client/distance_matrix'

module Gistance
  # Client for the Google Distance Matrix API
  #
  # @see https://developers.google.com/maps/documentation/distancematrix
  class Client
    attr_accessor(*Configuration::VALID_OPTIONS)

    def initialize(options={})
      options = Gistance.options.merge(options)

      Configuration::VALID_OPTIONS.each do |key|
        send("#{key}=", options[key])
      end
    end

    include Gistance::Connection
    include Gistance::Request

    include Gistance::Client::DistanceMatrix
  end
end
