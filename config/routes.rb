Rails.application.routes.draw do
  devise_for :users
  root 'stores#index'
  resources :stores, only: [:new, :create, :edit, :update, :destroy]
end
