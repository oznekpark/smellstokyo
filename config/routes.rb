Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  
  devise_for :users, controllers: {
    sessions:      'users/sessions',
    confirmations: 'users/confirmations',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }
  
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
  
  resources :users, only: :show do
    collection do
      get 'register_card'
      get 'register_address'
    end
  end

  resources :line_items
  
  resources :carts, only: [:show, :update, :destroy] do
    collection do
      post 'add_item'
    end
  end

  resources :orders, only: [:new, :create, :show, :index] do
    collection do
      post 'confirm'
    end
  end 

  resources :order_details
end