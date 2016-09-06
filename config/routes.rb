Rails.application.routes.draw do

  root 'users#dashboard'
  devise_for :users, controllers: { sessions: 'sessions' }

  resources :users do
    member do
      get 'repertoire'
      get 'recordings'
      get 'settings'
    end
  end

  resources :tunes, except: [:destroy] do
    resources :sources, :repertoires, :lyrics
  end
  resources :articles
  resources :genres, except: [:destroy]
  resources :jams, only: [:show, :new, :create, :destroy]
  resources :activities

  namespace :api do
    resources :jams, only: [:show, :new, :create]
    resources :users, only: [:index]
  end
end

