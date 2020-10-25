Rails.application.routes.draw do

  concern :paginatable do
    get '(page/:page)', action: :index, on: :collection, as: ''
  end
  root to: 'users#feed_photos'
  get '(page/:page)', to: 'users#feed_photos'

  get '/feed/albums', to: 'users#feed_albums'
  
  devise_for :users
  
  resources :users, concerns: :paginatable
  resources :photos, concerns: :paginatable
  resources :albums, concerns: :paginatable


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
