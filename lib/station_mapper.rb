class StationMapper
  MAPPINGS = {
    'id' => 'pronto_id',
    's' => 'station_name',
    'n' => 'terminal_name',
    'st' => 'status',
    'b' => 'blocked',
    'su' => 'suspended',
    'm' => 'out_of_service',
    'lu' => 'latest_update',
    'lc' => 'latest_communication',
    'bk' => 'has_key_dispenser',
    'bl' => 'has_keys_available',
    'la' => 'latitude',
    'lo' => 'longitude',
    'da' => 'docks_available',
    'dx' => 'docks_unavailable',
    'ba' => 'bikes_available',
    'bx' => 'bikes_unavailable'
  }

  def initialize(raw_json)
    @raw = raw_json
  end

  def remap
    @raw.map { |k, v| [MAPPINGS[k], v] }.to_h
  end
end
