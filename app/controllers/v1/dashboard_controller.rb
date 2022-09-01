module V1
  class DashboardController < ApplicationController
    def hiring_pipeline
      if current_user.tracked_candidates.empty?
        json_response(
          {
            data:
              {
                message: 'You are not tracking any candidate',
                links: {
                  self: dashboard_search_configuration_path
                }
              }
          }
        )
      else
        candidates = CandidateSerializer.new(current_user.tracked_candidates).serializable_hash.to_json
        json_response(candidates)
      end
    end

    def search_configuration; end

    def custom_searches
      if current_user.custom_searches.empty?
        json_response(
          {
            data: 
            {
              message: 'You have no custom searches',
              links: {
                self: dashboard_search_configuration_path
              }
            }
          }
        )
      else  
        custom_searches = CandidateSearchParameterSerializer.new(current_user.custom_searches).serializable_hash.to_json
        json_response(custom_searches)
      end
    end

    def track_candidate; end
    
    def untrack_candidate; end
  end
end
