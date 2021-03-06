Rails.application.routes.draw do
  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "clearance/sessions", only: [:create]

  resources :users, only: [:create] do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
  end

  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  get "/sign_up" => "clearance/users#new", as: "sign_up"

  get 'users/cabinet'

  get 'pages/index'
  get 'pages/films'
  get 'pages/toys'
  get 'pages/gadgets'
  get 'pages/new'
  get 'pages/bin'
  get 'pages/discounts'
  get 'pages/mail'
  put 'pages/send_mail'

  get 'orders/delete_all'
  resources :orders

  resources :products
  # resources :pages

  get 'orders_histories/show_all'
  resources :orders_histories

  get 'discounts/discounts'
  get 'discounts/change'
  resources :discounts

  resources :comments

  root 'pages#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
