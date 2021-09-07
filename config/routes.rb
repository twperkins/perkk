Rails.application.routes.draw do
  devise_for :users do
    resources :companies, only: %i[new create]
  end

  devise_scope :user do
    get '/sign-in' => "devise/sessions#new", as: :login
  end

  root to: 'pages#home'

  get '/profile', to: 'users#profile'
  get '/package', to: 'users#package'

  resources :perks, only: %i[show index] do
    resources :user_perks, only: %i[create]
    resources :reviews, only: %i[create]
    resources :favourites, only: %i[create]
  end
  resources :favourites, only: %i[destroy]

  resources :tokens, only: %i[index show]
  resources :orders, only: %i[show create] do
    resources :payments, only: :new
  end

  mount StripeEvent::Engine, at: '/stripe-webhooks'

  delete '/package/:id', to: 'user_perks#destroy', as: :remove_user_perk
end
