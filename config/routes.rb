Moviez::Application.routes.draw do
  get "tmdb_movie_search/new"

  get "tmdb_movie_search/create"

  resources :movies

  root :to => 'movies#index'
end
