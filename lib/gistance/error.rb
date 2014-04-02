require 'multi_json'

module Gistance
  # Custom error class
  class Error < StandardError
    # Returns the Error based on status and response message.
    #
    # @param [Hash] response HTTP response
    # @return [Gistance::Error]
    def self.from_response(response)
      status = ::MultiJson.load(response[:body])['status']

      case status
      when 'INVALID_REQUEST'
        raise Gistance::InvalidRequest, status
      when 'MAX_ELEMENTS_EXCEEDED'
        raise Gistance::MaxElementsExceeded, status
      when 'OVER_QUERY_LIMIT'
        raise Gistance::OverQueryLimit, status
      when 'REQUEST_DENIED'
        raise Gistance::RequestDenied, status
      when 'UNKNOWN_ERROR'
        raise Gistance::UnknownError, status
      when 'NOT_FOUND'
        raise Gistance::NotFound, status
      when 'ZERO_RESULTS'
        raise Gistance::ZeroResults, status
      end
    end
  end

  # Raised when API returns INVALID_REQUEST
  class InvalidRequest < Error; end
  #
  # Raised when API returns MAX_ELEMENTS_EXCEEDED
  class MaxElementsExceeded < Error; end

  # Raised when API returns OVER_QUERY_LIMIT
  class OverQueryLimit < Error; end

  # Raised when API returns REQUEST_DENIED
  class RequestDenied < Error; end

  # Raised when API returns UNKNOWN_ERROR
  class UnknownError < Error; end

  # Raised when API returns NOT_FOUND
  class NotFound < Error; end

  # Raised when API returns ZERO_RESULTS
  class ZeroResults < Error; end
end
