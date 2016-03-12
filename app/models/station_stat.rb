class StationStat < ActiveRecord::Base
  belongs_to :station

  validates_presence_of :station_id

  after_create :set_timestamp

  private

  def set_timestamp
    self.update!(timestamp: created_at.strftime("%H%M").to_i)
  end
end
