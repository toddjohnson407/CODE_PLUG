Rails.application.routes.draw do


  get 'documents/index'
  get 'documents/new'
  get 'documents/create'
  get 'documents/destroy'
  devise_for :users
  resources :users, only: [:show]

  # mount ActionCable.server => '/cable'

  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :courses do
    resources :bookings
    resources :reviews
  end

  resources :chats, only: [:show, :index, :create] do
     resources :messages, only: [:index, :create]
  end

  get "/current_index", to: "courses#current_index"
  get "/add_teacher", to: "courses#add_teacher"
  get "/bookings/current_index", to: "bookings#current_index"
  get "/teacher", to: "pages#teacher"
  get "/profile", to: "pages#profile"


  post "/current_locations", to: "pages#user_location"
end
