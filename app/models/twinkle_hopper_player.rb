class TwinkleHopperPlayer < ApplicationRecord
  has_one :information, class_name: "TwinkleHopperInformation", dependent: :destroy
  validates :player_token, presence: true, uniqueness: {case_sensitive: true}
  validates :player_name, presence: true
  validates :hopper_color_hue, presence: true
end
