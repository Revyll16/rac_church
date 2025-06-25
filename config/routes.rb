Rails.application.routes.draw do
  # Routes d'authentification
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  # Pages publiques
  get 'about', to: 'pages#about'
  get 'sermons', to: 'pages#sermons'
  get 'events', to: 'pages#events'
  get 'contact', to: 'pages#contact'

  # Espace membre
  scope :member, module: :member, as: :member do
    get '/', to: 'dashboard#index', as: :dashboard
    resources :profile, only: [:show, :edit, :update]
    resources :messages
    resources :groups, only: [:index, :show]
    resources :sermons, only: [:index, :show]
    resources :events, only: [:index, :show]
  end

  # Espace admin
  scope :admin, module: :admin, as: :admin do
    get '/', to: 'dashboard#index', as: :dashboard
    resources :users
    resources :groups
    resources :sermons
    resources :events
  end

  # Route racine
  root 'pages#home'

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
