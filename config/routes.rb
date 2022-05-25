Rails.application.routes.draw do
  devise_for :users
  get "/demo", to: 'pages#demo'
end
