Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Pages publiques
  root 'pages#home'
  get 'about', to: 'pages#about'
  get 'sermons', to: 'pages#sermons'
  get 'events', to: 'pages#events'
  get 'contact', to: 'pages#contact'

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  # Espace membre
  namespace :member do
    root "dashboard#index"
    resources :profile, only: [:show, :edit, :update]
    resources :messages
    resources :groups, only: [:index, :show]
    resources :sermons, only: [:index, :show]
    resources :events, only: [:index, :show]
  end

  # Espace admin
  namespace :admin do
    root "dashboard#index"
    resources :users
    resources :groups
    resources :sermons
    resources :events
  end
end
