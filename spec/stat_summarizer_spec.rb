require 'rails_helper'

RSpec.describe StatSummarizer do
  let(:stat_not_summed) { create(:station_stat, timestamp: 800) }
  let(:stat_summed) { create(:station_stat) }
  let!(:summary) { create(:station_summary, :avg_bike_of_ten, :two_samples,
                          station: stat_summed.station,
                          timestamp: stat_summed.timestamp)
  }

  describe "#find_or_create_summary" do
    it "creates StationSummary if it doesn't exist" do
      summarizer = StatSummarizer.new(stat_not_summed)
      expect{summarizer.find_or_create_summary}.to change{StationSummary.count}
    end

    it "finds StationSummary if exists" do
      summarizer = StatSummarizer.new(stat_summed)
      expect{summarizer.find_or_create_summary}.to_not change{StationSummary.count}
      expect(summarizer.find_or_create_summary).to eq(summary)
    end
  end

  describe "#summarize" do
    it "updates StationSummary average" do
      # Set the StationSummary
      # Set a new StationStat
      # Set the StatSummarizer with that Stat
      summarizer = StatSummarizer.new(stat_summed)
      # Calculate The new station summary
      summarizer.summarize
      # Verify
      expect(summary.avg_dock_a.to_s).to eq('3.67')
    end
  end

  xit "removes StationStats prior to one hour ago"
  xit "sets StationSummary last_stat"
end
