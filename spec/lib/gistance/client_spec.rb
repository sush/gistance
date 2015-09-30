require 'spec_helper'

describe Gistance::Client do
  describe 'module configuration' do
    before do
      Gistance.reset!

      Gistance.configure do |config|
        Gistance::Configuration::VALID_OPTIONS.each do |key|
          config.send("#{key}=", "Some #{key}")
        end
      end
    end

    after { Gistance.reset! }

    it "inherits the module configuration" do
      client = Gistance::Client.new

      Gistance::Configuration::VALID_OPTIONS.each do |key|
        expect(client.instance_variable_get(:"@#{key}")).to eq "Some #{key}"
      end
    end
  end

  context 'with class level configuration' do
    describe 'api_key' do
      it 'sets api_key'  do
        client = Gistance::Client.new

        expect(client.api_key).to be_nil
      end

      it 'overrides module configuration' do
        client = Gistance::Client.new(api_key: 'randomkey')

        expect(client.api_key).to eql 'randomkey'
      end
    end

    describe 'language' do
      it 'sets language'  do
        client = Gistance::Client.new

        expect(client.language).to eql 'en'
      end

      it 'overrides module configuration' do
        client = Gistance::Client.new(language: 'fr')

        expect(client.language).to eql 'fr'
      end
    end

    describe 'units' do
      it 'sets units'  do
        client = Gistance::Client.new

        expect(client.units).to eql 'metric'
      end

      it 'overrides module configuration' do
        client = Gistance::Client.new(units: 'imperial')

        expect(client.units).to eql 'imperial'
      end
    end

    describe 'sensor' do
      it 'sets sensor'  do
        client = Gistance::Client.new

        expect(client.sensor).to be_false
      end

      it 'overrides module configuration' do
        client = Gistance::Client.new(sensor: true)

        expect(client.sensor).to be_true
      end
    end

    describe 'business' do
      it 'sets businnes'  do
        client = Gistance::Client.new

        expect(client.business).to be_nil
      end

      it 'overrides module configuration' do
        client = Gistance::Client.new(business: { client: 'gme-fuubar' })

        expect(client.business[:client]).to eql('gme-fuubar')
      end
    end
  end
end
