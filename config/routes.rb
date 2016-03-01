Rails.application.routes.draw do
  mount API => '/'
  namespace :admin do
    root  to: 'sessions#new'
    get 'api_token' => 'home#api_token'
    get 'login' =>'sessions#new', as: :login
    get 'logout' =>'sessions#destroy', as: :logout
    post 'login' => 'sessions#create'
    resources :departments
    resources :employes 
  end
end
