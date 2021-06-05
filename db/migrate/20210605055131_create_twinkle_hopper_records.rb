class CreateTwinkleHopperRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :twinkle_hopper_records do |t|
      t.string :player_id
      t.string :player_name
      t.integer :clear_time

      t.timestamps
    end
  end
end
