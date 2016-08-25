Rails.application.routes.draw do

  root to: 'visitors#index'

  devise_for :users, controllers: {
    registrations: "users/registrations"
  }

  resources :after_signup
  resources :deals

end
