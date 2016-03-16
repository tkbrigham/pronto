class StatSummarizer
  def initialize(stat)
    @stat = stat
  end

  def summarize

  end

  def find_or_create_summary
    StationSummary.find_or_create_by(
      station: @stat.station, timestamp: @stat.timestamp)
  end
end
