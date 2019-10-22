Rails.application.routes.draw do
  root 'home#index'

  devise_for :users
  
  ActiveAdmin.routes(self)
end
