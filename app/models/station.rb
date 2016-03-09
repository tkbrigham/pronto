class Station < ActiveRecord::Base
  validates_uniqueness_of :pronto_id

  has_many :stats, class_name: "StationStat"
end
