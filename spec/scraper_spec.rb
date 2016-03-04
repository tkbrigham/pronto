require 'rails_helper'
require 'scraper'

RSpec.describe Scraper do
  describe "#get_response" do
    before(:all) do
      VCR.use_cassette("pronto_json") do
        @scraper = Scraper.new
        @response = @scraper.get_response
      end
    end

    subject { @response }

    it "defaults to correct url" do
      url = 'https://secure.prontocycleshare.com/data/stations.json'
      expect(@scraper.instance_values['url']).to eq(url)
    end

    it "returns 200" do
      expect(subject.class).to eq(Net::HTTPOK)
      expect(subject.code).to eq('200')
    end

    it "has stations key" do
      expect(subject.body).to match('stations')
    end

    it "is json" do
      expect(subject.sub_type).to eq('json')
    end
  end

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
