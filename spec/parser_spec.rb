require 'rails_helper'
require 'parser'

RSpec.describe Parser do
  let(:parser) { Parser.new }

  describe "#parse_to_hash" do
    after(:each) do
      parser.parse_to_hash
    end

    it "reads from tmp/pronto_scrape.txt" do
      file = "tmp/pronto_scrape.txt"
      arg = 'r'

      expect(File).to receive(:open).with(file, arg).exactly(1).times
    end

    it "parses file into JSON" do
      expect(JSON).to receive(:parse)
    end

    it "returns Hash" do
      expect(parser.parse_to_hash).to be_a(Hash)
    end
  end

  describe "#update_stations" do
    it "finds or initializes stations" do
      expect(Station).to receive(:find_or_initialize_by)
    end
  end
end
