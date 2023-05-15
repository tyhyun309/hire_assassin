Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :assassins, only: [ :index, :show, :edit, :update] do
    resources :bookings, only: [ :create ]
  end

  resources :bookings, only: [:index, :update]

  namespace :assassin do
    resources :bookings, only: :index
  end
end
