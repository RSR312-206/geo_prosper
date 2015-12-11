Rails.application.routes.draw do
  root 'static_pages#index'
  get '/welcome', to: 'static_pages#index'
  resources :jobs, only: [:new, :create , :show]
end
