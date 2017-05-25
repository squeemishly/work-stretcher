Rails.application.routes.draw do
  resources :stretches, only: [:index]
end
