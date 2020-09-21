Rails.application.routes.draw do
  resources :user, only: [:create, :show]
end
