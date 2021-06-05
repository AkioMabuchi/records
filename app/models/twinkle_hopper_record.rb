class TwinkleHopperRecord < ApplicationRecord
  validates :player_id, presence: true, uniqueness: {case_sensitive: true}
  validates :player_name, presence: true
  validates :clear_time, presence: true, numericality: {greater_than_or_equal_to: 0, less_than: 36000000}
end
