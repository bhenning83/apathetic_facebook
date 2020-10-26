Rails.application.routes.draw do
  Rails.application.routes.default_url_options[:host] = "XXX"
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

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'
  get 'privacy', to: 'static#privacy'

  devise_scope :user do
    root to: 'users#index'
  end
end
