shared_examples 'an error' do |error|
  error_class_name = error.split(/_/).map{ |word| word.capitalize }.join('')
  exception = Gistance.const_get(error_class_name)

  it "raising #{exception.name} when status is #{error}" do
    VCR.turn_off!

    stub_request(:get, google_distance_matrix_url).to_return(
      body: { status: error }.to_json
    )

    expect { client.get }.to raise_error exception

    VCR.turn_on!
  end
end
