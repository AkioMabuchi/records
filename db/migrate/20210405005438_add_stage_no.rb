class AddStageNo < ActiveRecord::Migration[6.0]
  def change
    add_column :cubic_puzzle_stages, :stage_no, :integer, null: false, default: 0
  end
end
