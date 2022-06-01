Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  namespace :api do
    namespace :v1 do

      resources :users, only: [] do 
        member do
          post :follow
        end
      end

      resources :stories, only: [] do 
        member do
          post :clap
          post :bookmark
        end
      end
    end
  end
  
  resources :stories do 
    resources :comments, only: [:create]
  end
  root 'pages#index'
  # /@bradyhuang/article-title-123
  get '@:username/:story_id', to: 'pages#show', as: 'story_page'
  # /@bradyhuang
  get '@:username', to: 'pages#user', as: 'user_page'

end
