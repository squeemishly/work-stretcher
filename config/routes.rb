Rails.application.routes.draw do
  root to: 'stretches#index'

  resources :stretches, only: [:index, :show]
  resources :body_areas, only: [:show]

  resources :users, only: [:new, :create, :show]
  resources :admins, only: [:show]
  namespace :admin do
    resources :stretches, only: [:new, :create, :edit, :update, :destroy]
  end

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
