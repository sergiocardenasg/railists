Rails.application.routes.draw do
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  get '/logout' => 'sessions#destroy'
  post '/logout' => 'sessions#destroy'
  root 'sessions#home'
  get '/auth/developer', :as => 'developer_auth'
  get '/auth/github', :as => 'github_auth'
  match '/auth/:provider/callback', to: 'sessions#github', via: [:get, :post]

  resources :playlist_songs
  resources :songs do
    resources :playlist_songs
  end
  resources :genres do
    resources :songs, only: [:show, :index]
  end
  resources :artists do
    resources :songs, only: [:show, :index]
  end
  resources :playlists do
    resources :playlist_songs
  end
  resources :users do
    resources :playlists, only: [:show, :index]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
