require 'rails_helper'

RSpec.describe StationSummary, type: :model do
  let(:summary) { build(:station_summary) }

  it "should respond to associations" do
    expect(summary).to respond_to(:station, :stats, :last_stat)
  end

  describe "#last_stat" do
    it "should return StationStat" do
      expect(summary.last_stat).to be_an_instance_of(StationStat)
    end
  end
end
