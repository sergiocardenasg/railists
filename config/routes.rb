Rails.application.routes.draw do
  get 'sessions/home'
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  root 'sessions#home'

  resources :playlist_songs
  resources :songs
  resources :genres
  resources :artists
  resources :playlists
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
