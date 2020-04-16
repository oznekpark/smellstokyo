Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root to: "products#home"
  namespace :products do
    resources :searches, only: [:home, :index, :show]
  end
  resources :products
end