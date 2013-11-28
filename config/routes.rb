Onboard::Application.routes.draw do
  resources :users
  resources :jobs
  
  root "jobs#index"

end