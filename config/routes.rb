Rails.application.routes.draw do

  root 'home#index'

  get 'home', to: 'home#index'
  get 'read', to: 'shelf#read'
  get 'reading', to: 'shelf#reading'
  get 'to-read', to: 'shelf#to_read'
  get 'own', to: 'shelf#own'
  get 'want', to: 'shelf#want'
  get 'search', to: 'search#books'

  devise_for :users

  resources :books
  resources :lists, except: [:edit]
  resources :statistics, only: [:index]
  resources :editors
  resources :authors
end
