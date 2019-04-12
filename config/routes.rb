Rails.application.routes.draw do
  root to: 'businesses#index'

  resources :sessions

  get 'logout' => 'sessions#destroy'

  get '/auth/spotify/callback' => 'businesses#spotify_user'

  resources :businesses do
    resources :locations, :only => [:create, :index, :new, :show, :destroy, :edit, :update]
    resources :playlists, :only => [:show, :index]
  end

  resources :locations do
    resources :playlists, :only => [:create, :index, :new, :show, :destroy]
  end

  resources :playlists do
    resources :songs, :only => [:destroy]
  end

  # resources :playlists

  get "/playlists/:playlist_id/songs/:song_id" => "songs#destroy"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
