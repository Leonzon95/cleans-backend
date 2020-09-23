Rails.application.routes.draw do
  resources :applications
  resources :jobs
  resources :addresses
  resources :users, only: [:create, :show]
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/logged_in', to: 'sessions#is_logged_in?'
end
