Rails.application.routes.draw do
  post '/rate' => 'rater#create', :as => 'rate'
  resource  :preferences
  devise_for :users, :controllers => { registrations: 'registrations' }
  resource  :users
  root 'welcome#index'

  resources :gyms

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
