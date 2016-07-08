Rails.application.routes.draw do
  
  root 'users#dashboard'
  devise_for :users

  resources :users do
    member do
      get 'repetoire'
      get 'recordings'
      get 'settings'
    end
  end

  resources :tunes, except: [:destroy]
  resources :articles
  resources :genres, except: [:destroy]
  resources :jams, only: [:show, :new, :create, :destroy]
  
  ## custom routes
  #get 'user/repetoire', :to => 'users#repetoire'
  #get 'user/recordings', :to => 'users#recordings'
  
end

