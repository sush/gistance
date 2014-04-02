require 'faraday'
require 'gistance/error'

module Gistance
  # Faraday response middleware
  module Response
    # Raises a Gistance exception based on status response or HTTP status codes returned by the API
    class RaiseError < Faraday::Response::Middleware
      private

      def on_complete(response)
        if error = Gistance::Error.from_response(response)
          raise error
        end
      end
    end
  end
end
