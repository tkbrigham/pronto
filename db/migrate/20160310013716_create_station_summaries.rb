class CreateStationSummaries < ActiveRecord::Migration
  def change
    create_table :station_summaries do |t|
      t.references :station, index: true, foreign_key: true, null: false
      t.integer :time_of_day, index: true
      t.decimal :avg_dock_a
      t.decimal :avg_dock_u
      t.decimal :avg_bike_a
      t.decimal :avg_bike_u
      t.integer :samples
      t.integer :last_stat_id

      t.timestamps null: false
    end
  end
end
