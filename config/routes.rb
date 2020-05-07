Rails.application.routes.draw do
  post '/login', to: 'sessions#create'
  resources :note_tags
  resources :tags
  resources :notes
  resources :users
end
