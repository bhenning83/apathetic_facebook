Rails.application.routes.draw do
  devise_for :users, :controllers => {
    registrations: 'registrations'
  }

  resources :users, only: [:index, :show]

  devise_scope :user do
    root to: 'users#index'
  end
end
