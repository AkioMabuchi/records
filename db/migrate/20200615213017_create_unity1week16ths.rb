class CreateUnity1week16ths < ActiveRecord::Migration[6.0]
  def change
    create_table :unity1week16ths do |t|
      t.string :user
      t.integer :score

      t.timestamps
    end
  end
end
