Rails.application.routes.draw do
  devise_for :users
  get 'hello/index'
  root 'posts#index', as: 'home'

  resources :posts
end
