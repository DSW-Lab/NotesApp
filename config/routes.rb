Rails.application.routes.draw do


  get "/index", to: "home#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  namespace 'api' do

    resources :users 
    resources :notes

  end

  post "/login", to "users#login"
  get "/auto_login", to: "users#auto_login"

  get "/notes", to: "notes#index"
  
end
