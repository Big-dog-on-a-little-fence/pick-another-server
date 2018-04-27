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
  resources :instruments
  resources :banjos, controller: 'instruments', type: 'Banjo'
  resources :basses, controller: 'instruments', type: 'Bass'
  resources :cellos, controller: 'instruments', type: 'Cello'
  resources :fiddles, controller: 'instruments', type: 'Fiddle'
  resources :guitars, controller: 'instruments', type: 'Guitar'
  resources :mandolins, controller: 'instruments', type: 'Mandolin'
  resources :voices, controller: 'instruments', type: 'Voice'

  namespace :api do
    resources :jams, only: [:show, :new, :create]
    resources :users, only: [:index]
  end
end

