class StatSummarizer
  INC_FIELDS = {
    tot_dock_a: :docks_a,
    tot_dock_u: :docks_u,
    tot_bike_a: :bikes_a,
    tot_bike_u: :docks_u
  }

  def initialize(stat)
    @stat = stat
  end

  def summarize
    INC_FIELDS.each_key { |k| increment_field(k) }
    summary.update(samples: summary.samples + 1)
  end

  def increment_field(field)
    sum = find_or_create_summary
    sum[field] += @stat[INC_FIELDS[field]]
    sum.save
  end

  def stat
    @stat
  end

  def summary
    StationSummary.find_by(station: @stat.station, timestamp: @stat.timestamp)
  end

  def find_or_create_summary
    StationSummary.find_or_create_by(
      station: @stat.station, timestamp: @stat.timestamp)
  end
end
