Rails.application.routes.draw do
  # this denotes what the landing page should be
  root to: "pages#home"

  get 'about', to: "pages#about", as: :about
  get 'contact', to: "pages#contact", as: :contact

  get 'restaurants', to: "restaurants#index"
  post 'restaurants', to: "restaurants#create"

  get 'restaurants/:id', to: 'restaurants#show', as: :restaurant
end
