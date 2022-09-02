Rails.application.routes.draw do
  scope module: :v1, constraints: ApiVersion.new('v1', true) do
    # dashboard endpoints
    get '/dashboard/hiring-pipeline', to: 'dashboard#hiring_pipeline'
    get '/dashboard/search-configuration', to: 'dashboard#search_configuration'
    get '/dashboard/custom-searches', to: 'dashboard#custom_searches'
    
    post '/dashboard/create-candidate-search-configuration', to: 'dashboard#create'
    patch '/dashboard/:id/update-candidate-search-configuration', to: 'dashboard#update'
    delete '/dashboard/:id/remove-custom-search', to: 'dashboard#destroy'
    post '/dashboard/track-candidate', to: 'dashboard#track_candidate'
    delete '/dashboard/:candidate_id/untrack-candidate', to: 'dashboard#untrack_candidate'

    post '/auth/login', to: 'authentication#authenticate'
    post '/signup', to: 'users#create'
  end
end
