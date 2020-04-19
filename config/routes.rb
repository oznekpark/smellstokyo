Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root to: 'products#home'
  # namespace :products do
  #   resources :searches, only: :index
  # end
  resources :products do
    collection do
      get 'searchFromHeadersForm'
      get 'searchFromPulldownsForm'
    end
  end
  resources :products do
    resources :comments, only: :create
  end
  resources :users, only: :show
end