require 'sidekiq/web'
require 'sidekiq-scheduler/web'

Rails.application.routes.draw do
  resources :messages
  resources :rooms

  devise_for :users

  root to: 'home#index'

  authenticate :user do
    mount Sidekiq::Web => '/sidekiq'
  end
end
