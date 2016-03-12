class StationSummary < ActiveRecord::Base
  belongs_to :station
  has_many :stats, through: :station

  validates_presence_of :station_id
end
