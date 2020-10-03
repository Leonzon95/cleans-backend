Rails.application.routes.draw do
  
  
  resources :users, only: [:create, :show, :update] do 
    resources :applications, only: [:create, :index]
    resources :jobs, only: [:create, :index, :update]
    resources :addresses, only: [:create, :index]
    resources :reviews, only: [:create, :index]
  end
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/logged_in', to: 'sessions#is_logged_in?'
  resources :jobs, only: [:index]
end
