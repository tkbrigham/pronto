class Parser
  DEFAULT_FILE = 'tmp/pronto_text.txt'

  def initialize(file = DEFAULT_FILE)
    @file = file
  end

  def update_stations
    parse_to_hash['stations'].each do |station|
      create_or_update(station)
    end
  end

  private

  def parse_to_hash
    File.open('tmp/pronto_scrape.txt', 'r') do |f|
      JSON.parse(f.read)
    end
  end

  def create_or_update(raw_hash)
    attrs = StationMapper.new(raw_hash).remap.except(*stat_fields)
    obj = Station.find_or_initialize_by(pronto_id: attrs['pronto_id'])
    obj.update!(attrs)
  end

  def stat_fields
    ['docks_available',
     'docks_unavailable',
     'bikes_available',
     'bikes_unavailable']
  end
end
