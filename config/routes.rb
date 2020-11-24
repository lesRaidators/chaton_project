Rails.application.routes.draw do
  
  
  get 'static_pages/index'
  get 'static_pages/secret'
  devise_for :users
  resources :items
<<<<<<< HEAD
  resources :users, only: [:show] do
    resources :avatars, only: [:create]
  end

=======
  resources :lineitems
  
>>>>>>> development
  root 'items#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
