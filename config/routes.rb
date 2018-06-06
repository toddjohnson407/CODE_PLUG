Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :courses do
    resources :bookings
  end
  get "/current_index", to: "courses#current_index"
  get "/bookings/current_index", to: "bookings#current_index"
end
