Rails.application.routes.draw do
  
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  #get '/products', to: 'products#index'
  #get '/products/new', to: 'products#new', as: 'new_product'
  #post '/products', to: 'products#create'
  #get '/products/:id', to: 'products#show', as: 'product'
  #get '/products/:id/edit', to: 'products#edit', as: 'edit_product'
  #patch 'products/:id', to: 'products#update'
  #delete '/products/:id', to: 'products#destroy'

  root 'products#index'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'


  resources :products do
    resource :vote, only: [:create, :destroy]
    resources :comments, only: [:create]
  end
  resources :users, only: [:new, :create]
  

  


  # Defines the root path route ("/")
  # root "posts#index"
end
