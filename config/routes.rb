# frozen_string_literal: true

Rails.application.routes.draw do
  resources :payments, only: [:index]

  root 'home#index'
  resources :orders, only: %i[show index new create] do
    get :success, on: :collection
  end
  resources :products, only: [:index]
end
