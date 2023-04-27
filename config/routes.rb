Rails.application.routes.draw do
  devise_for :users
  resources :eggs
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "objects#index"
  root "eggs#index"
  resources :eggs
  
end
