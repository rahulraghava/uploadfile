Rails.application.routes.draw do
  resources :advertisments
  resources :variants
  resources :brands
  devise_for :users
  get 'home/index'

  root to: "advertisments#index"
end
