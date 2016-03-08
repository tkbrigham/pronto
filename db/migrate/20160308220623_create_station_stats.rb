class CreateStationStats < ActiveRecord::Migration
  def change
    create_table :station_stats do |t|
      t.integer :pronto_id
      t.integer :status
      t.boolean :blocked
      t.boolean :suspended
      t.boolean :out_of_service
      t.boolean :has_key_dispenser
      t.boolean :has_keys_available
      t.datetime :latest_update
      t.datetime :latest_communication
      t.integer :docks_available
      t.integer :docks_unavailable
      t.integer :bikes_available
      t.integer :bikes_unavailable
      t.references :station, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
