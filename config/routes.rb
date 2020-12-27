Rails.application.routes.draw do
  resources :drafts

  post 'drafts/:id/publish/' => 'drafts#publish', as: 'drafts_publish'

  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  root 'posts#index', as: 'home'

  get 'myposts' => 'posts#myposts'

  resources :posts do
    get '/up_rate/' => 'posts#up_rate_post'
    get '/down_rate/' => 'posts#down_rate_post'
    resources :comments
  end
end
