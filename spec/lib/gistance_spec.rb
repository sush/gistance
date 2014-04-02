require 'spec_helper'

describe Gistance do
  describe '.respond_to?' do
    context 'with an existing Gistance method' do
      it 'responds to method' do
        expect(Gistance.respond_to?(:new, true)).to be_true
      end
    end

    context 'with an existing Gistance::Client method' do
      it 'responds to method' do
        expect(Gistance.respond_to?(:request, true)).to be_true
      end

      it 'delegates to Gistance::Client' do
        Gistance::Client.stub_chain(:new, :get).and_return(true)

        expect(Gistance::Client).to receive(:new).ordered
        expect(Gistance::Client).to receive(:new).ordered

        Gistance.get('fuubar')
      end
    end
  end

  describe '.new' do
    it 'returns a Gistance::Client' do
      expect(Gistance.new).to be_a Gistance::Client
    end
  end
end
