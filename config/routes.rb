Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  resources :books
  root to: 'welcome#index'

  namespace :api do
    namespace :v1 do
      resources :books
    end
  end
end
