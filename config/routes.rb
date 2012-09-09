Moviez::Application.routes.draw do
  resources :movies

  root :to => 'welcome#home'
end
