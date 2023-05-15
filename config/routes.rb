Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get 'assassins', to: 'assassins#index'
  get 'assassins/:id', to: 'assassins#show', as: :show
  get 'assassins/:id/edit', to: 'assassins#edit', as: :edit
  patch 'assassins/:id', to: 'assassins#update'
end
