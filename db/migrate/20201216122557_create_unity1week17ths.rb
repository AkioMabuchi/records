class CreateUnity1week17ths < ActiveRecord::Migration[6.0]
  def change
    create_table :unity1week17ths do |t|
      t.string :hash
      t.string :name
      t.integer :score

      t.timestamps
    end
  end
end
