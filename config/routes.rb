Rails.application.routes.draw do
  devise_for :users

  resources :offers, only: [:new, :create, :show]
  root 'offers#new'
  # root "home#index"
end
