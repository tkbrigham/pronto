require 'rails_helper'

RSpec.describe Parser do
  let(:parser) { Parser.new }

  describe "#parse" do
    it "changes count" do
      expect{ parser.parse }.to change{Station.count}.by(54)
    end

    it "doesn't create new stations when they exist" do
      Station.create!(pronto_id: 66)
      expect{ parser.parse }.to change{ Station.count }.by(53)
      expect(Station.count).to eq(54)
    end

    it "updates pre-existing station" do
      s = Station.create!(pronto_id: 66)
      expect(s.blocked).to eq(nil)
      parser.parse
      expect(s.reload.blocked).to eq(false)
    end

    it "creates StationStats" do
      expect{ parser.parse }.to change{ StationStat.count }.by(54)
    end
  end

  describe "#timestamp" do
    it "should return integer" do
      expect(parser.timestamp).to be_a(Integer)
    end

    it "should be between 0-2359" do
      expect(0..2359).to cover(parser.timestamp)
    end
  end
end
