Rails.application.routes.draw do

  # Listings & Reservations
    resources :listings, only: [:index, :show, :new, :edit, :update] do
      resources :reservations, only: [:index, :show, :new, :edit, :update]
    end
    post "/listings" => "listings#create", as: "listings_create"
    post "/listings/:listing_id/reservations" => "reservations#create", as: "reservations_create"
    get "/search" => "listings#search", as: "listings_search"
# Listings & Reservations end

  #user accounts
  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "clearance/sessions", only: [:create]

  resources :users, controller: "clearance/users", only: [:create] do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
  end

  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  get "/sign_up" => "clearance/users#new", as: "sign_up"
 
#facebook authentication
resources :users, only: [:show, :edit, :update, :destroy]
  get "/auth/:provider/callback" => "sessions#create_from_omniauth"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 
 root 'listings#index'

end
