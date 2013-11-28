Onboard::Application.routes.draw do
  get "sessions/new"
  resources :users
  resources :jobs

  #Because a user can only have on session at a time, the resource and symbol are singular
  # use singular resources for one time operations
  resource :session
  
  root "jobs#index"


end