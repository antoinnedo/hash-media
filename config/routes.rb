Rails.application.routes.draw do
  get "home/index"
  devise_for :users, controllers: {
    confirmations: 'users/confirmations'
  }
  root to: "posts#index"
  resources :users, only: [:index, :show, :edit, :update]

  resources :posts do
    resources :comments, only: [:create, :update, :destroy]
    resource :like, only: [:create, :destroy]
  end

  resources :comments do
    resources :responses, only: [:create, :update, :destroy]
  end

  resources :relationships, only: [:create, :destroy]

end
