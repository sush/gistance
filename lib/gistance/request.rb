module Gistance
  # Methods for HTTP requests
  module Request
    # Make a HTTP GET request.
    #
    # @param path [String] The path, relative to api_endpoint
    # @param options [Hash] query params for request
    # @return [Hashie::Mash]
    def get(options={})
      request(:get, options)
    end

    private

    def request(method, options)
      response = connection.send(method) do |request|
        request.params[:key] = self.api_key if self.api_key

        %i[language unit sensor].each do |option|
          request.params[option] = options.delete(option) || self.public_send(option)
        end

        request.url(self.api_endpoint, options)
      end

      response.body
    end
  end
end
