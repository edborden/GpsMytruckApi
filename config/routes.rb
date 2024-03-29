Rails.application.routes.draw do
  resources :sessions, only: [:create, :index, :destroy]
  resources :message, only: :create
  resources :system_status, only: :index
  resources :companies, only: [:create,:update,:destroy]
  post 'companies/report', to: 'companies#report'
  resources :devices, only: [:create,:update,:destroy] do
  	resources :locations, only: :index
  	resources :mileage, only: :index
  end
end