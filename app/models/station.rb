class Station < ActiveRecord::Base
  validates_uniqueness_of :pronto_id
end
