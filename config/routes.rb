Rails.application.routes.draw do
  root "home#top"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get "/#{Rails.application.credentials.access_key[:unity1week17th]}/receive", to: "unity1week17th#receive_stages"
  post "/#{Rails.application.credentials.access_key[:unity1week17th]}/send", to: "unity1week17th#send_stage"
  get "/#{Rails.application.credentials.access_key[:unity1week18th]}/receive", to: "unity1week18th#receive_records"
  post "/#{Rails.application.credentials.access_key[:unity1week18th]}/send", to: "unity1week18th#send_record"
  get "/#{Rails.application.credentials.access_key[:cubic_puzzle]}/receive", to: "cubic_puzzle#receive_stages"
  post "/#{Rails.application.credentials.access_key[:cubic_puzzle]}/send", to: "cubic_puzzle#send_stage"
end
