Rails.application.routes.draw do
  get 'bookmarks/create'
  get 'bookmarks/destroy'
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
      get 'bookmarks'
    end
    resources :comments
    resources :bookmarks, only: [:create, :destroy]
  end

  resources :bookmarks, only: :index do
    collection do
      delete 'delete'
    end
  end
  
  resources :users, only: :show

  resources :line_items
  
  resources :carts, only: [:show, :update, :destroy] do
    collection do
      post 'add_item'
    end
  end

  resources :orders, only: [:new, :create, :index] do
    collection do
      get 'confirm'
    end
  end 

  resources :order_details, only: :index
  
  resources :cards, only: [:new, :create, :show, :destroy] 

  resources :addresses
end