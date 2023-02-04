Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "about" , to: "about#index"
  root to: "main#index"
  get "sign_up", to: "registration#new"
  post "sign_up", to: "registration#create"

  get "sign_in", to: "session#new"
  post "sign_in", to: "session#create"

  get "password", to: "password#edit", as: :password_edit
  patch "password", to: "password#update"

  get "password/reset", to: "password_reset#new"
  post "password/reset", to: "password_reset#create"
  get "password/reset/edit", to: "password_reset#edit"
  patch "password/reset/edit", to: "password_reset#create"
  
  delete "logout", to: "session#destroy"
  # Defines the root path route ("/")
  # root "articles#index"
end
