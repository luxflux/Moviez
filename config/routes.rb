Moviez::Application.routes.draw do

  resources :tmdb_movie_searches, only: [:index, :show, :create]

  resources :movies do
    put :auto_update, on: :member
  end

  root :to => 'movies#index'
end
