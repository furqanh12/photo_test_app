Rails.application.routes.draw do
  resources :follows
  devise_for :users
  get 'password_resets/new'
  get 'password_resets/edit'
  # root   'static_pages#home'
  root   'home#index'

  get    '/help',    to: 'static_pages#help'
  get    '/about',   to: 'static_pages#about'
  get    '/contact', to: 'static_pages#contact'
  get    '/signup',  to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :albums do
    resources :pictures
  end
  match '/user_profile/:name' => "users#show", :via => :get
  post '/users/:id/follow', to: "users#follow", as: "follow_user"
  post '/users/:id/unfollow', to: "users#unfollow", as: "unfollow_user"

  get '/users/:id/followers', to: "users#followers"




  # resources :account_activations, only: [:edit]
  # resources :password_resets,     only: [:new, :create, :edit, :update]
  # resources :microposts,          only: [:create, :destroy]
  # resources :relationships,       only: [:create, :destroy]
end
