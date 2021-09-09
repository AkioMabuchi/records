class CreateFloatingPuzzleStages < ActiveRecord::Migration[6.0]
  def change
    create_table :floating_puzzle_stages do |t|
      t.string :author
      t.string :stage_name
      t.string :map_info

      t.timestamps
    end
  end
end
