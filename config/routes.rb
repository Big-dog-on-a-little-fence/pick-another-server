Rails.application.routes.draw do
  devise_for :users
  scope "/dog" do
    resources :users
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #root 'welcome#index'
  root 'users#dashboard'
  resources :articles
  
end
