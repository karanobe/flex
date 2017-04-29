Rails.application.routes.draw do
  post '/rate' => 'rater#create', :as => 'rate'
  resources  :preferences
  devise_for :users, :controllers => { registrations: 'registrations' }
  resource  :users
  resources :gyms

  root 'welcome#index'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
