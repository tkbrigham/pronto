require 'rails_helper'
require 'parser'

RSpec.describe Parser do
  let(:parser) { Parser.new }

  describe "#update_stations" do
    let(:obj) { double('obj') }

    before(:each) do
      allow(Station).to receive(:find_or_initialize_by).and_return(obj)
      allow(obj).to receive(:update!)
    end

    after(:each) do
      parser.update_stations
    end

    it "finds or initializes stations" do
      expect(Station).to receive(:find_or_initialize_by).exactly(54).times
    end

    it "updates found stations" do
      expect(obj).to receive(:update!)
    end
  end
end
