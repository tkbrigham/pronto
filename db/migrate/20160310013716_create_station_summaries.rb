class CreateStationSummaries < ActiveRecord::Migration
  def change
    create_table :station_summaries do |t|
      t.references :station, index: true, foreign_key: true, null: false
      t.integer :timestamp,  index: true
      t.integer :tot_dock_a, default: 0
      t.integer :tot_dock_u, default: 0
      t.integer :tot_bike_a, default: 0
      t.integer :tot_bike_u, default: 0
      t.integer :samples,    default: 0

      t.timestamps null: false
    end
  end
end
