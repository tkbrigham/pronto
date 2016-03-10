class StationSummary < ActiveRecord::Base
  belongs_to :station
  has_many :stats, through: :station
end
