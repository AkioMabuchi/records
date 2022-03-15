class NeonTypingRecord < ApplicationRecord
  validates :player_id, presence: true, uniqueness: {case_sensitive: true}
  validates :player_name, presence: true
  validates :score, presence: true, numericality: {greater_than_or_equal_to: 0, less_than: 100000}
end
