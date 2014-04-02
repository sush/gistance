require 'spec_helper'

describe Gistance::Request do
  it_behaves_like 'an error', 'INVALID_REQUEST'
  it_behaves_like 'an error', 'MAX_ELEMENTS_EXCEEDED'
  it_behaves_like 'an error', 'OVER_QUERY_LIMIT'
  it_behaves_like 'an error', 'REQUEST_DENIED'
  it_behaves_like 'an error', 'UNKNOWN_ERROR'
  it_behaves_like 'an error', 'NOT_FOUND'
  it_behaves_like 'an error', 'ZERO_RESULTS'
end
