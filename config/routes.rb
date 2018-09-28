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
    resources :instruments
    resources :accordions, controller: 'instruments', type: 'Accordion', except: [:index, :show]
    resources :banjos, controller: 'instruments', type: 'Banjo', except: [:index, :show]
    resources :basses, controller: 'instruments', type: 'Bass', except: [:index, :show]
    resources :cellos, controller: 'instruments', type: 'Cello', except: [:index, :show]
    resources :clarinets, controller: 'instruments', type: 'Clarinet', except: [:index, :show]
    resources :guitars, controller: 'instruments', type: 'Guitar', except: [:index, :show]
    resources :mandolins, controller: 'instruments', type: 'Mandolin', except: [:index, :show]
    resources :pianos, controller: 'instruments', type: 'Piano', except: [:index, :show]
    resources :saxophones, controller: 'instruments', type: 'Saxophone', except: [:index, :show]
    resources :trombones, controller: 'instruments', type: 'Trombone', except: [:index, :show]
    resources :violins, controller: 'instruments', type: 'Violin', except: [:index, :show]
    resources :voices, controller: 'instruments', type: 'Voice', except: [:index, :show]
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
  resources :instruments, only: [:index]
  resources :accordions, controller: 'instruments', type: 'Accordion', only: [:index, :show]
  resources :banjos, controller: 'instruments', type: 'Banjo', only: [:index, :show]
  resources :basses, controller: 'instruments', type: 'Bass', only: [:index, :show]
  resources :cellos, controller: 'instruments', type: 'Cello', only: [:index, :show]
  resources :clarinets, controller: 'instruments', type: 'Clarinet', only: [:index, :show]
  resources :guitars, controller: 'instruments', type: 'Guitar', only: [:index, :show]
  resources :mandolins, controller: 'instruments', type: 'Mandolin', only: [:index, :show]
  resources :pianos, controller: 'instruments', type: 'Piano', only: [:index, :show]
  resources :saxophones, controller: 'instruments', type: 'Saxophone', only: [:index, :show]
  resources :trombones, controller: 'instruments', type: 'Trombone', only: [:index, :show]
  resources :violins, controller: 'instruments', type: 'Violin', only: [:index, :show]
  resources :voices, controller: 'instruments', type: 'Voice', only: [:index, :show]

  namespace :api do
    resources :jams, only: [:show, :new, :create]
    resources :users, only: [:index]
  end
end
