class TwinkleHopperInformation < ApplicationRecord
  belongs_to :player, class_name: "TwinkleHopperPlayer"
  validates :player_id, presence: true, uniqueness: {case_sensitive: true}
  validates :position_x, presence: true
  validates :position_y, presence: true
  validates :position_z, presence: true
  validates :rotation_w, presence: true
  validates :rotation_x, presence: true
  validates :rotation_y, presence: true
  validates :rotation_z, presence: true
  validates :velocity_x, presence: true
  validates :velocity_y, presence: true
  validates :angular_velocity, presence: true
  validates :jump_count, presence: true
  validates :time_count, presence: true
end
