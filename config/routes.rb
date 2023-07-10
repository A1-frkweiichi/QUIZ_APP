Rails.application.routes.draw do
  get 'google_login_api/callback'
  resources :quizzes
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#top"

  post '/guest_login', to: 'user_sessions#guest_login'
  
  # Google_Loginのルーティング
  post '/google_login_api/callback', to: 'google_login_api#callback'
  resources :google_login_apis, only: %i[destroy]
end
