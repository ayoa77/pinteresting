Rails.application.routes.draw do
  resources :pins
  get 'braintree/new'
  post 'braintree/checkout'

  resources :posts
  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end
  get 'signup', to: 'users#new', as: 'signup'
  resources :users
  match 'auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  match 'auth/failure', to: redirect('/'), via: [:get, :post]
root 'pins#index'  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
