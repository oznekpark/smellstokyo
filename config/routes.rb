Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  
  devise_for :users
  
  root 'products#home'
  
  resources :products, only: [:index, :show] do
    collection do
      get 'searchFromHeadersForm'
      get 'searchFromPulldownsForm'
      get 'indexOfWomenProducts'
      get 'indexOfMenProducts'
    end
    resources :comments
  
  end
  
  resources :users, only: :show

  resources :line_items
  
  resources :carts

  resources :orders, only: [:new, :create, :show] do
    collection do
      post 'confirm'
    end
  end 
end