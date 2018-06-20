Rails.application.routes.draw do

  root 'home#index'

  get 'home', to: 'home#index'
  get 'admin_panel', to: 'admin_panel/admins#index'

  namespace :admin_panel do
    resources :diagrams, only: [:index]
    resources :admins, except: [:show]
  end

  namespace :home do
    resources :users, except: [:show]
  end

  devise_for :users
  devise_for :admins
  resources :books
  resources :lists
  resources :statistics
  resources :editors, except: [:show]
  resources :authors, except: [:show]

  resources :home do
    collection do
      get :authors
      get :editors
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
