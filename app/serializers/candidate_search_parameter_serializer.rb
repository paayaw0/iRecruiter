class CandidateSearchParameterSerializer
  include JSONAPI::Serializer

  attributes :employment_status,
             :city,
             :country,
             :employment_history,
             :educational_background,
             :programming_languages,
             :web_frameworks,
             :other_technologies,
             :title_search,
             :keyword_search,
             :configuration_label,
             :search_type
  
            #  find a way to return recruiter as type if user is recruiter and
            #  user as type if not recruiter
  belongs_to :user
end
