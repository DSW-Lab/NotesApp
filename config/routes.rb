Rails.application.routes.draw do


  get '/csrf_token', to: 'csrf_tokens#show'

  namespace :api, defaults: { format: :json } do
    get '/csrf_token', to: 'csrf_tokens#show'
    post 'login', to: 'sessions#create'
    delete 'logout', to: 'sessions#destroy'
    post 'register', to: 'registrations#create'
    resource :notes
    post 'notes', to: 'notes#create'
    delete 'notes', to: 'notes#destroy'
    put 'notes', to: 'notes#update'
    get 'notes', to: 'notes#index'
  end
  
end