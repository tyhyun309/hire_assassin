Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :assassins, only: [ :new, :index, :show, :edit, :update, :create] do
    resources :bookings, only: [ :create ]
  end

  resources :bookings, only: [:index, :update]

  namespace :assassin do
    get '/bookings' => 'bookings#index', as: :my_a_bookings
    # patch '/bookings/:id' => 'bookings#update', as: :assassin_booking
    # put '/bookings/:id' => 'bookings#updat'
    resources :bookings, only: [:update]
  end
end
