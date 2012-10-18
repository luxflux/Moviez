Moviez::Application.routes.draw do

  resources :tmdb_movie_search, only: [:show, :create]

  resources :movies

  root :to => 'movies#index'
end
