class Unity1week22ndRecord < ApplicationRecord
  validates :player_id, presence: true, uniqueness: {case_sensitive: true}
  validates :player_name, presence: true
  validates :picture_id, presence: true
  validates :solve_time, presence: true
end
