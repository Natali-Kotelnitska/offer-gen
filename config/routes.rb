Rails.application.routes.draw do
  devise_for :users

  root "products#new"
  get 'products/show', to: 'products#show'
end
