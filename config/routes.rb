Moviez::Application.routes.draw do



  resources :loans


  resources :borrowers


  devise_for :users

  resources :tmdb_movies, only: [:index, :show]

  resources :movies do
    put :auto_update, on: :member
  end
  root :to => 'movies#index'
end
