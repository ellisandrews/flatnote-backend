Rails.application.routes.draw do
  post '/login', to: 'sessions#create'
  get '/current_user', to: 'sessions#show'

  resources :notes, only: [:index, :create, :update, :destroy]
  resources :users, only: [:create]
end
