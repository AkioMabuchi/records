class CreateUnity1week22ndRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :unity1week22nd_records do |t|
      t.string :player_id
      t.string :player_name
      t.integer :picture_id
      t.integer :solve_time

      t.timestamps
    end
  end
end
