Rails.application.routes.draw do
  resources :quizzes
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#top"

  post '/guest_login', to: 'user_sessions#guest_login'
end
