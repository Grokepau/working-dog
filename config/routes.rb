Rails.application.routes.draw do
  devise_for :users
  resources :services, only: [:index, :show]

  get "dashboard", to: 'pages#dashboard'
  root to: 'services#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'pages/dashboard', to: 'pages#dashboard', as: :dashboard
end
