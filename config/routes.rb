Rails.application.routes.draw do


  get '/csrf_token', to: 'csrf_tokens#show'

  namespace 'api' do

    resources :users 
    post "/login", to: "users#login"
    get "/auto_login", to: "users#auto_login"
    resources :notes

  end
  
end
