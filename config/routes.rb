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
    resource :dashboards, only: :show
  end

  namespace :admin do
    root to: 'dashboards#show'

    resource :dashboards, only: :show
    resources :users, only: [:index, :show]
  end
end
