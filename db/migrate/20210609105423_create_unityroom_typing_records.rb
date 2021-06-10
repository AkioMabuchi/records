class CreateUnityroomTypingRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :unityroom_typing_records do |t|
      t.string :player_id
      t.string :player_name
      t.integer :time_count
      t.integer :type_count
      t.integer :miss_count
      t.integer :typing_speed
      t.integer :accuracy

      t.timestamps
    end
  end
end
