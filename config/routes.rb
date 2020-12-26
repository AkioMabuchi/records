Rails.application.routes.draw do
  root "home#top"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get "/#{Rails.application.credentials.access_key[:unity1week17th]}/receive", to: "unity1week17th#receive"
  post "/#{Rails.application.credentials.access_key[:unity1week17th]}/send", to: "unity1week17th#send"
end
