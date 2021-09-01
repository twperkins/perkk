Rails.application.routes.draw do
  devise_for :users do
    resources :companies, only: %i[new create]
  end
  root to: 'pages#home'
  get '/profile', to: 'users#profile'
  get '/package', to: 'users#package'
  resources :perks, only: %i[show index] do
    resources :user_perks, only: %i[create]
    resources :reviews, only: %i[create]
  end
  delete '/package/:id', to: 'user_perks#destroy', as: :remove_user_perk
end
