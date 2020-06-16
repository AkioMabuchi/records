class CreateUnity1week16thRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :unity1week16th_records do |t|
      t.string :user
      t.integer :score

      t.timestamps
    end
  end
end
