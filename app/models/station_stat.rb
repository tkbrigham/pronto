class StationStat < ActiveRecord::Base
  belongs_to :station

  validates_presence_of :station_id
end
