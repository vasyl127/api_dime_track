Rails.application.routes.draw do
  devise_for :users, controllers: { tokens:"tokens" }

  get :self, to: 'users#self'

  resources :categories
  resources :costs
end
