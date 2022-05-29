Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  root 'pages#index'
  get "/demo", to: 'pages#demo'

  resources :stories

end
