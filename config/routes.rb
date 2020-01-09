Rails.application.routes.draw do
  
  root 'users#home'

  resources :dogs
  resources :users, only: [:show, :create, :update, :destroy]
  resources :breeds

  
  post 'login' => "users#login"
  get 'signup' => "users#new"
  get 'edit_profile' => "users#edit"
  get 'logout' => 'users#logout'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
