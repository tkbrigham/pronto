class CreateStationSummaries < ActiveRecord::Migration
  def change
    create_table :station_summaries do |t|
      t.references :station, index: true, foreign_key: true, null: false
      t.integer :timestamp, index: true
      t.decimal :avg_dock_a
      t.decimal :avg_dock_u
      t.decimal :avg_bike_a
      t.decimal :avg_bike_u
      t.integer :samples

      t.timestamps null: false
    end
  end
end
