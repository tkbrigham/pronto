require 'rails_helper'
require 'scraper'

RSpec.describe Scraper do
  describe "#get_response" do
    before(:all) do
      VCR.use_cassette("aloha_json") do
        @scraper = Scraper.new
        @response = @scraper.get_response
      end
    end

    it "defaults to correct url" do
      url = 'https://secure.prontocycleshare.com/data/stations.json'
      assert_equal @scraper.instance_values['url'], url
    end

    it "returns 200" do
      assert_equal @response.class, Net::HTTPOK
      assert_equal @response.code, '200'
    end

    it "has stations key" do
      assert_match 'stations', @response.body
    end

    it "is json" do
      assert_match @response.content_type, 'application/json'
    end
  end
end
