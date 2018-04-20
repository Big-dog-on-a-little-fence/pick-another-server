Rails.application.routes.draw do
  mount ActionCable.server => '/cable'

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
    resources :sources, :repertoires, :lyrics, :charts, :comments
  end
  resources :articles do
    resources :comments
  end
  resources :genres, except: [:destroy]
  resources :jams, only: [:show, :new, :create, :index, :destroy] do
    resources :comments
  end
  resources :activities
  resources :comments do
    resources :comments
  end

  namespace :api do
    resources :jams, only: [:show, :new, :create]
    resources :users, only: [:index]
  end
end

