Rails.application.routes.draw do
  root to: 'products#home'
  resources :products
end