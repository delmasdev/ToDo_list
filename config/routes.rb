Rails.application.routes.draw do
  devise_for :users
  root to: "emails#index"
  get 'home', to: "home#index"
  resources :tasks, except: [:show]
  resources :emails
end
