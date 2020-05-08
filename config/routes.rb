Rails.application.routes.draw do
  resources :order_details
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
  
  resources :users, only: :show do
    collection do
      get 'register_card'
      get 'register_address'
    end
  end

  resources :line_items
  
  resources :carts, only: :show do
    collection do
      post 'add_item'
      post 'update_item'
      delete 'delete_item'
    end
  end

  resources :orders, only: [:new, :create, :show] do
    collection do
      post 'confirm'
    end
  end 
end