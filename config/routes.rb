Rails.application.routes.draw do
  devise_for :users, :controllers => {
    registrations: 'registrations'
  }

  resources :users, only: [:index, :show]
  resources :friend_requests, only: [:create, :destroy]
  resources :friendships, only: [:create, :destroy]
  resources :likes, only: [:create, :destroy]
  resources :posts
  resources :comments

  get 'likes', to: 'posts#index'

  post 'posts/new',    to: 'posts#create'
  post 'comments/new', to: 'comments#create'

  devise_scope :user do
    root to: 'users#index'
  end
end
