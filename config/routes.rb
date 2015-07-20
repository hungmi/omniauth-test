Rails.application.routes.draw do
  resources :users
  root to: 'visitors#index'
  get '/signup' => 'users#new', :as => :signup
  get '/auth/:provider/callback' => 'sessions#create'
  get '/signin' => 'sessions#new', :as => :signin
  get '/signout' => 'sessions#destroy', :as => :signout
  get '/auth/failure' => 'sessions#failure'
  post 'twilio/voice' => 'twilio#voice'
  post 'nexmo/message' => 'nexmo#message'
end
