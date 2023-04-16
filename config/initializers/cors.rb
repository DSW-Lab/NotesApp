Rails.application.config.middleware.insert_before 0, Rack::Cors do
    allow do
      origins '*'
      resource '*', 
      headers: :any, 
      methods: [:get, :put, :delete, :patch, :options, :head, :post]
    end
  end