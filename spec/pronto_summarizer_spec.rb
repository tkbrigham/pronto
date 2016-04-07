require 'rails_helper'

RSpec.describe ProntoSummarizer do
  let(:summarizer) { ProntoSummarizer.new(700) }

  before do
    54.times { create(:station_stat, timestamp: 700) }
  end

  describe "#stats" do
    it "gathers StationStats" do
      expect(summarizer.stats.size).to eq(54)
    end
  end

  describe "#summarize" do
    let(:stat_sum) { double(StatSummarizer) }

    it "summarizes each StationStat" do
      allow(StatSummarizer).to receive(:new).and_return(stat_sum)
      expect(stat_sum).to receive(:summarize).exactly(54).times
      summarizer.summarize
    end
  end

  describe "#clean" do
    before do
      54.times { create(:station_stat, created_at: Time.now - 2.hours) }
    end

    it "removes StationStats older than 1 hour" do
      old_stats = StationStat.where('created_at <= ?', Time.now - 1.hour)
      expect(old_stats.size).to eq(54)
      summarizer.clean
      expect(old_stats.reload).to be_blank
    end
  end

  describe "#update" do
    after do
      summarizer.update
    end

    it "calls summarize" do
      expect(summarizer).to receive(:summarize)
    end

    it "calls clean" do
      expect(summarizer).to receive(:clean)
    end
  end
end
