require 'rails_helper'

RSpec.describe Scraper do
  describe "#download" do
    before(:all) do
      VCR.use_cassette("pronto_text") do
        scraper = Scraper.new
        scraper.download
      end
    end

    it "produces tmp file" do
      expect(File).to exist('tmp/pronto_scrape.txt')
    end

    context "tmp file" do
      subject { File.read('tmp/pronto_scrape.txt') }

      it { include('stations') }
    end
  end
end
