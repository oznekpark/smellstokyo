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
end