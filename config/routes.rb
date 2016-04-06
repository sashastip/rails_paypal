Rails.application.routes.draw do

  resources :carts
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  resources :books

  resources :orders do
    collection do
      get 'express_checkout'
    end
  end

  root to: 'welcome#index'

  namespace :api do
    namespace :v1 do
      resources :books
    end
  end
end
