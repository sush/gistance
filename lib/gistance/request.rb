require 'openssl'
require 'base64'

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
        [:language, :units, :sensor].each do |option|
          request.params[option] = options.delete(option) || self.public_send(option)
        end

        request.url(self.api_endpoint, options)

        assign_api_key_to_request(request)
      end

      response.body
    end

    def assign_api_key_to_request(request)
      if self.business
        request.params[:client] = business[:client_id]
        request.params[:channel] = business[:channel] if business[:channel]
        request.params[:signature] = generate_signature_for_request(request)
      else
        request.params[:key] = self.api_key if self.api_key
      end
    end

    def generate_signature_for_request(request)
      digest = OpenSSL::Digest.new('sha1')
      raw_private_key = url_safe_base64_decode(self.api_key)
      normalized_path = normalize_request_path(request)

      raw_signature = OpenSSL::HMAC.digest(digest, raw_private_key, normalized_path)

      url_safe_base64_encode(raw_signature)
    end

    def url_safe_base64_decode(base64_string)
      Base64.decode64(base64_string.tr('-_', '+/'))
    end

    def url_safe_base64_encode(raw)
      Base64.encode64(raw).tr('+/', '-_').strip
    end

    def normalize_request_path(request)
      request.to_env(connection)[:url].to_s.gsub('https://maps.googleapis.com', '')
    end
  end
end
