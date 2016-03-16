class StatSummarizer
  def initialize(timestamp)
    @timestamp = timestamp
  end

  def summarize
  end

  def find_or_create_summary(stat)
    StationSummary.find_or_create_by(station: stat.station, timestamp: stat.timestamp)
  end
end
