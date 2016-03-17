require 'rails_helper'

RSpec.describe ProntoSummarizer do
  describe "#stats" do
    let(:parser) { Parser.new('spec/fixtures/pronto_scrape.txt') }
    let(:summarizer) { ProntoSummarizer.new(parser.timestamp) }

    it "gathers StationStats" do
      parser.parse
      expect(summarizer.stats.size).to eq(54)
    end
  end

  xit "removes StationStats older than 1 hour"
  xit "summarizes each StationStat"
end
