require 'rails_helper'

RSpec.describe Parser do
  let(:parser) { Parser.new }

  describe "#update_stations" do
    let(:obj) { double(Station) }

    after(:each) do
      parser.update_stations
    end

    it "finds or initializes stations" do
      allow(Station).to receive(:find_or_initialize_by).and_return(obj)
      allow(obj).to receive(:update!)
      expect(Station).to receive(:find_or_initialize_by).exactly(54).times
    end

    it "updates found stations" do
      allow(Station).to receive(:find_or_initialize_by).and_return(obj)
      expect(obj).to receive(:update!).exactly(54).times
    end

    it "changes count" do
      expect{ parser.update_stations }.to change{Station.count}.by(54)
    end

    it "doesn't create new stations when they exist" do
      Station.create!(pronto_id: 66)
      expect{ parser.update_stations }.to change{ Station.count }.by(53)
      expect(Station.count).to eq(54)
    end

    it "updates pre-existing station" do
      s = Station.create!(pronto_id: 66)
      expect(s.blocked).to eq(nil)
      parser.update_stations
      expect(s.reload.blocked).to eq(false)
    end

    it "creates StationStats" do
      expect{ parser.update_stations }.to change{ StationStat.count }.by(54)
    end
  end
end
