class TwinkleHopperInformation < ApplicationRecord
  belongs_to :player, class_name: "TwinkleHopperPlayer"
end
