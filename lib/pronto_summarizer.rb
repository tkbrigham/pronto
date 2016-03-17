class ProntoSummarizer
  def initialize(timestamp)
    @timestamp = timestamp
  end

  def stats
    StationStat.where(timestamp: @timestamp)
  end

  def summarize
    stats.each do |stat|
      StatSummarizer.new(stat).summarize
    end
  end
end
