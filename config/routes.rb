Rails.application.routes.draw do
  root 'stores#index'
  resources :stores, only: [:new]
end
