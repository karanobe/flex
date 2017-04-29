Rails.application.routes.draw do
  post '/rate' => 'rater#create', :as => 'rate'
  resources  :preferences
  devise_for :users, :controllers => { registrations: 'registrations' }
<<<<<<< HEAD
  resource  :users
  resources :gyms
=======
  resources  :users
>>>>>>> master
  root 'welcome#index'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
