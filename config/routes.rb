Rails.application.routes.draw do
  resources :note_tags
  resources :tags
  resources :notes
  resources :users
end
