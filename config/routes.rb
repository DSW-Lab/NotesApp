Rails.application.routes.draw do

  namespace 'api' do

    resources :users 

  end

  resources :notes

  get '/notes', to: 'notes#index'
  
end
