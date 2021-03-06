Rails.application.routes.draw do
  devise_for :users
  root to: 'courses#index'
  resources :courses

  resources :courses, only: [:show] do
    resources :bookings, only: [:new, :create]
  end

  resources :bookings, only: [:index, :show, :destroy, :edit, :update]
  
  resources :courses, only: [:show] do
    resources :reviews, only: [:new, :create]
  end
  resources :reviews, only: [:index, :show]
  resources :users, only: [:show, :edit, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
