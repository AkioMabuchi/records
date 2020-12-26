class CreateFairyPuzzleOriginalStages < ActiveRecord::Migration[6.0]
  def change
    create_table :fairy_puzzle_original_stages do |t|
      t.string :name
      t.string :title
      t.string :field
      t.integer :mp

      t.timestamps
    end
  end
end
