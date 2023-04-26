Rails.application.routes.draw do


  get '/csrf_token', to: 'csrf_tokens#show'

  namespace 'api' do

    resources :users 
    resources :notes

  end

  get '/notes', to: 'notes#index'
  
end
