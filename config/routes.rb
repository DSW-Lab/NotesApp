Rails.application.routes.draw do

  # devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }
  devise_for :users, controllers: { sessions: 'sessions' }

    # Routes for user authentication

  
    post "/signup", to: "users#create"
    post "/login", to: "sessions#create"
    delete "/logout", to: "sessions#destroy"
    
    # Routes for friendship relationships
    # post "/users/:id/friend_request", to: "friendships#friend_request"
    # post "/users/:id/accept_request", to: "friendships#accept_request"
    # delete "/users/:id/remove_friend", to: "friendships#remove_friend"
  
  


end
