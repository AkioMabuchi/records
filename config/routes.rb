Rails.application.routes.draw do
  root "home#top"

  get "/unity1week16th", to: "unity1week16th#index"

  post "/unity1week16th/fromunity/send", to: "unity1week16th#send_from_unity"
  get "/unity1week16th/fromunity/receive", to: "unity1week16th#receive_from_unity"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
