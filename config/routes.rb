Rails.application.routes.draw do


  namespace :admin_panel do
    get 'editors/index'
  end
  namespace :admin_panel do
    get 'dashboard/index'
    resources :diagrams, only: [:index]
  end

  root 'home#index'
  get 'home', to: 'home#index'
  get 'admin_panel', to: 'admin_panel/dashboard#index'

  devise_for :users
  devise_for :admins
  resources :books
  resources :editors
  resources :authors
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
