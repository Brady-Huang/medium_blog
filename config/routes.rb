Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  root 'pages#index'
  # /@bradyhuang/article-title-123
  get '@:username/:story_id', to: 'pages#show', as: 'story_page'
  # /@bradyhuang
  get '@:username', to: 'pages#user', as: 'user_page'

  resources :stories

end
