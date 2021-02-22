Rails.application.routes.draw do
  root to: 'cocktails#index'

  resources :cocktails, only: [:show, :new, :create] do
    resources :doses, only: [:create]
    resources :reviews, only: [:create]
  end
  resources :doses, only: [:destroy]
  resources :reviews, only: [:destroy]
end
