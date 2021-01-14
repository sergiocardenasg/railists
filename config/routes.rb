Rails.application.routes.draw do
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  get '/logout' => 'sessions#destroy'
  post '/logout' => 'sessions#destroy'
  root 'sessions#home'
  match '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]

  resources :playlist_songs
  resources :songs
  resources :genres
  resources :artists
  resources :playlists
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
