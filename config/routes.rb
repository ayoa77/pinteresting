Rails.application.routes.draw do
  resources :pins
  resources :users
  get 'braintree/new'
  post 'braintree/checkout'

  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end
  get 'post_pin', to: 'pins#create', as: 'post_pin'
  get 'signup', to: 'users#new', as: 'signup'
  match 'auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  match 'auth/failure', to: redirect('/'), via: [:get, :post]
  root 'pins#index'  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
