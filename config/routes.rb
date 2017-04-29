Rails.application.routes.draw do
  post '/rate' => 'rater#create', :as => 'rate'
  resources  :preferences
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources  :users
  root 'welcome#index'

  resources :gyms

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
