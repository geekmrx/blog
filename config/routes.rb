Rails.application.routes.draw do
  root "articles#index"

  # resources method -> maps all of the conventional routes for a collection of resources
  resources :articles
end
