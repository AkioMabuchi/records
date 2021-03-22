class CreateCubicPuzzleStages < ActiveRecord::Migration[6.0]
  def change
    create_table :cubic_puzzle_stages do |t|
      t.string :title
      t.string :name
      t.string :floors
      t.string :levels
      t.string :objects

      t.timestamps
    end
  end
end
