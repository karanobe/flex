Rails.application.routes.draw do
  post '/rate' => 'rater#create', :as => 'rate'
  devise_for :users, :controllers => { registrations: 'registrations' }, skip: [:edit, :update]
  resources  :users
  resources  :preferences
  resources :gyms
  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
