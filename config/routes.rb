Rails.application.routes.draw do
  get "hello/index"
  get "posts" => "posts#index"

  resources :posts
end
