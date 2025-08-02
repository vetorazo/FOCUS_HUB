Rails.application.routes.draw do
  devise_for :users
  root to: "lenses#index"
  get "/about", to: "pages#about"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  resources :lenses, only: %i[index show] do
    resources :listings, only: %i[index]
  end
  resources :listings, only: %i[create new]

  resources :listings, only: %i[index show] do
    post "blackouts", to: "blackouts#create"
    resources :bookings, only: %i[create]
    resources :reviews, only: %i[create]
  end

  resources :bookings, only: [:update]
end
