require 'rails_helper'
require 'scraper'

RSpec.describe Scraper do
  describe "#get_response" do
    before(:all) do
      VCR.use_cassette("aloha_json") do
        url = 'https://secure.prontocycleshare.com/data/stations.json'
        @parser = Scraper.new(url)
        @response = @parser.get_response
      end
    end

    it "returns 200" do
      assert_equal @response.class, Net::HTTPOK
      assert_equal @response.code, '200'
    end

    it "has stations key" do
      assert_match 'stations', @response.body
    end
  end
end
