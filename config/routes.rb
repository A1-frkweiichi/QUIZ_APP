Rails.application.routes.draw do
  root "home#top"

  resources:users, only: [:show, :edit, :update]

  devise_for :users, controllers: {
    omniauth_callbacks: "users/omniauth_callbacks",
    registrations: 'users/registrations'
  }
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end

  resources :quizzes do
    member do
      post :record_answer
    end
  end
  get "explanation/:id", :to => "quizzes#explanation", as: 'explanation'
end
