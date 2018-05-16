Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # A visitor can see the list of all restaurants.
  # GET "restaurants"  - index

  # He can add a new restaurant, and be redirected to the show view of that new restaurant.
  # GET "restaurants/new" - new
  # POST "restaurants" - create

  # He can see the details of a restaurant, with all the reviews related to the restaurant.
  # GET "restaurants/38"  - show

  # In our MVP, a visitor cannot update / delete any restaurant or review.
  # This is the role of the admin (i.e. you) - no need to generate
  # a new controller through namespace :admin routes,
  # as a developer you have the power to manipulate the DB from the rails console
  # if you want to update / delete any record.
  # does this means that we don't need delete and update actions? yes!
  # no need for namespace :admin

  # He can add a new review to a restaurant
  # GET "restaurants/38/reviews/new"
  # POST "restaurants/38/reviews"
  resources :restaurants, except: [:edit, :destroy, :update] do
  # we could leave the all resources, as long as we don't add the actions in the controller
    resources :reviews, only: [:new, :create]
  end


  root to: "restaurants#index"
end
