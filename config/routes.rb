Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get "/users/sign_out" => "devise/sessions#destroy"
  end

  root "posts#index", as: "home"

  get "myposts" => "posts#myposts"

  resources :posts
end
