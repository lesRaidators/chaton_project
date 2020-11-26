Rails.application.routes.draw do
  devise_for :users

  resources :items, path: 'photos'
  resources :lineitems
  resources :orders, path: 'commandes'
  resources :carts, path: 'panier'
  resources :charges, path: 'paiement'

  resources :users, only: [:show] do
    resources :avatars, only: [:create]
  end

  resources :photos, path_names: { new: 'make', edit: 'change' }
  
  root 'items#index'
end
