Rails.application.routes.draw do
  Rails.application.routes.default_url_options[:host] = "XXX"
  get 'signout', to: 'sessions#destroy', as: 'signout'

  devise_for :users, :controllers => {
    registrations: 'registrations'
  }

  resources :users, only: [:index, :show]
  resources :friend_requests, only: [:create, :destroy]
  resources :friendships, only: [:create, :destroy]
  resources :likes, only: [:create, :destroy]
  resources :posts
  resources :comments

  devise_scope :user do
    root to: 'posts#index'
  end

  get 'likes', to: 'posts#index'
  post 'posts/:id/edit', to: 'posts#update'

  post 'posts/new',    to: 'posts#create'
  post 'comments/new', to: 'comments#create'
  post 'users/:id',    to: 'posts#create'

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
 
  get 'privacy', to: 'static#privacy'

end
