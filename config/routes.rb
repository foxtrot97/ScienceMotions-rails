Rails.application.routes.draw do
  get 'physics/solarsystem'

  get 'chemistry/indicators'
  post 'chemistry/indicators'
  
  get 'chemistry/periodictable'
  
  get 'container', to: 'container#index'
  get 'team', to: 'team#index'  
  resources :completed_lessons
  resources :lessons
  resources :indicators
  resources :chemistry
  devise_for :users
  resources :users do
    resources :completed_lessons
  end
  get 'pages/chemistry'

  root to: redirect('/lessons')  
  resources :lessons
  resources :indicators
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/static/:index" => "static#show"
  get "/static/:navigation" => "static#show"
  get 'chemistry/indicators' => 'enquiries#new'
  
end

