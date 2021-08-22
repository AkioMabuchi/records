class CreateTwinkleHopperInformations < ActiveRecord::Migration[6.0]
  def change
    create_table :twinkle_hopper_information do |t|
      t.float :position_x
      t.float :position_y
      t.float :position_z
      t.float :rotation_w
      t.float :rotation_x
      t.float :rotation_y
      t.float :rotation_z
      t.float :velocity_x
      t.float :velocity_y
      t.float :angular_velocity
      t.integer :time_count
      t.integer :jump_count

      t.references :player, foreign_key: {to_table: :twinkle_hopper_players}

      t.timestamps
    end
  end
end
