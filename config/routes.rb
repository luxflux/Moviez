Moviez::Application.routes.draw do

  devise_for :users

  resources :tmdb_movies, only: [:index, :show]

  resources :movies do
    put :auto_update, on: :member
    resources :loans
  end

  resources :borrowers

  root :to => 'movies#index'
end
