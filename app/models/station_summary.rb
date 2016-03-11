class StationSummary < ActiveRecord::Base
  belongs_to :station
  has_many :stats, through: :station

  belongs_to :last_stat, class_name: 'StationStat'
end
