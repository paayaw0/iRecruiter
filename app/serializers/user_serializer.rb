class UserSerializer
  include JSONAPI::Serializer
  attributes :username, :email, :recruiter

  has_many :tracked_candidates, serializer: CandidateSerializer
  has_many :custom_searches, serializer: CandidateSearchParameterSerializer
end
