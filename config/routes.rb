Rails.application.routes.draw do
 
  get 'static_pages/index'
  get 'static_pages/secret'
  devise_for :users
  resources :items
  resources :line_items
  
  root 'items#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
