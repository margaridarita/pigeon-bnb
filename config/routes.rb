Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :pigeons do
    resources :bookings, only: %i[new create]
  end
  resources :bookings, only: %i[edit update show]
end
