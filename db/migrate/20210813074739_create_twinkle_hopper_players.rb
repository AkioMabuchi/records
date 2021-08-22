class CreateTwinkleHopperPlayers < ActiveRecord::Migration[6.0]
  def change
    create_table :twinkle_hopper_players do |t|
      t.string :player_token
      t.string :player_name
      t.float :hopper_color_hue

      t.timestamps
    end
  end
end
