Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get "/users/sign_out" => "devise/sessions#destroy"
  end

  root "posts#index", as: "home"

  get "myposts" => "posts#myposts"

  resources :posts do
    resources :comments
  end

  post "/up_rate_post/:id" => "posts#up_rate_post", :as => "up_rate_post"
  post "/down_rate_post/:id" => "posts#down_rate_post", :as => "down_rate_post"
end
