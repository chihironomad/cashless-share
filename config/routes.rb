Rails.application.routes.draw do
  devise_for :users
  root 'stores#index'
  resources :stores, only: [:new, :create, :edit, :update, :destroy] do
    collection do
      get 'search'
    end
  end
end
