Rails.application.routes.draw do
  post '/rate' => 'rater#create', :as => 'rate'

  devise_for :users, :controllers => { registrations: 'registrations' }
  root 'welcome#index'

  resources 'gym'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
