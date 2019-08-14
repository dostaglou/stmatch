Rails.application.routes.draw do
  devise_for :users
  root to: 'courses#index'
  resources :courses

  resources :courses, only: [:show] do
    resources :bookings, only: [:new, :create]
  end

  resources :bookings, only: [:index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
