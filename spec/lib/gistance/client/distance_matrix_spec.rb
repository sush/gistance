require 'spec_helper'

describe Gistance::Client::DistanceMatrix do
  describe '.distance_matrix', :vcr do
    let(:options) do
      {
        origins: ['10 Place de la Concorde, 75008 Paris, France'],
        destinations: ['48.857066, 2.341138']
      }
    end

    subject { client.distance_matrix(options) }

    it 'returns an array of origin addresses' do
      expect(subject.origin_addresses).to be_a Array
    end

    it 'returns the origin address' do
      expect(subject.origin_addresses.first).to include 'Concorde'
    end

    it 'returns an array of destination addresses' do
      expect(subject.destination_addresses).to be_a Array
    end

    it 'returns the destination address' do
      expect(subject.destination_addresses.first).to include 'Pont Neuf'
    end

    it 'returns the distance between origin and destination' do
      expect(subject.rows.first['elements'].first.distance.text).to eql('2.3 km')
      expect(subject.rows.first['elements'].first.distance.value).to eql(2335)
    end

    it 'returns the travel duration between origin and destination' do
      expect(subject.rows.first['elements'].first.duration.text).to eql('5 mins')
      expect(subject.rows.first['elements'].first.duration.value).to eql(293)
    end
  end
end
