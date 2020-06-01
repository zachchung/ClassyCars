Rails.application.routes.draw do
  root to: "pages#home"
  # root to: 'cars#index'
  resources :cars, except: :index do
    get :listmycars, on: :collection

    resources :reviews, only: [:new, :create]
  end
  resources :reviews, only: :destroy
  resources :bookings

  get "cars/search", to: "cars#search"
end



# BELOW ROUTES GENERATED:
# GET    /                 cars#index
# GET    /cars/listmycars  cars#listmycars
# GET    /cars/search      cars#search
# POST   /cars           cars#create
# GET    /cars/new       cars#new
# GET    /cars/:id/edit    cars#edit
# GET    /cars/:id      cars#show
# PATCH  /cars/:id     cars#update
# PUT    /cars/:id      cars#update
# DELETE /cars/:id      cars#destroy

# GET    /bookings        bookings#index
# POST   /bookings        bookings#create
# GET    /bookings/new     bookings#new
# GET    /bookings/:id/edit   bookings#edit
# GET    /bookings/:id     bookings#show
# PATCH  /bookings/:id      bookings#update
# PUT    /bookings/:id     bookings#update
# DELETE /bookings/:id      bookings#destroy

# POST   /cars/:car_id/reviews     reviews#create
# GET    /cars/:car_id/reviews/new reviews#new
# DELETE /reviews/:id           reviews#destroy
