require 'rails_helper'

RSpec.describe Scraper do
  describe "#download" do
    before do
      VCR.use_cassette("pronto_text") do
        scraper = Scraper.new
        scraper.download('test_scrape.txt')
      end
    end

    it "produces file in scrapes dir" do
      expect(File).to exist('scrapes/test_scrape.txt')
    end

    context "scrape file" do
      subject { File.read('scrapes/test_scrape.txt') }

      it { include('stations') }
    end
  end
end
