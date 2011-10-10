PeerReviewer::Application.routes.draw do
  get 'login' => 'sessions#new', :as => 'login'

end
