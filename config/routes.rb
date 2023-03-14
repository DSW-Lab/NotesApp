Rails.application.routes.draw do

  get "/index", to: "home#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  namespace 'api' do

    resources :users 

  end
  
end
