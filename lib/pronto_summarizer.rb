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
    Station.where('updated_at <= ?', Time.now - 24.hours).update_all(status: 0)
    disabled_station_ids = Station.where.not(status: 1).collect(&:id)
    StationStat.where(station_id: disabled_station_ids).destroy_all
  end

  def update
    summarize && clean
  end
end
