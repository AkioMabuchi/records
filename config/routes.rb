Rails.application.routes.draw do
  root "home#top"

  post "/records/#{Rails.application.credentials.unity[:psyber_zone]}/send", to: "psyber_zone#send_from_unity"
  get "/records/#{Rails.application.credentials.unity[:psyber_zone]}/receive", to: "psyber_zone#receive_from_unity"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
