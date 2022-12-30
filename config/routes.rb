Rails.application.routes.draw do
  resources :transaction_histories,only: [:index]

  mount StripeEvent::Engine, at: '/stripe/webhook'
  
  root "home#index"
  resources :orders,only: [:index,:new,:create] do
    get :success,on: :collection
  end
  resources :products,only: [:index]
end
