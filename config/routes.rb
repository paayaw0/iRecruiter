Rails.application.routes.draw do
  scope module: :v1, constraints: ApiVersion.new('v1', true) do
    get '/dashboard/hiring-pipeline', to: 'dashboard#hiring_pipeline'
    get '/dashboard/search-configuration', to: 'dashboard#search_configuration'
    get '/dashboard/custom-searches', to: 'dashboard#custom_searches'

    post '/dashboard/create-candidate-search-configuration', to: 'dashboard#create'
    patch '/dashboard/:id/update-candidate-search-configuration', to: 'dashboard#update'

    post '/auth/login', to: 'authentication#authenticate'
    post '/signup', to: 'users#create'
  end
end
