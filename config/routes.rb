Rails.application.routes.draw do
  get "home/index"
  devise_for :users
  root to: "posts#index"
  resources :users, only: [:index, :show]

  resources :posts do
    resources :comments, only: [:create, :update, :destroy]
  end

  resources :comments do
    resources :responses, only: [:create, :update, :destroy]
  end

  resources :relationships, only: [:create, :destroy]

  resources :posts do
    resource :like, only: [:create, :destroy]
  end
end
