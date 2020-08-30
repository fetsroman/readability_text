Rails.application.routes.draw do
  namespace 'api' do
    post '/sign_up', to: 'users#create'
    post '/sign_in', to: 'authentication#sign_in'
  end
end
