require 'spec_helper'

describe Gistance::Request do
  it_behaves_like 'an error', 'INVALID_REQUEST'
  it_behaves_like 'an error', 'MAX_ELEMENTS_EXCEEDED'
  it_behaves_like 'an error', 'OVER_QUERY_LIMIT'
  it_behaves_like 'an error', 'REQUEST_DENIED'
  it_behaves_like 'an error', 'UNKNOWN_ERROR'
  it_behaves_like 'an error', 'NOT_FOUND'
  it_behaves_like 'an error', 'ZERO_RESULTS'

  context 'given a google business request' do
    let(:business_client) do
      Gistance.new(api_key: '4242', business: { client_id: 'gme-fuubar', channel: 'test' })
    end

    it 'generates a valid signature params' do
      VCR.turn_off!

      stub_request(:get, /.*maps.*/).to_return(body: { status: 'ok' }.to_json)

      business_client.get

      assert_requested :get, 'https://maps.googleapis.com/maps/api/distancematrix/json?'\
        'language=en&'\
        'units=metric&'\
        'sensor=false&'\
        'client=gme-fuubar&'\
        'channel=test&'\
        'signature=JlBk9pESGAhVTtCZbidG8Ss2fbM%3D'

      VCR.turn_on!
    end

    it 'respects overridden options' do
      stub_request(:get, /.*maps.*/).to_return(body: { status: 'ok' }.to_json)

      business_client.units = 'imperial'

      business_client.get

      expect(
        a_request(:get, 'https://maps.googleapis.com/maps/api/distancematrix/json').
        with(:query => hash_including("units" => "imperial"))
      ).
      to have_been_made

    end
  end
end
