require 'rails_helper'

RSpec.describe StatSummarizer do
  let(:stat_not_summed) { create(:station_stat, timestamp: 800) }
  let(:stat_summed) { create(:station_stat) }
  let!(:summary) { create(:station_summary, :ten_bikes, :two_samples,
                          station: stat_summed.station,
                          timestamp: stat_summed.timestamp) }
  let(:summarizer) { StatSummarizer.new(stat_summed) }

  describe "#stat" do
    it "will respond" do
      expect(summarizer).to respond_to(:stat)
      expect(summarizer.stat).to be_a(StationStat)
    end

    context 'with existing summary' do
      it 'returns stat with same timestamp as summary' do
        expect(summarizer.stat.timestamp).to eq(summarizer.summary.timestamp)
      end

      it 'returns stat with same station as summary' do
        expect(summarizer.stat.station).to eq(summarizer.summary.station)
      end
    end
  end

  describe "#summary" do
    it "will respond" do
      expect(summarizer).to respond_to(:summary)
    end

    context "with existing summary" do
      it "returns a StationSummary" do
        expect(summarizer.summary).to be_a(StationSummary)
      end
    end

    context "with no summary" do
      let(:summarizer) { StatSummarizer.new(stat_not_summed) }
      it "returns nil" do
        expect(summarizer.summary).to be_nil
      end
    end
  end

  describe "#find_or_create_summary" do
    it "creates StationSummary if it doesn't exist" do
      summarizer = StatSummarizer.new(stat_not_summed)
      expect{summarizer.find_or_create_summary}.to change{StationSummary.count}
    end

    it "finds StationSummary if exists" do
      expect{summarizer.find_or_create_summary}.to_not change{StationSummary.count}
      expect(summarizer.find_or_create_summary).to eq(summary)
    end
  end

  describe "#increment_field" do
    it "updates the StationSummary field" do
      ct = summarizer.stat.bikes_a
      expect{summarizer.increment_field(:tot_bike_a)}.
        to change{summarizer.summary.tot_bike_a}.by(ct)
    end
  end

  describe "#summarize" do
    it "updates StationSummary totals" do
      map = StatSummarizer::INC_FIELDS
      map.each_key do |k|
        ct = summarizer.stat.send(map[k])
        expect{summarizer.summarize}.to change{summarizer.summary.send(k)}.by(ct)
      end
    end

    it "updates samples" do
      expect{summarizer.summarize}.to change{summarizer.summary.samples}.by(1)
    end
  end
end
