class CreateNeondromeRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :neondrome_records do |t|
      t.string :player_id
      t.string :name
      t.integer :score

      t.timestamps
    end
  end
end
