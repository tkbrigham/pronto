class CreateStations < ActiveRecord::Migration
  def change
    create_table :stations do |t|
      t.integer :pronto_id, null: false
      t.string :station_name
      t.string :terminal_name
      t.integer :status
      t.boolean :blocked
      t.boolean :suspended
      t.boolean :out_of_service
      t.datetime :latest_update
      t.datetime :latest_communication
      t.boolean :has_key_dispenser
      t.boolean :has_keys_available
      t.decimal :lat
      t.decimal :lon

      t.timestamps null: false
    end

    add_index :stations, :pronto_id
  end
end
