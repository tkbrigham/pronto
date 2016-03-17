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
    'la' => 'lat',
    'lo' => 'lon',
    'da' => 'docks_a',
    'dx' => 'docks_u',
    'ba' => 'bikes_a',
    'bx' => 'bikes_u'
  }

  DATETIME_FIELDS = ['latest_update', 'latest_communication']

  def initialize(raw_json = {})
    @raw = raw_json
  end

  def remap
    @raw.map { |k, v| [MAPPINGS[k], convert_datetime(k,v)] }.to_h
  end

  def convert_datetime(key, value)
    if MAPPINGS[key].in?(DATETIME_FIELDS)
      case fixnum_size(value)
      when 13
        Time.at(value/1000)
      when 10
        Time.at(value)
      else
        raise ArgumentError, "Datetime UTC value has unrecognized number of digits"
      end
    else
      value
    end
  end

  def fixnum_size(fixnum)
    return (Math.log10(fixnum).to_i + 1)
  end
end
