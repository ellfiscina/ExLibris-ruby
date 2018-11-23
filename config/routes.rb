Rails.application.routes.draw do

  root 'home#index'

  get 'home', to: 'home#index'

  devise_for :users
  devise_for :admins

  namespace :user do
    root to: 'books#index'

    resources :authors
    resources :books
    resources :editors
    resources :lists, except: [:edit, :index]
    resource :dashboard, only: :show
    resources :toread_lists
  end

  namespace :admin do
    root to: 'dashboard#show'

    resource :dashboard, only: :show
    resources :users, only: [:index, :show]
  end
end
