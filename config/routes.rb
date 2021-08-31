Rails.application.routes.draw do
  devise_for :users do
    resources :companies, only: %i[new create]
  end
  root to: 'pages#home'
  get '/profile', to: 'pages#profile'
  get '/package', to: 'pages#package'
  resources :perks, only: %i[show index] do
    resources :user_perks, only: %i[create]
    resources :reviews, only: %i[create]
  end
end
