Rails.application.routes.draw do
  root to: 'stretches#index'

  resources :stretches, only: [:index, :show]
  resources :body_areas, only: [:show, :index]

  resources :users, only: [:new, :create, :show] do
    resources :favorites, only: [:create, :destroy]
  end


  resources :admins, only: [:show]
  namespace :admin do
    resources :stretches, only: [:new, :create, :edit, :update, :destroy]
    resources :body_areas, only: [:new, :create]
  end

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
