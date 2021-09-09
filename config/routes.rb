Rails.application.routes.draw do
  root "home#top"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get "/#{Rails.application.credentials[:access_key][:unity1week17th]}/receive", to: "unity1week17th#receive_stages"
  post "/#{Rails.application.credentials[:access_key][:unity1week17th]}/send", to: "unity1week17th#send_stage"

  get "/#{Rails.application.credentials[:access_key][:unity1week18th]}/receive", to: "unity1week18th#receive_records"
  post "/#{Rails.application.credentials[:access_key][:unity1week18th]}/send", to: "unity1week18th#send_record"

  get "/#{Rails.application.credentials[:access_key][:cubic_puzzle_receive]}/receive", to: "cubic_puzzle#receive_stages"
  get "/#{Rails.application.credentials[:access_key][:cubic_puzzle_receive_official]}/receive", to: "cubic_puzzle#receive_official_stages"
  get "/#{Rails.application.credentials[:access_key][:cubic_puzzle_receive_edited]}/receive", to: "cubic_puzzle#receive_edited_stages"
  post "/#{Rails.application.credentials[:access_key][:cubic_puzzle_send]}/send", to: "cubic_puzzle#send_stage"

  post "/#{Rails.application.credentials[:access_key][:twinkle_hopper_send_player_initialization]}/send", to: "twinkle_hopper#send_player_initialization"
  get "/#{Rails.application.credentials[:access_key][:twinkle_hopper_receive_player_information]}/receive", to: "twinkle_hopper#receive_player_information"
  post "/#{Rails.application.credentials[:access_key][:twinkle_hopper_send_player_information]}/send", to: "twinkle_hopper#send_player_information"
  get "/#{Rails.application.credentials[:access_key][:twinkle_hopper_receive_information]}/receive", to: "twinkle_hopper#receive_information"
  get "/#{Rails.application.credentials[:access_key][:twinkle_hopper_receive_information_2]}/receive", to: "twinkle_hopper#receive_information_2"
  post "/#{Rails.application.credentials[:access_key][:twinkle_hopper_send_information]}/send", to: "twinkle_hopper#send_information"
  post "/#{Rails.application.credentials[:access_key][:twinkle_hopper_send_information_2]}/send", to: "twinkle_hopper#send_information_2"
  get "/#{Rails.application.credentials[:access_key][:twinkle_hopper_receive_records]}/receive", to: "twinkle_hopper#receive_records"
  get "/#{Rails.application.credentials[:access_key][:twinkle_hopper_receive_records_2]}/receive", to: "twinkle_hopper#receive_records_2"
  post "/#{Rails.application.credentials[:access_key][:twinkle_hopper_send_record]}/send", to: "twinkle_hopper#send_record"
  post "/#{Rails.application.credentials[:access_key][:twinkle_hopper_send_record_2]}/send", to: "twinkle_hopper#send_record_2"
  post "/#{Rails.application.credentials[:access_key][:twinkle_hopper_destroy_information]}/destroy", to: "twinkle_hopper#destroy_information"
  post "/#{Rails.application.credentials[:access_key][:twinkle_hopper_destroy_information_2]}/destroy", to: "twinkle_hopper#destroy_information_2"

  get "/#{Rails.application.credentials[:access_key][:unityroom_typing]}/receive", to: "unityroom_typing#receive_records"
  post "/#{Rails.application.credentials[:access_key][:unityroom_typing]}/send", to: "unityroom_typing#send_record"

  post "/#{Rails.application.credentials[:access_key][:unity1week20th][:send_stage]}/send", to: "unity1week20th#send_stage"
  get "/#{Rails.application.credentials[:access_key][:unity1week20th][:receive_stages]}/receive", to: "unity1week20th#receive_stages"

end
