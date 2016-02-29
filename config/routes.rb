Rails.application.routes.draw do
  # mount API => '/'
  namespace :admin do
    root  to: 'sessions#new'

    get 'login' =>'sessions#new', as: :login
    get 'logout' =>'sessions#destroy', as: :logout
    post 'login' => 'sessions#create'
    resources :departments
    resources :employers 
  end
end
