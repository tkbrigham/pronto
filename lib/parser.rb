class Parser
  DEFAULT_FILE = 'tmp/pronto_scrape.txt'

  def initialize(file = DEFAULT_FILE)
    @file = file
  end

  def update_stations
    parse_to_hash['stations'].each do |station|
      create_or_update(station)
      add_stat(station)
    end
  end

  private

  def parse_to_hash
    File.open(@file, 'r') do |f|
      JSON.parse(f.read)
    end
  end

  def create_or_update(raw_hash)
    attrs = StationMapper.new(raw_hash).remap.except(*stat_only_fields)
    obj = Station.find_or_initialize_by(pronto_id: attrs['pronto_id'])
    obj.update!(attrs)
  end

  def add_stat(raw_hash)
    attrs = StationMapper.new(raw_hash).remap.slice(*stat_fields)
    StationStat.create!(attrs)
  end

  def stat_only_fields
    ['docks_available',
     'docks_unavailable',
     'bikes_available',
     'bikes_unavailable']
  end

  def stat_fields
    ['pronto_id',
      'status',
      'blocked',
      'suspended',
      'out_of_service',
      'has_key_dispenser',
      'has_keys_available',
      'latest_update',
      'latest_communication'
    ] + stat_only_fields
  end
end
