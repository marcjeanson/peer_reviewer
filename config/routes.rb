PeerReviewer::Application.routes.draw do
  root :to => 'sessions#new'
  get 'login' => 'sessions#new', :as => 'login'
  get 'logout' => 'sessions#destroy', :as => 'logout'

  resources :sessions
end
