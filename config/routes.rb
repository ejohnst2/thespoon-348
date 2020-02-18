Rails.application.routes.draw do
  # this denotes what the landing page should be
  root to: 'restaurants#index'
  get 'about', to: 'pages#about', as: :about
  get 'contact', to: 'pages#contact', as: :contact

  resources :restaurants do
    # need to nest these because we need the restaurant ID
    resources :reviews, only: [:new, :create, :index]

    collection do
      get 'top'
    end

    member do
      get 'chef'
    end
  end

  namespace :admin do
    resources :restaurants, only: [:index]
  end

  # don't need to nest this because we don't need the restaurant ID
  resources :reviews, only: [:show, :destroy]
end
