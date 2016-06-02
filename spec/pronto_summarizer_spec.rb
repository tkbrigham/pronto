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
    it "removes StationStats older than 1 hour" do
      54.times { create(:station_stat, created_at: Time.now - 2.hours) }
      old_stats = lambda {
        StationStat.where('created_at <= ?', Time.now - 1.hour).size
      }
      expect{ summarizer.clean }.to change{ old_stats.call }.by(-54)
    end

    it "changes Station#status to 0 if not updated in last 24 hours" do
      zero = lambda { Station.where(status: 0).size }
      Station.limit(9).update_all(updated_at: 25.hours.ago)
      expect{ summarizer.clean }.to change{ zero.call }.by(9)
    end

    it "removes StationStats with Station that has status != 1" do
      Station.limit(7).update_all(status: 2)
      Station.limit(2).update_all(status: 0)
      expect{ summarizer.clean }.to change{ StationStat.count }.by(-9)
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
