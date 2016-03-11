class StationSummary < ActiveRecord::Base
  belongs_to :station
  has_many :stats, through: :station

  belongs_to :last_stat, class_name: 'StationStat'

  validates_presence_of :station_id
end
