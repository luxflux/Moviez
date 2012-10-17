Moviez::Application.routes.draw do
  get "tmdb/search"

  resources :movies

  root :to => 'movies#index'
end
