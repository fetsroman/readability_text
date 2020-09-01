Rails.application.routes.draw do
  namespace :admin do
    get '/sign_in', to: 'sessions#new'
    post '/sign_in', to: 'sessions#create'

    resources :texts
    resources :users

    root to: "texts#index"
  end
  namespace 'api' do
    post '/sign_up', to: 'users#create'
    post '/sign_in', to: 'authentication#sign_in'

    resources :texts, only: [:index, :show, :create]
  end
end
