module V1
  class DashboardController < ApplicationController
    before_action :set_custom_search, only: [:update]

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

    def create
      candidate_search_configuration = current_user.custom_searches.create!(custom_search_params)
      
      candidate_search_configuration =
      CandidateSearchParameterSerializer.new(candidate_search_configuration)
      .serializable_hash.to_json
      
      json_response(candidate_search_configuration, :created)
    end

    def update
      @custom_search.update!(custom_search_params)
      @custom_search = CandidateSearchParameterSerializer.new(@custom_search).serializable_hash.to_json
      json_response(@custom_search, :no_content)
    end

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

    private

    def custom_search_params
      params.permit(
        :employment_status,
        :employment_history,
        :educational_background,
        :city,
        :country,
        :programming_languages,
        :web_frameworks,
        :other_technologies,
        :title_search,
        :keyword_search,
        :level_of_skill,
        :configuration_label,
        :search_type
      )
    end

    def set_custom_search
      @custom_search = current_user.custom_searches.find(params[:id])
    end
  end
end
