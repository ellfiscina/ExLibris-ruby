Rails.application.routes.draw do

  namespace :admin_panel do
    resources :diagrams, only: [:index]
    resources :admins, except: [:show]
  end

  root 'home#index'
  get 'home', to: 'home#index'
  get 'admin_panel', to: 'admin_panel/admins#index'

  devise_for :users
  devise_for :admins
  resources :books
  resources :editors
  resources :authors
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
