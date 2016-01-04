Rails.application.routes.draw do
  root 'static_pages#index'
  get '/welcome', to: 'static_pages#index'
  get '/about', to: 'static_pages#about'
  get '/jobs/:id/load', to: 'jobs#load', as: :job_load
  get '/jobs/:id/ready', to: 'jobs#ready', as: :job_ready
  resources :jobs, only: [:new, :create, :show]
  resources :cities, only: [:show]
end
