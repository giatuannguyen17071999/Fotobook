Rails.application.routes.draw do
  root to: 'users#feed_photos'
  devise_for :users
  resources :users
  resources :photos
  resources :albums

  # devise_for :users, skip: :all

  # devise_for :users, controllers: {
  #   sessions: 'users/sessions',
  #   registrations: 'users/registrations'
  # }

  # devise_scope :user do
  #   get 'sign_in', to: 'devise/sessions#new'
  #   get 'sign_up', to: 'devise/registrations#new'
  # end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
