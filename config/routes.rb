Rails.application.routes.draw do
  
  root 'users#home'

  resources :dogs, only: [:create, :show, :edit, :update]
  
  resources :breeds, only: [:index] do
      resources :dogs, only: [:index]
  end
  resources :users do
    resources :dogs, only: [:new]
  end

  resources :users, only: [:new, :show, :create, :edit, :update, :destroy]

  resources :breeds

  get 'breeds/:breed_id/qual_index' => "dogs#qual_index", as: :qual_index
  post 'login' => "users#login"
  get 'signup' => "users#new"
  get 'logout' => 'users#logout'
  get 'delete/:id' => 'dogs#destroy', as: :delete
  get '/auth/facebook/callback' => 'sessions#new'
  post 'session/create' => 'sessions#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
