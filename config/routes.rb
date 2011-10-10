PeerReviewer::Application.routes.draw do
  root :to => 'sessions#new'
  get 'login' => 'sessions#new', :as => 'login'

  resources :sessions
end
