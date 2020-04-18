Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root to: "products#home"
  namespace :products do
    resources :searches, only: :index
  end
  resources :products
  resources :users, only: :show
  resources :comments, only: :create
end