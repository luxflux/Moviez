Moviez::Application.routes.draw do

  resource :tmdb_movie_search, only: :create

  resources :movies

  root :to => 'movies#index'
end
