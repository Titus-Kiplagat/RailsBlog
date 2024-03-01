Rails.application.routes.draw do
  # Defines the root path route ("/")
  root to: "users#index"

  resources  :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create] do
      resources :comments, only: [:new, :create]
      resources :likes, only: [:create, :destroy]
    end
  end
end
