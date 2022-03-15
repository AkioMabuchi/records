class CreateNeonTypingRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :neon_typing_records do |t|
      t.string :player_id
      t.string :player_name
      t.integer :score

      t.timestamps
    end
  end
end
