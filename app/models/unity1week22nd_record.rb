class Unity1week22ndRecord < ApplicationRecord
  validates :player_id, presence: true
  validates :player_name, presence: true
  validates :picture_name, presence: true
  validates :solve_time, presence: true
end
