Rails.application.routes.draw do
  get "hello/index"
  root "posts#index", as: "home"

  resources :posts
end
