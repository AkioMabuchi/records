class UnityroomTypingRecord < ApplicationRecord
  validates :player_id, presence: true, uniqueness: {case_sensitive: true}
  validates :player_name, presence: true
  validates :time_count, presence: true
  validates :type_count, presence: true
  validates :miss_count, presence: true
  validates :typing_speed, presence: true
  validates :accuracy, presence: true
end
