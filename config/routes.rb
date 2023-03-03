Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get "/dashboard", to: "pages#dashboard"
  get "/my-bookings", to: "pages#my_bookings"
  get "/my-pigeons", to: "pages#my_pigeons"
  get "/map", to: "pigeons#map"
  resources :pigeons do
    resources :bookings, only: %i[index new create]
    resources :reviews, only: %i[index new create]
  end
  resources :bookings, only: %i[edit update show destroy]
end
