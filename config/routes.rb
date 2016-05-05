Rails.application.routes.draw do
  devise_for :users
  resources :admin
  resources :restaurants
  resources :menus
  resources :items
  root 'restaurants#index'
end
