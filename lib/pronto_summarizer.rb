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

  def clean
    StationStat.where('timestamp <= ?', @timestamp - 100).destroy_all
  end
end
