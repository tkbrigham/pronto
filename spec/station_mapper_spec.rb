require 'rails_helper'
require 'station_mapper'

RSpec.describe StationMapper do
  let(:mapper) { StationMapper.new }
  let(:key) { 'lu' }
  let(:utc) { 1457053580978 }
  let(:correct) { Time.at(utc/1000) }

  describe "#convert_datetime" do
    it "parses 13 digit UTC correctly" do
      expect(mapper.convert_datetime(key, utc)).to eq(correct)
    end

    it "parses 10 digit UTC correctly" do
      ten_dig = utc/1000
      expect(ten_dig.size).to eq(10)
      expect(mapper.convert_datetime(key, ten_dig)).to eq(correct)
    end

    it "throws error if UTC is not 10 or 13 digits" do
      [14555, 123010230002, 11, 12340023002340393838].each do |val|
        expect{ mapper.convert_datetime(key, val) }.to raise_error(ArgumentError)
      end
    end
  end

  describe "#remap" do
    before(:all) do
      json = JSON.parse(File.open('spec/support/station.json','r').read)
      @mapper = StationMapper.new(json)
    end

    it "converts raw keys to mapped keys" do
      keys = StationMapper::MAPPINGS.values
      expect(@mapper.remap.keys).to eq(keys)
    end

    it "converts datetime values" do
      dt_values = @mapper.remap.values_at(*StationMapper::DATETIME_FIELDS)

      dt_values.each do |val|
        expect(val).to be_a(Time)
      end
    end
  end
end
