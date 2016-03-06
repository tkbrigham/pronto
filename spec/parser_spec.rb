require 'rails_helper'
require 'parser'

RSpec.describe Parser do
  let(:parser) { Parser.new }

  after(:each) do
    parser.parse_file
  end

  describe "#parse_file" do
    it "reads from tmp/pronto_scrape.txt" do
      file = "tmp/pronto_scrape.txt"
      arg = 'r'

      expect(File).to receive(:open).with(file, arg).exactly(1).times
    end

    it "parses file into JSON" do
      expect(JSON).to receive(:parse)
    end

    it "creates Station models" do
      expect(Station).to receive(:new)
    end
  end
end
