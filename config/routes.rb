Rails.application.routes.draw do
  resources :stretches, only: [:index, :show]
  resources :body_areas, only: [:show]
  resources :users, only: [:new, :create, :show]

  get '/login', to: 'session#new'
end
