Rails.application.routes.draw do
  resources :stretches, only: [:index, :show]
  resources :body_areas, only: [:show]
end
