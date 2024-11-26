Rails.application.routes.draw do
  devise_for :users
  root to: "events#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  resources :events do
    resources :bookings, only: [:create]
    resources :users, only: :index
  end
  resources :users, only: [:show, :edit, :update, :destroy] do
    resources :posts do
      resources :comments, only: [:index, :new, :create, :edit, :update, :destroy]
    end
  end
  resources :bookings, only: [:index, :destroy]


  # Defines the root path route ("/")
  # root "posts#index"
end
