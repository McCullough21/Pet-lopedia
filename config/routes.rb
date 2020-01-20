Rails.application.routes.draw do
  
  root 'users#home'

  resources :dogs
  
  resources :breeds do
      resources :dogs, only: [:index, :show]
  end
  resources :users, only: [:new] do
    resources :dogs, only: [:new, :create]
  end

  resources :users, only: [:show, :create, :edit, :update, :destroy]

  resources :breeds

  
  post 'login' => "users#login"
  get 'signup' => "users#new"
  get 'edit_profile' => "users#edit"
  get 'logout' => 'users#logout'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
