Rails.application.routes.draw do
  scope module: :v1, constraints: ApiVersion.new('v1', true) do
    get '/dashboard/hiring_pipeline', to: 'dashboard#hiring_pipeline'
    get '/dashboard/search_configuration', to: 'dashboard#search_configuration'
    get '/dashboard/custom_searches', to: 'dashboard#custom_searches'
    
    post '/auth/login', to: 'authentication#authenticate'
    post '/signup', to: 'users#create'
  end
end
