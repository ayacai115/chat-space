Rails.application.routes.draw do
  devise_for :users
  root 'messages#index'
  resources :groups, except: [:show, :destroy, :index] do
    resources :messages, only: [:index]
  end
end
