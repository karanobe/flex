Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }, skip: [:edit, :update]
  resources  :users
  get "/users/:id/profile_load" => 'users#profile_load', :as => 'profile_load'

  resources  :preferences
  resources :gyms
  resources :friendships, only: [:create, :destroy]

  # resource :messages do
  #   collection do
  #     post 'reply'
  #   end
  # end

  post 'friendships/:id/accept' => 'friendships#accept', as: 'accept_friend'
  delete 'friendships/:id/deny' => 'friendships#deny', as: 'deny_friend'
  root 'welcome#index'
  get "/home" => "welcome#home"
  post 'twilio/receive_sms' => 'twilio#receive_sms'
  post 'twilio/reply' => 'twilio#reply'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
