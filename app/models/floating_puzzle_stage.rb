class FloatingPuzzleStage < ApplicationRecord
  validates :author, presence: true, length: {maximum: 12}
  validates :stage_name, presence: true, length: {maximum: 20}
  validates :map_info, presence: true, length: {is: 171}
end
