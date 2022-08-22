module V1
  class DashboardController < ApplicationController
    def hiring_pipeline
      if current_user.tracked_candidates.empty?
        json_response(
          {
            data:
              {
                message: 'You are not tracking any candidate'
              }
          }
        )
      else
        candidates = CandidateSerializer.new(current_user.tracked_candidates).serializable_hash.to_json
        json_response(candidates)
      end
    end

    def search_configuration; end
  end
end
