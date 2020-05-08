Rails.application.routes.draw do
  post '/login', to: 'sessions#create'
  get '/current_user', to: 'sessions#show'

  resources :note_tags
  resources :tags
  resources :notes
  resources :users
end
