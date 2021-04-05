class CubicPuzzleStage < ApplicationRecord
  validates :title, presence: true
  validates :name, presence: true
  validates :floors, presence: true, length: {is: 169}
  validates :levels, presence: true, length: {is: 169}
  validates :objects, presence: true, length: {is: 169}
  validates :stage_no, presence: true
end
