class AddStageNo < ActiveRecord::Migration[6.0]
  def change
    add_column :cubic_puzzle_stages, :stage_no, :integer, null: false, default: 0

    add_column :cubic_puzzle_stages, :latitude, :float
    add_column :cubic_puzzle_stages,:longitude, :float
  end
end
