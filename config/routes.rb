Rails.application.routes.draw do

  root 'chat_rooms#index'

  devise_for :users
  
  resources :chat_rooms, only: [:new, :create, :show, :index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
