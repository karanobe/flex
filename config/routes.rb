Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }, skip: [:edit, :update]
  resources  :users
  get "/users/:id/profile_load" => 'users#profile_load', :as => 'profile_load'

  resources  :preferences
  resources :gyms
  patch '/gyms/:id/set_primary' => 'gyms#set_primary'

  post 'friendships/:id' => 'friendships#create', as: 'add_friend'
  post 'friendships/:id/accept' => 'friendships#accept', as: 'accept_friend'
  delete 'friendships/:id/deny' => 'friendships#deny', as: 'deny_friend'
  delete 'friendships/:id' => 'friendships#destroy', as: 'unfriend'

  get "/home" => "welcome#home"
  post 'twilio/receive_sms' => 'twilio#receive_sms'
  post 'twilio/reply' => 'twilio#reply'

  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
