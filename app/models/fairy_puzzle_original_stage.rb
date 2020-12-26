class FairyPuzzleOriginalStage < ApplicationRecord
  validates :name, presence: true
  validates :title, presence: true, length: {maximum: 100}
  validates :field, presence: true, length: {is: 81}
  validates :mp, presence: true
end
