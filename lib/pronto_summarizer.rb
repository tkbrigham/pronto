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
    StationStat.where('created_at <= ?', Time.now - 1.hour).destroy_all
  end

  def update
    summarize && clean
  end
end
