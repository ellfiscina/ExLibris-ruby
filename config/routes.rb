Rails.application.routes.draw do

  root 'home#index'

  get 'home', to: 'home#index'
  get 'read', to: 'shelf#read'
  get 'reading', to: 'shelf#reading'
  get 'to-read', to: 'shelf#to_read'
  get 'own', to: 'shelf#own'
  get 'want', to: 'shelf#want'

  namespace :home do
    resources :users, except: [:show]
  end

  devise_for :users

  resources :books
  resources :lists
  resources :statistics, only: [:index]
  resources :editors, except: [:show]
  resources :authors, except: [:show]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
